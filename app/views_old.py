import datetime
import smtplib
from email.mime.text import MIMEText
from django.shortcuts import render, get_object_or_404, redirect
from django.contrib import auth
from django.contrib.auth.decorators import login_required
from django.core.exceptions import ObjectDoesNotExist
from django.core.files.storage import FileSystemStorage
from django.shortcuts import HttpResponse
import json
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.db.models import Q
# Create your views here.
from app.models import *
from django.contrib.auth.hashers import make_password


def login(request):
    return render(request, "login.html")



def logout(request):
    auth.logout(request)
    return render(request, "user/index.html")





# In views.py

from django.contrib import auth

def logincode(request):
    if request.method == "POST":
        u = request.POST['username']
        p = request.POST['password']
        
        # 1. Authenticate checks the built-in User table securely
        user = auth.authenticate(username=u, password=p)
        
        if user is not None:
            # 2. Actually log THEM in (creates the session securely)
            auth.login(request, user)
            
            # 3. Check their profile type (User vs Admin)
            try:
                # Access the profile we linked in Step 1
                if user.is_superuser:
                    return HttpResponse('''<script>window.location="/adminhome2"</script>''')
                
                elif user.profile.type == 'user':
                    # Set session data for your templates if needed
                    request.session['name'] = user.username
                    request.session['img'] = user.profile.photo.url
                    return HttpResponse('''<script>alert("Login Success"); window.location="/"</script>''')
                    
                elif user.profile.type == 'blocked':
                     auth.logout(request) # Kick them out
                     return HttpResponse('''<script>alert("Account Blocked"); window.location="/adminhome2"</script>''')
                     
            except user_table.DoesNotExist:
                # This handles superusers created via terminal who don't have a profile yet
                return HttpResponse('''<script>window.location="/adminhome2"</script>''')
        else:
            return HttpResponse('''<script>alert("Invalid Username or Password"); window.location="/adminhome2"</script>''')
        

def registration(request):
    return render(request,"registration.html")



from django.shortcuts import render, HttpResponse
from django.contrib.auth.models import User
# Ensure you import your UserProfile model (rename user_table to UserProfile if you followed the guide)
from .models import user_table # or UserProfile

def registration_post(request):
    if request.method == "POST":
        try:
            # 1. Fetch data using YOUR ORIGINAL HTML NAMES
            name = request.POST['n1']
            email = request.POST['emaill']    # Was 'n2' in the error
            username = request.POST['usrname']
            password = request.POST['pwd']
            age = request.POST['age']
            gender = request.POST['radio']
            phone = request.POST['phone']
            address = request.POST['address']
            
            # Handle Image Upload safely
            if 'file' in request.FILES:
                photo = request.FILES['file']
            else:
                return HttpResponse("Please upload a photo")

            # 2. Check if user already exists
            if User.objects.filter(username=username).exists():
                 return HttpResponse('''<script>alert("Username already exists"); window.location="/registration"</script>''')
            
            # 3. Create the Safe Django User (Handles hashing automatically)
            # We use 'username' for login. You can also use email if you prefer.
            user = User.objects.create_user(username=username, email=email, password=password)
            
            # 4. Create your Custom Profile linked to it
            # Note: I am using 'user_table' here since that is your model name. 
            # If you renamed it to 'UserProfile', change it below.
            profile = user_table() 
            profile.user = user  # <--- LINKING TO THE AUTH SYSTEM
            profile.name = name
            profile.age = age
            profile.gender = gender
            profile.phone = phone
            profile.address = address
            profile.photo = photo
            profile.type = 'user'
            profile.save()
            
            return HttpResponse('''<script>alert("Registered Successfully"); window.location="/login"</script>''')

        except Exception as e:
            print(e) # Print error to terminal for debugging
            return HttpResponse(f"Error during registration: {e}")


from django.core.mail import send_mail
from django.conf import settings
from django.http import HttpResponse
from django.shortcuts import redirect
from .models import user_table


def forgot_password_reset(request):
    if request.method == 'POST':
        email_or_username = request.POST.get('textfield')

        try:
            # Check if input is email
            user = user_table.objects.get(email=email_or_username)
        except user_table.DoesNotExist:
            try:
                # Check if input is username
                user = user_table.objects.get(LOGIN__username=email_or_username)
            except user_table.DoesNotExist:
                return HttpResponse(
                    '''<script>alert('Invalid email/username');window.location='/forgotpassword'</script>'''
                )

        # Send email with password (not recommended for production)
        subject = 'Your Password'
        message = f'Your password is: {user.LOGIN.password}'
        from_email = settings.EMAIL_HOST_USER
        recipient_list = [user.email]

        try:
            send_mail(subject, message, from_email, recipient_list)
            return HttpResponse(
                '''<script>alert('Email sent!');window.location='/'</script>'''
            )
        except Exception as e:
            print(f"Failed to send email: {e}")
            return HttpResponse(
                '''<script>alert('Failed to send email.');window.location='/forgotpassword'</script>'''
            )
    return redirect('/forgotpassword')

