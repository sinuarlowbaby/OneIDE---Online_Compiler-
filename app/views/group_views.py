from django.shortcuts import render, redirect, HttpResponse, get_object_or_404
from django.contrib.auth.decorators import login_required
from app.models import group_table, group_members_table, JoinRequest_table, share_group_table, user_table
from django.contrib import messages
import datetime
from django.core.files.storage import FileSystemStorage
from django.utils.timezone import now

@login_required(login_url='/login')
def group(request):
    user_id = request.user.id
    
    mygroups = group_members_table.objects.filter(USER__LOGIN__id=user_id)
    admin_groups = group_members_table.objects.filter(USER__LOGIN__id=user_id, type='admingrp').values_list('GROUP_id', flat=True)
    pending_requests_count = JoinRequest_table.objects.filter(GROUP__id__in=admin_groups, status="Pending").count()
    user_join_requests = JoinRequest_table.objects.filter(USER__LOGIN__id=user_id).values_list('GROUP_id', 'status')
    request_status = {group_id: status for group_id, status in user_join_requests}

    if request.method == 'POST':
        group_search = request.POST.get('groupsearch', '')
        grouprequest = group_table.objects.filter(grpName__icontains=group_search)
    else:
        grouprequest = group_table.objects.exclude(id__in=mygroups.values_list('GROUP_id', flat=True))

    return render(request, "user/Group.html", {
        "val": mygroups,
        "grouprequest": grouprequest,
        "pending_requests_count": pending_requests_count,
        "is_admin": admin_groups.exists(),
        "request_status": request_status,
        "search_query": group_search if request.method == 'POST' else "",
    })

@login_required
def leave_group(request, group_id):
    group = get_object_or_404(group_table, id=group_id)
    try:
        user_table_instance = user_table.objects.get(LOGIN=request.user)
    except user_table.DoesNotExist:
        messages.error(request, 'User not found')
        return redirect('/group')

    member_instance = group_members_table.objects.filter(GROUP=group, USER=user_table_instance).first()

    if member_instance:
        member_instance.delete()
        messages.success(request, 'You have successfully left the group.')
    else:
        messages.error(request, 'You are not a member of this group.')
    return redirect('/group')

@login_required
def request_join_group(request, group_id):
    group = get_object_or_404(group_table, id=group_id)
    try:
        user_table_instance = user_table.objects.get(LOGIN=request.user)
    except user_table.DoesNotExist:
        messages.error(request, 'User not found.')
        return redirect('/group')

    if JoinRequest_table.objects.filter(GROUP=group, USER=user_table_instance, status='Pending').exists():
        messages.warning(request, 'You have already requested to join this group')
        return redirect('/group')

    JoinRequest_table.objects.create(GROUP=group, USER=user_table_instance)
    messages.success(request, 'Request Sent Successfully')
    return redirect('/group')

@login_required
def manage_join_requests(request):
    user_table_instance = get_object_or_404(user_table, LOGIN=request.user)
    managed_groups = group_table.objects.filter(USER=user_table_instance)
    join_requests = JoinRequest_table.objects.filter(GROUP__in=managed_groups, status='Pending')
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

        join_request.delete()
        messages.success(request, "User successfully added to the group!")
    return redirect('manage_join_requests')

@login_required
def reject_join_request(request, request_id):
    join_request = get_object_or_404(JoinRequest_table, id=request_id)
    if join_request.status == 'Pending':
        join_request.delete()
        messages.success(request, "Join request rejected!")
    return redirect('manage_join_requests')

@login_required(login_url='/login')
def usergroupsharelist(request):
    kk = group_members_table.objects.filter(USER__LOGIN__id=request.user.id).order_by('-id')
    return render(request, "user/group share list.html", {"val":kk})

@login_required(login_url='/login')
def usergroupsharelist_post(request):
    if request.method == 'POST':
        language = request.POST['language']
        topic = request.POST['title']
        group_id = request.POST['group']
        status = request.POST['status']
        code = request.POST['code']

        ob = share_group_table()
        ob.code = code
        ob.Language = language
        ob.topic = topic
        ob.type=status
        ob.USER = user_table.objects.get(LOGIN=request.user)
        ob.GROUP = group_table.objects.get(id=group_id)
        ob.date = datetime.datetime.now().date()
        ob.save()

        request.session['code'] = ""
        messages.success(request, 'Code successfully saved')
        return redirect('/usergroupsharelist')
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
    ob.USER=user_table.objects.get(LOGIN=request.user)
    ob.save()

    ob1 = group_members_table()
    ob1.GROUP=ob
    ob1.date=datetime.datetime.now().date()
    ob1.USER=user_table.objects.get(LOGIN=request.user)
    ob1.type= "admingrp"
    ob1.save()
    messages.success(request, 'Group created successfully')
    return redirect('/group')

