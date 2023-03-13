# serializers.py
from rest_framework import serializers

from .models import Employee

class EmployeeSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Employee
        fields = ('Name', 'Designation', 'Account', 'Employee_Number', 'Date_of_joining')