def forgotpassword(request):
    return render(request,"forgot password.html")

@login_required(login_url='/login')
def adminhome(request):
    return render(request,"admin/admin home.html")


@login_required(login_url='/login')
def adminhome2(request):
    return render(request,"admin/index.html")


def userhome(request):
    try:
        user_id = request.session['lid']  # Try to get the session key
        print("User ID:", user_id)
    except KeyError:  # Handle missing session key
        user_id = None  # Assign None or a default value
        print("Session key 'lid' not found!")

    return render(request, "user/index.html", {"user_id": user_id})


@login_required(login_url='/login')
def exampleprogram(request):
    ob=sample_programs.objects.all().order_by('-id')
    return render(request,"user/Example Program.html",{"val":ob})




@login_required(login_url='/login')
def examplesearch1(request):
    exsearch = request.POST['select']
    top = request.POST['exsearch']
    # if exsearch=="":
    #     ob=sample_programs.objects.filter(Q(topic__icontains=top,Language__icontains=exsearch)|Q(Language__icontains=exsearch)).order_by('-id')
    #     return render(request,"user/Example Program.html",{"val":ob,"e":exsearch,"t":top})
    # else:
    ob=sample_programs.objects.filter(topic__icontains=top,Language__icontains=exsearch).order_by('-id')
    return render(request,"user/Example Program.html",{"val":ob,"e":exsearch,"t":top})

@login_required(login_url='/login')
def exampleprogramview(request,id):
    ob=sample_programs.objects.get(id=id)
    return render(request,"user/individual example program.html",{"val":ob})


@login_required(login_url='/login')
def individual_user(request,id):
    ob = user_table.objects.get(id=id)
    return render(request,"admin/individual_view_block_user.html",{"val":ob})


@login_required(login_url='/login')
def viewcode(request):
    ob=code_table.objects.all().order_by('-id')
    return render(request,"admin/view code.html",{"val":ob})


@login_required(login_url='/login')
def userviewcode(request):
    ob=code_table.objects.filter(USER__LOGIN__id=request.session['lid']).order_by('-date')
        # .order_by('-time')
    return render(request,"user/user view code.html",{"val":ob})


@login_required(login_url='/login')
def user_code_delete(request, id):
    try:
        ob = get_object_or_404(code_table, id=id)
        ob.delete()
        return HttpResponse('''
            <script>
                alert('Program Deleted');
                window.location = '/userviewcode';  // Redirect with session ID
            </script>
        ''')
    except Exception as e:
        print(f"Error deleting code: {e}")
        return HttpResponse('''
            <script>
                alert('Error deleting code. Please try again.');
                window.location = '/userviewcode';  // Redirect with session ID
            </script>
        ''')




@login_required(login_url='/login')
def viewcodesearch(request):
    name=request.POST['name']
    ob=code_table.objects.filter(USER__name__icontains=name)
    return render(request,"admin/view code.html",{"val":ob})





# @login_required(login_url='/login')
# def sharetofriend(request):
#     user_id = request.session['lid']
#     ob = share_table.objects.filter(FROMUSER__LOGIN__id=user_id).order_by('-id')
#
#     # Track unique users
#     unique_users = set()
#     filtered_ob = []
#
#     for item in ob:
#         user_name = item.TOUSER.name if item.TOUSER.LOGIN.id != user_id else item.FROMUSER.name
#         if user_name not in unique_users:
#             unique_users.add(user_name)
#             filtered_ob.append(item)
#
#     return render(request, "user/share to friend view all.html", {"val": filtered_ob, "current_user_id": user_id})



from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt

@csrf_exempt
@login_required(login_url='/login')
def mark_as_read(request, chat_id):
    if request.method == "POST":
        user_id = request.session['lid']

        # Update all messages from the other user to "Viewed"
        share_table.objects.filter(
            FROMUSER__LOGIN__id=chat_id,
            TOUSER__LOGIN__id=user_id,
            status="Pending"
        ).update(status="Viewed")

        return JsonResponse({"message": "Messages marked as read"})






@login_required(login_url='/login')
def sharetofriend(request):
    user_id = request.session['lid']

    # Fetch shared programs where the current user is either the sender or receiver
    shared_programs = share_table.objects.filter(
        Q(FROMUSER__LOGIN__id=user_id) | Q(TOUSER__LOGIN__id=user_id)
    ).order_by('-id')

    unique_users = set()
    filtered_ob = []

    for item in shared_programs:
        if item.FROMUSER.LOGIN.id == user_id:
            other_user = item.TOUSER  # The user who received the share
        else:
            other_user = item.FROMUSER  # The user who sent the share

        if other_user.LOGIN.id not in unique_users:
            unique_users.add(other_user.LOGIN.id)

            # Check if there are unread messages (Pending status)
            has_unread = share_table.objects.filter(
                FROMUSER=other_user,
                TOUSER__LOGIN__id=user_id,
                status="Pending"
            ).exists()

            filtered_ob.append({
                "other_user": other_user,
                "chat_id": other_user.LOGIN.id,  # ID to pass for chat
                "has_unread": has_unread  # Indicates if there's an unread message
            })

    return render(request, "user/share to friend view all.html", {
        "val": filtered_ob,
        "current_user_id": user_id
    })




