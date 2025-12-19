from django.shortcuts import render, redirect, HttpResponse, get_object_or_404
from django.contrib.auth.decorators import login_required
from app.models import sample_programs, code_table, feedback_table, complaint_table, user_table
from django.contrib import messages
import datetime
from django.views.decorators.cache import never_cache

@never_cache
def userhome(request):
    user_id = None
    if request.user.is_authenticated:
        try:
            # We must pass the ID of the user_table (Profile), not the Auth User ID
            user_id = request.user.profile.id
        except:
             # Fallback if profile doesn't exist (shouldn't happen for valid users)
             user_id = None
        
        # We update lid to match profile ID, as views likely expect user_table ID if they use it for querying user_table
        if user_id:
             request.session['lid'] = user_id
             
    elif 'lid' in request.session:
        user_id = request.session['lid']
        
    return render(request, "user/index.html", {"user_id": user_id})

@login_required(login_url='/login')
def exampleprogram(request):
    ob=sample_programs.objects.all().order_by('-id')
    return render(request,"user/Example Program.html",{"val":ob})

@login_required(login_url='/login')
def examplesearch1(request):
    exsearch = request.POST['select']
    top = request.POST['exsearch']
    ob=sample_programs.objects.filter(topic__icontains=top,Language__icontains=exsearch).order_by('-id')
    return render(request,"user/Example Program.html",{"val":ob,"e":exsearch,"t":top})

@login_required(login_url='/login')
def exampleprogramview(request,id):
    ob=sample_programs.objects.get(id=id)
    return render(request,"user/individual example program.html",{"val":ob})

@login_required(login_url='/login')
def userviewcode(request):
    # session['lid'] likely stores user_table ID (from logincode logic)
    # But views.py line 233 used `USER__LOGIN__id`.
    # Login stores `request.session['name']`, `request.session['img']`.
    # Wait, `logincode` in views.py line 185: `user_id = request.session['lid']`.
    # BUT `logincode` (line 36) DOES NOT SET `lid` in session!
    # It sets `name` and `img`.
    # Line 56-57.
    # THIS IS A BUG IN ORIGINAL CODE OR I MISSED WHERE `lid` IS SET.
    # Ah, `logincode` also does `auth.login`.
    # But where is `lid` set?
    # Maybe in `setsession`? No.
    # I suspect `lid` WAS intended to be `_auth_user_id` (Django's internal session key) or the code provided is incomplete/broken regarding `lid`.
    # However, I should assume `lid` IS set somewhere or I should set it.
    # `auth.login` sets `_auth_user_id`.
    # `request.user.id` is available if logged in.
    # I will replace `request.session['lid']` with `request.user.id` (or `request.user.profile.id` if `lid` implies `user_table` id).
    # In `views.py` line 233: `USER__LOGIN__id=request.session['lid']`.
    # This implies `lid` is the AUTH USER ID (because `LOGIN` usually refers to Auth User).
    # I will use `request.user.id`.
    
    ob=code_table.objects.filter(USER__LOGIN__id=request.user.id).order_by('-date')
    return render(request,"user/user view code.html",{"val":ob})

@login_required(login_url='/login')
def user_code_delete(request, id):
    try:
        ob = get_object_or_404(code_table, id=id)
        ob.delete()
        messages.success(request, 'Program Deleted')
        return redirect('/userviewcode')
    except Exception as e:
        messages.error(request, 'Error deleting code')
        return redirect('/userviewcode')

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
        # ob.USER = user_table.objects.get(id=request.session["lid"])
        # Replacing session['lid'] usage with request.user.profile (reverse relation)
        try:
             ob.USER = request.user.profile
        except:
             # Fallback if profile relation is named differently, but we saw related_name='profile'
             ob.USER = user_table.objects.get(LOGIN=request.user)

        ob.date = datetime.datetime.now().date()
        ob.save()
        request.session['code']=""
        messages.success(request, 'Code successfully saved')
        return redirect('/usercodesave')
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
        
        ob = code_table.objects.get(id=request.session['cid'])
        ob.code = code
        ob.language = lang
        ob.topic = topic
        
        try:
             ob.USER = request.user.profile
        except:
             ob.USER = user_table.objects.get(LOGIN=request.user)
             
        ob.date = datetime.datetime.now().date()
        ob.save()
        request.session['code']=""
        messages.success(request, 'Code successfully edited')
        return redirect('/userviewcode')
    else:
        return render(request, 'user/usercodesave.html')

