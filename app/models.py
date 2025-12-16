from django.db import models
from django.contrib.auth.models import User
from django.utils.timezone import now  # Correct import for timezone-aware timestamp


# Create your models here.


class login_table(models.Model):
    username = models.CharField(max_length=100)
    password = models.CharField(max_length=100)
    type = models.CharField(max_length=10)

class user_table(models.Model):
    LOGIN = models.OneToOneField(login_table, on_delete=models.CASCADE)
    name = models.CharField(max_length=100)
    email = models.CharField(max_length=320)
    age = models.IntegerField()
    phone = models.BigIntegerField()
    photo = models.ImageField(upload_to='photos/')
    address = models.CharField(max_length=100)
    gender = models.CharField(max_length=10)


class ChatMessage_table(models.Model):
    FROM_USER = models.ForeignKey(user_table, related_name='sent_messages', on_delete=models.CASCADE)
    TO_USER = models.ForeignKey(user_table, related_name='received_messages', on_delete=models.CASCADE)
    message = models.CharField(max_length=5000)
    date = models.DateTimeField(auto_now_add=True)
    status = models.CharField(max_length=10, choices=[('Pending', 'Pending'), ('Viewed', 'Viewed')], default='Pending')


class complaint_table(models.Model):
    USER=models.ForeignKey(user_table,on_delete=models.CASCADE)
    complaint=models.CharField(max_length=1000)
    date=models.DateTimeField()
    reply=models.CharField(max_length=1000,default='pending')

class feedback_table(models.Model):
    USER=models.ForeignKey(user_table,on_delete=models.CASCADE)
    feedback=models.CharField(max_length=1000)
    rating=models.IntegerField()
    date=models.DateTimeField()

class code_table(models.Model):
    USER = models.ForeignKey(user_table, on_delete=models.CASCADE)
    language = models.CharField(max_length=10)
    topic = models.CharField(max_length=500)
    code = models.CharField(max_length=10000)
    date = models.DateTimeField(auto_now_add=True)  # Automatically sets to the current timestamp on creation



class sample_programs(models.Model):
    Language=models.CharField(max_length=10)
    topic=models.CharField(max_length=500)
    code=models.CharField(max_length=10000)
    date=models.DateTimeField()



class group_table(models.Model):
    USER = models.ForeignKey(user_table, on_delete=models.CASCADE)
    grpName = models.CharField(max_length=100)
    date = models.DateTimeField()
    Detail = models.CharField(max_length=1000)
    photo = models.FileField(upload_to='group_photos/')

class JoinRequest_table(models.Model):
    GROUP = models.ForeignKey(group_table, on_delete=models.CASCADE)
    USER = models.ForeignKey(user_table, on_delete=models.CASCADE)
    status = models.CharField(max_length=10, choices=[('Pending', 'Pending'), ('Accepted', 'Accepted'), ('Rejected', 'Rejected')], default='Pending')
    request_date = models.DateTimeField(auto_now_add=True)

class group_members_table(models.Model):
    GROUP = models.ForeignKey(group_table, on_delete=models.CASCADE)
    USER = models.ForeignKey(user_table, on_delete=models.CASCADE)
    date = models.DateTimeField()
    type = models.CharField(max_length=100)

class share_group_table(models.Model):
    GROUP = models.ForeignKey(group_table, on_delete=models.CASCADE)
    USER = models.ForeignKey(user_table, on_delete=models.CASCADE)
    Language = models.CharField(max_length=10)
    topic = models.CharField(max_length=1000)
    code = models.CharField(max_length=10000)
    type = models.CharField(max_length=10)
    date = models.DateTimeField()

class share_table(models.Model):
    FROMUSER = models.ForeignKey(user_table, on_delete=models.CASCADE,related_name='fromuser')
    TOUSER = models.ForeignKey(user_table, on_delete=models.CASCADE,related_name='touser')
    Language=models.CharField(max_length=10)
    topic=models.CharField(max_length=1000)
    code=models.CharField(max_length=10000)
    date=models.DateTimeField()
    status = models.CharField(max_length=10, choices=[('Pending', 'Pending'), ('Viewed', 'Viewed')], default='Pending')