@login_required(login_url='/login')
def user_chats(request, user_id):
    current_user_id = request.session.get('lid')  # Get logged-in user ID

    # Ensure we are getting the other user, not the current user
    if user_id == current_user_id:
        return redirect("sharetofriend")  # Redirect back if the user ID is wrong

    # Fetch the clicked user correctly
    clicked_user = get_object_or_404(user_table, LOGIN__id=user_id)

    # Get chat history between the logged-in user and clicked user
    chats = share_table.objects.filter(
        (Q(FROMUSER__LOGIN__id=current_user_id) & Q(TOUSER__LOGIN__id=user_id)) |
        (Q(FROMUSER__LOGIN__id=user_id) & Q(TOUSER__LOGIN__id=current_user_id))
    ).order_by('-id')

    return render(request, "user/user_chats.html", {
        "chats": chats,
        "current_user_id": current_user_id,
        "clicked_user": clicked_user  # Pass the correct clicked user
    })



@login_required(login_url='/login')
def individualchatcodeview(request,id):
    ob = share_table.objects.get(id=id)
    return render(request,"user/individual chat code view.html",{"val":ob})



@login_required(login_url='/login')
def sharetofriendsearch(request):
    name = request.POST['name']
    ob = share_table.objects.filter(TOUSER__name__icontains=name,FROMUSER__LOGIN__id=request.session['lid'])
    return render(request, "user/share to friend view all.html", {"val": ob})


@login_required(login_url='/login')
def individualuserfriendcodeview(request, id):
    ob = share_table.objects.get(id=id)
    return render(request, "user/individualuserfriendcodeview.html", {"val": ob})





















@login_required
def chat_view(request, user_id):
    current_user = get_object_or_404(user_table, LOGIN__id=request.session.get('lid'))  # Get the logged-in user
    receiver = get_object_or_404(user_table, LOGIN__id=user_id)  # Get the clicked user

    # Fetch messages in ascending order (oldest messages first)
    messages = ChatMessage_table.objects.filter(
        (models.Q(FROM_USER=current_user) & models.Q(TO_USER=receiver)) |
        (models.Q(FROM_USER=receiver) & models.Q(TO_USER=current_user))
    ).order_by("id")  # Order by ascending ID

    return render(request, 'user/chat.html', {
        'receiver': receiver,
        'messages': messages,
        'current_user': current_user,
        'current_user_id': current_user.LOGIN.id  # Pass the current user's ID for comparison
    })

@login_required
def send_message(request):
    if request.method == "POST":
        receiver_id = request.POST.get("receiver_id")
        message = request.POST.get("message")

        if receiver_id and message:
            receiver = get_object_or_404(user_table, LOGIN__id=receiver_id)
            sender = get_object_or_404(user_table, LOGIN__id=request.session.get('lid'))

            ChatMessage_table.objects.create(FROM_USER=sender, TO_USER=receiver, message=message)

        return redirect(request.META.get('HTTP_REFERER', 'user_chats'))  # Redirects back to chat

    return redirect('user_chats')















#
# def examplesearch(request):
#     name=request.POST['exsearch']
#     ob=sample_programs.objects.filter(topic__icontains=name)
#     return render(request,"admin/Example Program.html",{"val":ob})




@login_required(login_url='/login')
def individualcodeview(request,id):
    ob = code_table.objects.get(id=id)
    return render(request,"admin/individual code view.html",{"val":ob})



@login_required(login_url='/login')
def individualusercodeview(request,id):
    ob = code_table.objects.get(id=id)
    request.session['cid']=id
    return render(request,"user/user individual code view.html",{"val":ob})



@login_required(login_url='/login')
def vieworblocksearch(request):
    name=request.POST['name']
    ob=user_table.objects.filter(name__startswith=name)
    return render(request,"admin/View or block.html",{"val":ob,"name1":name})








@login_required(login_url='/login')
def feedback(request):
    ob = feedback_table.objects.all().order_by('-id')
    return render(request,"admin/view feedback.html",{"val":ob})









@login_required(login_url='/login')
def complaint(request):
    ob = complaint_table.objects.all().order_by('-id')
    return render(request,"admin/view complaint.html",{"val":ob})


@login_required(login_url='/login')
def replycomplaint(request,cid):
    request.session["cid"]=cid
    return render(request,"admin/send reply.html")




