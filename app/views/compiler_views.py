from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from django.http import JsonResponse

# USER COMPILER

@login_required(login_url='/login')
def user_python(request):
    return render(request, "user/python compiler.html")

@login_required(login_url='/login')
def user_java(request):
    return render(request, "user/java compiler.html")

@login_required(login_url='/login')
def user_c(request):
    return render(request, "user/C Compiler.html")

@login_required(login_url='/login')
def user_cpp(request):
    return render(request, "user/C++ Compiler.html")

# ADMIN COMPILER

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

def setsession(request):
    rr=request.GET['s'].split("\n")
    s=""
    res = []
    for i in rr:
        try:
            a = int(i)
        except:
            if i.startswith('\xa0') or i.startswith('%0A%C2%A0%C2%A0%C2%A0%C2%A0') or i.startswith('%3A'):
                i=i.replace("%0A%C2%A0%C2%A0%C2%A0%C2%A0","")
                i=i.replace("\xa0","")
                res[-1] += i
            else:
                res.append(i)

    for i in range(0,len(res)):
        s+=res[i]+"\n"

    request.session['code']=s
    return JsonResponse({"task":"ok"})

def setsession1(request):
    rr=request.GET['s']
    request.session['ccode']=rr
    return JsonResponse({"task":"ok"})