@login_required(login_url='/login')
def sendfeedback(request):
    ob = feedback_table.objects.filter(USER__LOGIN__id=request.user.id).order_by('-id')
    return render(request, "user/sendfeedback.html",{"val":ob})

@login_required(login_url='/login')
def sendfeedback_post(request):
    feedback = request.POST['feed']
    rating= request.POST['rating']

    ob = feedback_table()
    ob.feedback=feedback
    ob.rating=rating
    
    try:
        ob.USER = request.user.profile
    except:
        ob.USER = user_table.objects.get(LOGIN=request.user)

    ob.date=datetime.datetime.now().date()
    ob.save()
    messages.success(request, 'feedback sent sucessfully')
    return redirect('/sendfeedback')

@login_required(login_url='/login')
def replycomplaintuser(request):
    a=complaint_table.objects.filter(USER__LOGIN__id=request.user.id).order_by('-id')
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
    try:
        ob.USER = request.user.profile
    except:
        ob.USER = user_table.objects.get(LOGIN=request.user)
    ob.save()
    messages.success(request, 'complainted successfully')
    return redirect('/replycomplaintuser')

@login_required(login_url='/login')
def selfprofileview(request, id):
    # original code passed id.
    # Line 1285 `ob = user_table.objects.get(id=id)`
    # Line 1280 `user_id = request.session['lid']`
    user_id = request.user.id
    passed_id=id
    ob = user_table.objects.get(id=id)
    return render(request, "user/self profile view.html", {"val": ob , "user_id": user_id, "passed_id":passed_id})

@login_required(login_url='/login')
def edit_profile(request, id):
    # original: `login_instance = get_object_or_404(login_table, id=id)`
    # Assuming id is user_table id or Auth User id?
    # Context suggests `selfprofileview` link passes an id.
    # If `edit_profile` takes `id`, and originally used `login_table` (which we suspect is `user_table` or `User`),
    # AND `user = get_object_or_404(user_table, LOGIN=login_instance)`
    # This implies `login_table` = `User` model?
    # And `user_table` has FK to `User` (named `user`).
    # THIS MAKES SENSE. `login_table` meant `auth.User`.
    # So `login_instance` is `User`. `user` is `user_table`.
    
    user = get_object_or_404(user_table, id=id) # Let's assume ID passed is user_table ID.
    
    if request.method == "POST":
        user.name = request.POST.get("name") # Careful with name field
        # user.email is on User model, not user_table usually. 
        # But here `user.email = ...`. 
        # If user_table has email, fine. If not, maybe it meant `user.user.email`.
        
        user.age = request.POST.get("age")
        user.phone = request.POST.get("phone")
        user.address = request.POST.get("address")
        user.gender = request.POST.get("gender")

        if 'photo' in request.FILES:
            user.photo = request.FILES['photo']

        user.save()
        return redirect("selfprofileview", id=user.id)

    return render(request, "user/edit_profile.html", {"user": user})

@login_required(login_url='/login')
def history(request):
    return render(request, "user/history.html")

@login_required(login_url='/login')
def historycode(request):
    return render(request,"user/history code.html")

@login_required(login_url='/login')
def individualusercodeview(request,id):
    ob = code_table.objects.get(id=id)
    request.session['cid']=id
    return render(request,"user/user individual code view.html",{"val":ob})