@login_required(login_url='/login')
def replycomplaintdb(request):
    complaint = request.POST['reply']
    ob=complaint_table.objects.get(id=request.session["cid"])
    ob.reply=complaint
    ob.save()
    return HttpResponse('''<script>alert('Replied successfully');window.location='/complaint'</script>''')








@login_required(login_url='/login')
def vieworblock(request):
    users = user_table.objects.filter(LOGIN__type__in=['user', 'blocked'])
    return render(request, "admin/View or block.html", {"val": users})


# def vieworblocksearch(request):
#     name=request.POST['name']
#     ob=user_table.objects.filter(name__startswith=name)
#     return render(request,"admin/View or block.html",{"val":ob})




@login_required(login_url='/login')
def block_user(request, id):
    ob1 = login_table.objects.get(id=id)
    ob1.type = "blocked"
    ob1.save()
    return HttpResponse('''<script> alert('Account blocked');window.location='/vieworblock'</script>''')

@login_required(login_url='/login')
def unblock_user(request, id):
    ob1 = login_table.objects.get(id=id)
    ob1.type = "user"
    ob1.save()
    return HttpResponse('''<script> alert('Account unblocked');window.location='/vieworblock'</script>''')


#-------------------------------------user--------------------------



@login_required(login_url='/login')
def history(request):
    return render(request, "user/history.html")



@login_required(login_url='/login')
def historycode(request):
    return render(request,"user/history code.html")




@login_required(login_url='/login')
def sampleprogram(request):
    ob = sample_programs.objects.all().order_by('-id')
    return render(request, "admin/sampleprogram.html", {"val": ob})




@login_required(login_url='/login')
def admindeletesampleprograms (request,id):
    ob = sample_programs.objects.get(id=id)
    ob.delete()
    return HttpResponse(f'''
               <script>
                   alert('Program Deleted');
                   window.location = '/sampleprogram'  // Redirect with session ID (kk)
               </script>
           ''')




@login_required(login_url='/login')
def examplesearch(request):
    exsearch = request.POST['exsearch']
    ob = sample_programs.objects.filter(topic__icontains=exsearch).order_by('-id')
    return render(request, "admin/sampleprogram.html", {"val": ob})




@login_required(login_url='/login')
def sampleprogramview(request,id):
    ob=sample_programs.objects.get(id=id)
    request.session['aid'] = id
    return render(request,"admin/sampleprogramview.html",{"val":ob})




@login_required(login_url='/login')
def addsampleprogram(request):
    return render(request, "admin/addsampleprogram.html")




@login_required(login_url='/login')
def addsampleprogram_post(request):
    code = request.POST['examplecode']
    topic = request.POST['topic']
    lang = request.POST['language']
    ob = sample_programs()
    ob.code=code
    ob.Language=lang
    ob.date = datetime.datetime.now().date()
    ob.topic=topic
    ob.save()
    return HttpResponse('''<script>alert('sample program uploaded sucessfully');window.location='/sampleprogram'</script>''')






@login_required(login_url='/login')
def usercode_post(request):
    code = request.POST['codee']

    ob = code_table()
    ob.code=code
    ob.USER = user_table.objects.get(LOGIN=request.session["lid"])
    ob.date = datetime.datetime.now().date()
    ob.save()
    return HttpResponse('''<script>alert('feedback sent sucessfully');window.location='/sendfeedback'</script>''')




@login_required(login_url='/login')
def usercodesave(request):

    return render(request, "user/savecode.html")





@login_required(login_url='/login')
def usercodesave_post(request):
    if request.method == 'POST':
        code = request.POST['examplecode']
        topic = request.POST['topic']
        lang = request.POST['language']

        ob = code_table()
        ob.code = code
        ob.language = lang
        ob.topic = topic
        ob.USER = user_table.objects.get(id=request.session["lid"])  # Fetch the user instance
        ob.date = datetime.datetime.now().date()
        ob.save()
        request.session['code']=""
        return HttpResponse('''<script>alert('Code successfully saved');window.location='/usercodesave'</script>''')
    else:
        return render(request, 'user/usercodesave.html')





@login_required(login_url='/login')
def user_program_edit_save(request):
    ob = code_table.objects.get(id=request.session['cid'])
    return render(request, "user/edit user individual saved program.html",{"i":ob})





@login_required(login_url='/login')
def user_program_edit_save_post(request):
    if request.method == 'POST':
        code = request.POST['examplecode']
        topic = request.POST['topic']
        lang = request.POST['language']
        # idd=request.session["id"]
        ob = code_table.objects.get(id=request.session['cid'])
        ob.code = code
        ob.language = lang
        ob.topic = topic
        ob.USER = user_table.objects.get(id=request.session["lid"])  # Fetch the user instance
        ob.date = datetime.datetime.now().date()
        ob.save()
        request.session['code']=""
        return HttpResponse('''<script>alert('Code successfully edited');window.location='/userviewcode'</script>''')
    else:
        return render(request, 'user/usercodesave.html')



