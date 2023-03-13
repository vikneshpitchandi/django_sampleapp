from django.db import models
# Create your models here.
class Employee(models.Model):
    Name = models.CharField(max_length=60)
    Designation = models.CharField(max_length=60)
    Account = models.CharField(max_length=60)
    Employee_Number = models.IntegerField()
    Date_of_joining =  models.DateTimeField() 

    def __str__(self):
        return self.Name
       