@login_required(login_url='/login')
def managegroupmembers(request,id):
    request.session['grpid'] = id
    kk=group_members_table.objects.filter(GROUP__id=id).order_by('-id')
    return render(request,"user/manage group members.html",{"val":kk,"id":id})

@login_required(login_url='/login')
def addgroupmember(request):
    # This view seems to list ALL users? 
    ob=user_table.objects.all()
    return render(request, "user/addmembers.html",{"val":ob})

@login_required(login_url='/login')
def addgrpmembercode(request):
    kk = request.session['gid'] # wait, `gid` or `grpid`? managegroupmembers sets `grpid`.
    # original: `kk = request.session['gid']` (Line 1169).
    # But `managegroupmembers` line 1150 sets `grpid`.
    # AND line 1180 redirects to `/managegroupmembers/{kk}`.
    # Where is `gid` set? `individualgroupview` sets `gid`.
    # `managegroupmembers` uses `grpid`.
    # The original code might have a bug or I missed where `gid` is updated.
    # Assuming `kk` should be `grpid` because we are in `managegroupmembers` flow.
    # But let's check input. `addgroupmember` renders `user/addmembers.html`.
    # The form presumably posts to `addgrpmembercode`.
    # If the user came from `managegroupmembers` -> `addgroupmember` -> `top`.
    # I should use `grpid`.
    
    grpid = request.session.get('grpid')
    user_id = request.POST['name']
    description = 'member'

    try:
        user = user_table.objects.get(id=user_id)
        if group_members_table.objects.filter(GROUP_id=grpid, USER=user).exists():
             messages.error(request, 'Cannot add same member in the group')
             return redirect(f'/managegroupmembers/{grpid}')

        ob = group_members_table()
        ob.USER = user
        ob.GROUP = group_table.objects.get(id=grpid)
        ob.date = datetime.datetime.now().date()
        ob.type = description
        ob.save()
        messages.success(request, 'Member added')
        return redirect(f'/managegroupmembers/{grpid}')

    except Exception as e:
        messages.error(request, 'User does not exist or error occurred')
        return redirect(f'/managegroupmembers/{grpid}')

@login_required(login_url='/login')
def individual_user_group(request,id):
    ob = user_table.objects.get(id=id)
    return render(request,"user/individual_user_group.html",{"val":ob})

@login_required(login_url='/login')
def delete_user_group_member (request,id):
    # This removes a member.
    # Original: `GROUP__USER__LOGIN__id=request.session['lid']` -> checking if logged in user is owner of group?
    # Yes.
    ob = get_object_or_404(group_members_table, id=id, GROUP__USER__LOGIN__id=request.user.id)
    ob.delete()
    kk = request.session.get('grpid') # Use grpid as it aligns with managegroupmembers
    messages.success(request, 'Group member Deleted')
    return redirect(f'/managegroupmembers/{kk}')

@login_required(login_url='/login')
def deletesharegroupdata (request,id):
    ob = share_group_table.objects.get(id=id)
    ob.delete()
    kk=request.session.get('gid')
    messages.success(request, 'Program Deleted')
    return redirect(f'/individualgroupview/{kk}')

@login_required(login_url='/login')
def delete_user_group(request, id):
    ob = group_table.objects.get(id=id)
    ob.delete()
    messages.success(request, 'Group Deleted')
    return redirect('/group')

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
    ob.USER = user_table.objects.get(LOGIN=request.user)
    ob.GROUP = group_table.objects.get(id=gid)
    ob.save()
    messages.success(request, 'Program shared')
    return redirect(f'/individualgroupview/{gid}')

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
        ob.code = code
        ob.Language = lang
        ob.topic = topic
        ob.date = datetime.datetime.now().date()
        ob.save()

        request.session['code'] = ""
        messages.success(request, 'Code successfully edited')
        return redirect(f'/individualgroupview/{kk}')
    else:
        return render(request, 'user/usercodesave.html')