@login_required(login_url='/login')
def admin_sample_program_edit(request):
    ob = sample_programs.objects.get(id=request.session['aid'])
    return render(request, "admin/admin_sample_program_edit.html",{"i":ob})





@login_required(login_url='/login')
def admin_sample_program_edit_post(request):
    if request.method == 'POST':
        code = request.POST['examplecode']
        topic = request.POST['topic']
        lang = request.POST['language']
        # idd=request.session["id"]
        ob = sample_programs.objects.get(id=request.session['aid'])
        ob.code = code
        ob.Language = lang
        ob.topic = topic
        ob.USER = user_table.objects.get(id=request.session["lid"])  # Fetch the user instance
        ob.date = datetime.datetime.now().date()
        ob.save()
        request.session['code']=""
        return HttpResponse('''<script>alert('Code successfully edited');window.location='/sampleprogram'</script>''')
    else:
        return render(request, 'admin/sampleprogram.html')



@login_required(login_url='/login')
def group_code_edit(request,id):
    request.session['scid']=id
    ob = share_group_table.objects.get(id=id)
    return render(request, "user/group code edit.html", {"i": ob})


@login_required(login_url='/login')
def group_code_edit_post(request):
    if request.method == 'POST':
        kk = request.session['gid']
        code = request.POST['examplecode']
        topic = request.POST['topic']
        lang = request.POST['language']

        ob = share_group_table.objects.get(id=request.session['scid'])
        # Update the object's fields
        ob.code = code
        ob.Language = lang
        ob.topic = topic
        ob.date = datetime.datetime.now().date()
        ob.save()

        request.session['code'] = ""
        return HttpResponse(
            f'''<script>alert('Code successfully edited');window.location='/individualgroupview/{kk}'</script>''')

    else:
        return render(request, 'user/usercodesave.html')


@login_required(login_url='/login')
def sendfeedback(request):
    ob = feedback_table.objects.filter(USER__LOGIN__id=request.session['lid']).order_by('-id')
    return render(request, "user/sendfeedback.html",{"val":ob})



@login_required(login_url='/login')
def sendfeedback_post(request):
    feedback = request.POST['feed']
    rating= request.POST['rating']


    ob = feedback_table()
    ob.feedback=feedback
    ob.rating=rating
    ob.USER=user_table.objects.get(LOGIN=request.session["lid"])
    ob.date=datetime.datetime.now().date()
    ob.save()
    return HttpResponse('''<script>alert('feedback sent sucessfully');window.location='/sendfeedback'</script>''')



@login_required(login_url='/login')
def replycomplaintuser(request):
    a=complaint_table.objects.filter(USER__LOGIN_id=request.session['lid']).order_by('-id')
    return render(request,"user/send complaint.html",{'data':a})



@login_required(login_url='/login')
def send_comp2(request):
    return render(request,"user/send com2.html")




@login_required(login_url='/login')
def replycomplaintuser_post(request):
    complaint = request.POST['complaint']
    ob=complaint_table()
    ob.complaint=complaint
    ob.date=datetime.datetime.now().today().date()
    ob.USER = user_table.objects.get(LOGIN_id=request.session["lid"])
    ob.save()
    return HttpResponse('''<script>alert('complainted successfully');window.location='/replycomplaintuser'</script>''')





@login_required
def group(request):
    user_id = request.session['lid']
    mygroups = group_members_table.objects.filter(USER__LOGIN__id=user_id)  # Always fetch user's groups

    admin_groups = group_members_table.objects.filter(USER__LOGIN__id=user_id, type='admingrp').values_list('GROUP_id', flat=True)
    pending_requests_count = JoinRequest_table.objects.filter(GROUP__id__in=admin_groups, status="Pending").count()
    user_join_requests = JoinRequest_table.objects.filter(USER__LOGIN__id=user_id).values_list('GROUP_id', 'status')
    request_status = {group_id: status for group_id, status in user_join_requests}

    # Handle search functionality
    if request.method == 'POST':
        group_search = request.POST.get('groupsearch', '')
        grouprequest = group_table.objects.filter(grpName__icontains=group_search)  # Search filter applied
    else:
        grouprequest = group_table.objects.exclude(id__in=mygroups.values_list('GROUP_id', flat=True))

    return render(request, "user/Group.html", {
        "val": mygroups,  # ✅ Include user's groups
        "grouprequest": grouprequest,  # ✅ Include search/all groups
        "pending_requests_count": pending_requests_count,
        "is_admin": admin_groups.exists(),
        "request_status": request_status,
        "search_query": group_search if request.method == 'POST' else "",
    })


