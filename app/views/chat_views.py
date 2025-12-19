from django.shortcuts import render, redirect, HttpResponse, get_object_or_404
from django.contrib.auth.decorators import login_required
from app.models import share_table, user_table, ChatMessage_table
from django.contrib import messages
from django.db.models import Q
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
import datetime

@login_required(login_url='/login')
def individual_share(request):
    kk = user_table.objects.all()
    current_user=request.user.id
    return render(request, "user/individual share.html", {"val": kk, "current_user":current_user})

@login_required(login_url='/login')
def individual_share_post(request):
    if request.method == 'POST':
        language = request.POST['language']
        topic = request.POST['title']
        touser_ids = request.POST.getlist('touser') # List of user IDs
        code = request.POST['code']

        from_user = user_table.objects.get(LOGIN=request.user)

        for touser_id in touser_ids:
            try:
                to_user = user_table.objects.get(id=int(touser_id))
            except ValueError:
                 messages.error(request, 'Invalid user ID')
                 return redirect('/individual_share')

            ob = share_table()
            ob.code = code
            ob.Language = language
            ob.topic = topic
            ob.FROMUSER = from_user
            ob.TOUSER = to_user
            ob.date = datetime.datetime.now().date()
            ob.status = 'Pending'
            ob.save()

        request.session['code'] = ""
        messages.success(request, 'Code successfully shared with selected users')
        return redirect('/individual_share')
    else:
        return render(request, 'user/individual share.html')

@login_required(login_url='/login')
def sharetofriend(request):
    user_id = request.user.id # Use Auth ID if that's what's stored in session['lid'] equivalent

    # Models: FROMUSER and TOUSER are ForeignKey to user_table.
    # request.user.id is Auth ID.
    # So we need FROMUSER__LOGIN__id=request.user.id
    
    shared_programs = share_table.objects.filter(
        Q(FROMUSER__LOGIN__id=user_id) | Q(TOUSER__LOGIN__id=user_id)
    ).order_by('-id')

    unique_users = set()
    filtered_ob = []

    for item in shared_programs:
        # user_table is needed for ID comparison if item stores user_table
        # wait. item.FROMUSER is user_table object. item.FROMUSER.LOGIN is Auth User.
        # item.FROMUSER.LOGIN.id compared to request.user.id
        
        if item.FROMUSER.LOGIN.id == user_id:
            other_user = item.TOUSER 
        else:
            other_user = item.FROMUSER 

        if other_user.LOGIN.id not in unique_users:
            unique_users.add(other_user.LOGIN.id)

            has_unread = share_table.objects.filter(
                FROMUSER=other_user,
                TOUSER__LOGIN__id=user_id,
                status="Pending"
            ).exists()

            # Note: The template likely expects 'chat_id' which was `other_user.LOGIN.id`.
            # `other_user` is user_table. `other_user.LOGIN` is Auth user. 
            # So `other_user.LOGIN.id` is the Auth ID.
            
            filtered_ob.append({
                "other_user": other_user,
                "chat_id": other_user.LOGIN.id, 
                "has_unread": has_unread
            })

    return render(request, "user/share to friend view all.html", {
        "val": filtered_ob,
        "current_user_id": user_id
    })

@csrf_exempt
@login_required(login_url='/login')
def mark_as_read(request, chat_id):
    if request.method == "POST":
        user_id = request.user.id

        share_table.objects.filter(
            FROMUSER__LOGIN__id=chat_id, # chat_id is Auth ID of sender
            TOUSER__LOGIN__id=user_id,
            status="Pending"
        ).update(status="Viewed")

        return JsonResponse({"message": "Messages marked as read"})

@login_required(login_url='/login')
def user_chats(request, user_id):
    current_user_id = request.user.id
    if user_id == current_user_id:
        return redirect("sharetofriend")

    # user_id is passed as Auth ID (from sharetofriend).
    clicked_user = get_object_or_404(user_table, LOGIN__id=user_id)

    chats = share_table.objects.filter(
        (Q(FROMUSER__LOGIN__id=current_user_id) & Q(TOUSER__LOGIN__id=user_id)) |
        (Q(FROMUSER__LOGIN__id=user_id) & Q(TOUSER__LOGIN__id=current_user_id))
    ).order_by('-id')

    return render(request, "user/user_chats.html", {
        "chats": chats,
        "current_user_id": current_user_id,
        "clicked_user": clicked_user
    })

@login_required(login_url='/login')
def individualchatcodeview(request,id):
    ob = share_table.objects.get(id=id)
    return render(request,"user/individual chat code view.html",{"val":ob})

@login_required(login_url='/login')
def sharetofriendsearch(request):
    name = request.POST['name']
    ob = share_table.objects.filter(TOUSER__LOGIN__username__icontains=name, FROMUSER__LOGIN__id=request.user.id)
    return render(request, "user/share to friend view all.html", {"val": ob})

@login_required(login_url='/login')
def individualuserfriendcodeview(request, id):
    ob = share_table.objects.get(id=id)
    return render(request, "user/individualuserfriendcodeview.html", {"val": ob})

@login_required
def chat_view(request, user_id):
    current_user = get_object_or_404(user_table, LOGIN__id=request.user.id)
    receiver = get_object_or_404(user_table, LOGIN__id=user_id)

    messages_qs = ChatMessage_table.objects.filter(
        (Q(FROM_USER=current_user) & Q(TO_USER=receiver)) |
        (Q(FROM_USER=receiver) & Q(TO_USER=current_user))
    ).order_by("id")

    return render(request, 'user/chat.html', {
        'receiver': receiver,
        'messages_qs': messages_qs,
        'current_user': current_user,
        'current_user_id': request.user.id
    })

@login_required
def send_message(request):
    if request.method == "POST":
        receiver_id = request.POST.get("receiver_id")
        message = request.POST.get("message")

        if receiver_id and message:
            receiver = get_object_or_404(user_table, LOGIN__id=receiver_id)
            sender = get_object_or_404(user_table, LOGIN__id=request.user.id)

            ChatMessage_table.objects.create(FROM_USER=sender, TO_USER=receiver, message=message)

        return redirect(request.META.get('HTTP_REFERER', 'user_chats'))

    return redirect('user_chats')