@login_required
def leave_group(request, group_id):
    group = get_object_or_404(group_table, id=group_id)
    logged_in_user_id = request.session.get('lid')

    if not logged_in_user_id:
        return HttpResponse(
            '''<script>alert('Session expired. Please log in again.');window.location='/login';</script>'''
        )

    try:
        user_table_instance = user_table.objects.get(LOGIN_id=logged_in_user_id)
    except user_table.DoesNotExist:
        return HttpResponse(
            '''<script>alert('User not found in user_table. Contact support.');window.location='/group';</script>'''
        )

    # Check if the user is a member of the group
    member_instance = group_members_table.objects.filter(GROUP=group, USER=user_table_instance).first()

    if member_instance:
        member_instance.delete()
        return HttpResponse(
            '''<script>alert('You have successfully left the group.');window.location='/group';</script>'''
        )

    return HttpResponse(
        '''<script>alert('You are not a member of this group.');window.location='/group';</script>'''
    )






#---------------------------------------------  request group  -------------------------------------------------------------------


@login_required
def request_join_group(request, group_id):
    group = get_object_or_404(group_table, id=group_id)
    logged_in_user_id = request.session.get('lid')

    if not logged_in_user_id:
        return HttpResponse(
            '''<script>alert('Session expired. Please log in again.');window.location='/login';</script>'''
        )

    try:
        user_table_instance = user_table.objects.get(LOGIN_id=logged_in_user_id)
    except user_table.DoesNotExist:
        return HttpResponse(
            '''<script>alert('User not found in user_table. Contact support.');window.location='/group';</script>'''
        )

    if JoinRequest_table.objects.filter(GROUP=group, USER=user_table_instance, status='Pending').exists():
        return HttpResponse(
            '''<script>alert('You have already requested to join this group');window.location='/group';</script>'''
        )

    join_request = JoinRequest_table.objects.create(GROUP=group, USER=user_table_instance)

    return HttpResponse(
        '''<script>alert('Request Sent Successfully');window.location='/group';</script>'''
    )



@login_required
def manage_join_requests(request):
    logged_in_user_id = request.session.get('lid')

    if not logged_in_user_id:
        return HttpResponse(
            '''<script>alert('Session expired. Please log in again.');window.location='/login';</script>'''
        )

    # Fetch the logged-in user instance
    user_table_instance = get_object_or_404(user_table, LOGIN_id=logged_in_user_id)

    # Fetch groups that the logged-in user CREATED
    managed_groups = group_table.objects.filter(USER=user_table_instance)

    # Fetch join requests only for those groups
    join_requests = JoinRequest_table.objects.filter(GROUP__in=managed_groups, status='Pending')

    # Fetch group members
    group_members = group_members_table.objects.filter(GROUP__in=managed_groups)

    return render(request, 'user/manage_join_requests.html', {
        'join_requests': join_requests,
        'group_members': group_members,
    })



@login_required
def approve_join_request(request, request_id):
    join_request = get_object_or_404(JoinRequest_table, id=request_id)

    if join_request.status == 'Pending':
        existing_member = group_members_table.objects.filter(
            GROUP=join_request.GROUP,
            USER=join_request.USER
        ).exists()

        if not existing_member:
            group_members_table.objects.create(
                GROUP=join_request.GROUP,
                USER=join_request.USER,
                date=now().date(),
                type='Member'
            )

        join_request.delete()  # Remove the join request after approval

        return HttpResponse(
            '''<script>alert("User successfully added to the group!"); window.location="/manage_join_requests";</script>'''
        )

    return redirect('manage_join_requests')


@login_required
def reject_join_request(request, request_id):
    join_request = get_object_or_404(JoinRequest_table, id=request_id)

    if join_request.status == 'Pending':
        join_request.delete()  # Remove the request after rejection

        return HttpResponse(
            '''<script>alert("Join request rejected!"); window.location="/manage_join_requests";</script>'''
        )

    return redirect('manage_join_requests')


#------------------------------------------------------------------------------------------ end request group -----------------------------------------





@login_required(login_url='/login')
def individual_share(request):
    kk = user_table.objects.all()
    current_user=request.session['lid']
    return render(request, "user/individual share.html", {"val": kk, "current_user":current_user})



@login_required(login_url='/login')
def individual_share_post(request):
    if request.method == 'POST':
        language = request.POST['language']
        topic = request.POST['title']
        touser_ids = request.POST.getlist('touser')  # Get list of user IDs
        code = request.POST['code']

        from_user = user_table.objects.get(id=request.session["lid"])

        for touser_id in touser_ids:
            try:
                to_user = user_table.objects.get(id=int(touser_id))  # Convert touser_id to an integer
            except ValueError:
                return HttpResponse('''<script>alert('Invalid user ID');window.location='/individual_share'</script>''')

            # Create a new share_table entry for each user
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
        return HttpResponse('''<script>alert('Code successfully shared with selected users');window.location='/individual_share'</script>''')
    else:
        return render(request, 'user/individual share.html')



@login_required(login_url='/login')
def usergroupsharelist(request):
    kk = group_members_table.objects.filter(USER__LOGIN__id=request.session['lid']).order_by('-id')
    return render(request, "user/group share list.html", {"val":kk})






@login_required(login_url='/login')
def usergroupsharelist_post(request):
    if request.method == 'POST':
        language = request.POST['language']
        topic = request.POST['title']
        group_id = request.POST['group']
        status = request.POST['status']
        code = request.POST['code']  # fixed typo: request.post -> request.POST

        ob = share_group_table()
        ob.code = code
        ob.Language = language
        ob.topic = topic
        ob.type=status
        ob.USER = user_table.objects.get(id=request.session["lid"])  # Fetch the user instance
        ob.GROUP = group_table.objects.get(id=group_id)  # Fetch the group instance
        ob.date = datetime.datetime.now().date()  # Add current date
        ob.save()

        request.session['code'] = ""
        return HttpResponse('''<script>alert('Code successfully saved');window.location='/usergroupsharelist'</script>''')
    else:
        return render(request, 'user/usercodesave.html')




@login_required(login_url='/login')
def groupview(request):
    ob = group_table.objects.all().order_by('-id')
    return render(request, "user/groupview.html",{"val":ob})



@login_required(login_url='/login')
def individualgroupcodeview(request,id):
    ob = share_group_table.objects.get(id=id)
    return render(request,"user/individualgroupcodeview.html",{"val":ob})





@login_required(login_url='/login')
def creategroup(request):
    return render(request, "user/create group.html")

@login_required(login_url='/login')
def groupcreate(request):
    groupname = request.POST['groupname']
    description= request.POST['description']


    photo = request.FILES["file"]
    fs=FileSystemStorage()
    date=datetime.datetime.now().strftime("%Y-%m-%d-%H-%M-%S")+'.jpg'
    fs.save(date,photo)
    path=fs.url(date)



    ob = group_table()
    ob.grpName=groupname
    ob.date=datetime.datetime.now().date()
    ob.Detail=description
    ob.photo=path
    ob.USER=user_table.objects.get(LOGIN__id=request.session["lid"])
    ob.save()

    ob1 = group_members_table()
    ob1.GROUP=ob
    ob1.date=datetime.datetime.now().date()
    ob1.USER=user_table.objects.get(LOGIN__id=request.session["lid"])
    ob1.type= "admingrp"
    ob1.save()
    return HttpResponse('''<script>alert('group created sucessfully');window.location='/group'</script>''')





@login_required(login_url='/login')
def managegroupmembers(request,id):
    request.session['grpid'] = id
    kk=group_members_table.objects.filter(GROUP__id=id).order_by('-id')
    return render(request,"user/manage group members.html",{"val":kk,"id":id})




@login_required(login_url='/login')
def addgroupmember(request):
    ob=user_table.objects.all()
    return render(request, "user/addmembers.html",{"val":ob})






@login_required(login_url='/login')
def addgrpmembercode(request):
    kk = request.session['gid']
    user_id = request.POST['name']
    description = 'member'

    try:
        # Retrieve the user entry based on the user ID
        user = user_table.objects.get(id=user_id)

        # Check if the group member exists using the user's ID
        if group_members_table.objects.filter(GROUP=request.session['grpid'], USER=user).exists():
            return HttpResponse(
                f'''<script>alert('Cannot add same member in the group');window.location='/managegroupmembers/{kk}'</script>'''
            )

        ob = group_members_table()
        ob.USER = user
        ob.GROUP = group_table.objects.get(id=request.session['grpid'])
        ob.date = datetime.datetime.now().date()
        ob.type = description
        ob.save()
        return HttpResponse(
            f'''<script>alert('Member added');window.location='/managegroupmembers/{kk}'</script>'''
        )

    except ObjectDoesNotExist:
        # Handle case where the user does not exist
        return HttpResponse(
            f'''<script>alert('User does not exist');window.location='/managegroupmembers/{kk}'</script>'''
        )


@login_required(login_url='/login')
def individual_user_group(request,id):
    ob = user_table.objects.get(id=id)
    return render(request,"user/individual_user_group.html",{"val":ob})




@login_required(login_url='/login')
def delete_user_group_member (request,id):
    ob = get_object_or_404(group_members_table, id=id, GROUP__USER__LOGIN__id=request.session['lid'])
    ob.delete()
    kk = request.session['gid']
    return HttpResponse(f'''<script>alert('Group member Deleted');window.location='/managegroupmembers/{kk}'</script>''')




@login_required(login_url='/login')
def deletesharegroupdata (request,id):
    ob = share_group_table.objects.get(id=id)
    ob.delete()
    kk=request.session['gid']
    return HttpResponse(f'''
               <script>
                   alert('Program Deleted');
                   window.location = '/individualgroupview/{kk}';  // Redirect with session ID (kk)
               </script>
           ''')



@login_required(login_url='/login')
def delete_user_group(request, id):
    ob = group_table.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script>alert('group Deleted');window.location='/group'</script>''')

        # ob.GROUP = group_table.objects.get(id=request.session['grpid'])


@login_required(login_url='/login')
def share_code_to_group(request):
    return render(request, "user/share code to group.html")





@login_required(login_url='/login')
def individualgroupview(request,id):
    request.session['gid']=id

    kk=group_table.objects.get(id=id)
    ob=share_group_table.objects.filter(GROUP__id=id).order_by('-id')
    return render(request, "user/individual group view.html",{"val":kk,"ob":ob})



@login_required(login_url='/login')
def share_code_to_group_post(request):
    gid = request.session['gid']
    code = request.POST['examplecode']
    topic = request.POST['topic']
    Language = request.POST['language']
    statu = request.POST['status']
    ob = share_group_table()
    ob.code=code
    ob.type=statu
    ob.Language=Language
    ob.date = datetime.datetime.now().date()
    ob.topic=topic
    ob.USER = user_table.objects.get(LOGIN__id=request.session['lid'])
    ob.GROUP = group_table.objects.get(id=request.session['gid'])
    ob.save()
    return HttpResponse(f'''<script>alert('Program shared ');window.location='/individualgroupview/{gid}'</script>''')


@login_required(login_url='/login')
def selfprofileview(request, id):
    user_id = request.session['lid']

    passed_id=id

    print("user id : ", user_id)  # Get logged-in user's ID
    ob = user_table.objects.get(id=id)
    print(request.user.id)
    return render(request, "user/self profile view.html", {"val": ob , "user_id": user_id, "passed_id":passed_id})


@login_required(login_url='/login')
def edit_profile(request, id):
    # Get the login_table instance for the given user ID
    login_instance = get_object_or_404(login_table, id=id)

    # Get the user_table instance linked to the login_table
    user = get_object_or_404(user_table, LOGIN=login_instance)

    if request.method == "POST":
        user.name = request.POST.get("name")
        user.email = request.POST.get("email")
        user.age = request.POST.get("age")
        user.phone = request.POST.get("phone")
        user.address = request.POST.get("address")
        user.gender = request.POST.get("gender")

        if 'photo' in request.FILES:  # If new photo is uploaded
            user.photo = request.FILES['photo']

        user.save()  # Save updated data
        return redirect("selfprofileview", id=user.id)  # Redirect to profile page

    return render(request, "user/edit_profile.html", {"user": user})


# ------------------------------   USER COMPILER -------------------------------------


# @login_required(login_url='/login')
def user_python(request):
    return render(request, "user/python compiler.html")


# def user_python2(request):
#     return render(request, "user/python home.html")


#
# # @login_required(login_url='/login')
# def user_python2(request,id):
#     kk=share_group_table.objects.get(id=id)
#     return render(request, "user/python2.html",{"code":kk.code})
#


# @login_required(login_url='/login')
def user_java(request):
    return render(request, "user/java compiler.html")

# @login_required(login_url='/login')
# def user_java2(request):
#     kk = share_group_table.objects.get(id=id)
#     return render(request, "user/user java2.html", {"code": kk.code})


# @login_required(login_url='/login')
def user_c(request):
    return render(request, "user/C Compiler.html")



# @login_required(login_url='/login')
def user_cpp(request):
    return render(request, "user/C++ Compiler.html")



# --------------------------------ADMIN COMPILER -------------------------------------



@login_required(login_url='/login')
def admin_python(request):
    return render(request, "admin/admin python.html")



@login_required(login_url='/login')
def admin_java(request):
    return render(request, "admin/admin java.html")


@login_required(login_url='/login')
def admin_c(request):
    return render(request, "admin/admin C Compiler.html")



@login_required(login_url='/login')
def admin_cpp(request):
    return render(request, "admin/admin C++ Compiler.html")




# @login_required(login_url='/login')
def setsession(request):

    rr=request.GET['s'].split("\n")
    print(rr,"===============")
    s=""
    res = []

    for i in rr:
        try:
            a = int(i)
        except:
            if i.startswith('\xa0') or i.startswith('%0A%C2%A0%C2%A0%C2%A0%C2%A0') or i.startswith('%3A'):
                i=i.replace("%0A%C2%A0%C2%A0%C2%A0%C2%A0","")
                i=i.replace("\xa0","")
                # i=i.replace("%3A","")
                res[-1] += i
            else:
                res.append(i)

    # k=len(rr)//2
    # if len(rr)%2==1:
    #     k=k+1
    print(res)
    for i in range(0,len(res)):
        s+=res[i]+"\n"

    request.session['code']=s
    return JsonResponse({"task":"ok"})





# @login_required(login_url='/login')
def setsession1(request):
    rr=request.GET['s']

    request.session['ccode']=rr
    return JsonResponse({"task":"ok"})




# def setsession2(request):
#     rr = request.GET['s']
#     request.session['ccode'] = rr
#     return JsonResponse({"task": "ok"})
#

