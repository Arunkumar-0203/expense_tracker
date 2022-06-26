import re
import string
from currency_converter import CurrencyConverter
import pickle
import json
c = CurrencyConverter()
from django.contrib.auth import login, authenticate
from django.contrib.auth import login, authenticate
from django.shortcuts import render
from django.db.models import Sum
# Create your views here.
from rest_framework.decorators import api_view
from rest_framework.response import Response

from expense_tracker_app.models import User, GroupSplit, CustomGroup, CustomCategory, NormalExpense, CustomGroupUser
from expense_tracker_app.serializers import userserializer, GroupSerializer, ExpenseSerializer, CategorySerialiazer, \
    NormalSerializer
import random


# cr = CurrencyRates()

@api_view(['POST'])
def adduser(request):
    if request.method == 'POST':
        email = request.data.get('email')

        password = request.data.get('password')
        firstName = request.data.get('firstName')
        phone = request.data.get('phone')
        date = request.data.get('date')
        username = request.data.get('username')

        if User.objects.filter(phone=phone).exists():
            return Response("Phone Number Already Exist")
        elif isValid(phone):
            User.objects.create_user(email=email, password=password, firstName=firstName, phone=phone, date=date,
                                     username=username)
            ad = User.objects.all()
            serializer = userserializer(ad, many=True)
            return Response(serializer.data)
        else:
            return Response("In Valid Number")


def isValid(s):
    Pattern = re.compile("^[7-9][0-9]{9}$")
    return Pattern.match(s)


@api_view(['POST'])
def userauthentications(request):
    if request.method == 'POST':
        username = request.data.get('username')
        password = request.data.get('password')
        if authenticate(request, username=username, password=password):
            user = User.objects.get(username=username)
            return Response({'status': True,
                             "User": {'firstName': user.firstName, 'phone': user.phone, 'location': user.location,
                                      'address': user.address, 'userid': user.id}})
        else:
            return Response({"status": False, "User": {'userid': "null"}})


# @api_view(['POST'])
# def add_custom_details(request):
#     if request.method == 'POST':
#         custom = request.data.get('CUSTOM_type')
#         S = 6
#         key = ''.join(random.choices(string.ascii_uppercase + string.digits, k=S))
#         CUSTOM_db = CUSTOM()
#         CUSTOM_db.CUSTOM_type = custom
#         CUSTOM_db.CUSTOM_KEY = key
#         CUSTOM_db.save()
#         ad = CUSTOM.objects.all()
#         serializer = customserializer(ad, many=True)
#         return Response(serializer.data)


# @api_view(['POST'])
# def add_day_to_day_expense(request):
#     if request.method == 'POST':
#         category = request.data.get('categoys')
#         user_id = request.data.get('user_id')
#         expense_amount = request.data.get('expense_amount')
#         currencies1 = request.data.get('currencies')
#         user = User.objects.get(id=user_id)
#         expense_db = expense()
#
#         expense_db.categorys = category
#         expense_db.expense_amount = expense_amount
#         expense_db.userId_id = user.id
#         expense_db.currencies = currencies1
#         expense_db.save()
#         ad = expense.objects.filter(userId=user_id)
#         serializer = expenseserializer(ad, many=True)
#         return Response(serializer.data)
#
#
# @api_view(['POST'])
# def add_trip_expense(request):
#     if request.method == 'POST':
#         category = request.data.get('categoys')
#         user_id = request.data.get('user_id')
#         expense_amount = request.data.get('expense_amount')
#         currencies1 = request.data.get('currencies')
#         custom = request.data.get('custom')
#         user = User.objects.get(id=user_id)
#         expense_db = expense()
#         expense_db.categorys = category
#         expense_db.expense_amount = expense_amount
#         expense_db.userId_id = user.id
#         expense_db.currencies = currencies1
#         expense_db.Custom_id = custom
#         expense_db.save()
#         ad = expense.objects.filter(userId=user_id, categorys="Other")
#         serializer = expenseserializer(ad, many=True)
#         return Response(serializer.data)
#
#
# @api_view(['POST'])
# def add_otheruser_shared_trip_expense(request):
#     if request.method == 'POST':
#
#         key = request.data.get('key')
#         if CUSTOM.objects.filter(CUSTOM_KEY=key):
#             cust_object = CUSTOM.objects.get(CUSTOM_KEY=key)
#
#             category = request.data.get('categoys')
#             user_id = request.data.get('user_id')
#             expense_amount = request.data.get('expense_amount')
#             currencies1 = request.data.get('currencies')
#             # custom=request.data.get('custom')
#             user = User.objects.get(id=user_id)
#
#             expense_db = expense()
#             expense_db.categorys = category
#             expense_db.expense_amount = expense_amount
#             expense_db.userId_id = user.id
#             expense_db.currencies = currencies1
#             expense_db.Custom_id = cust_object.id
#             expense_db.save()
#             ad = expense.objects.filter(userId=user_id, categorys="Other")
#             serializer = expenseserializer(ad, many=True)
#             return Response(serializer.data)
#         else:
#             return Response('invalid shared trip')
#
#
# @api_view(['GET'])
# def expense_report(request, userid):
#     ad = expense.objects.filter(userId=userid)
#     total = 0
#
#     to_currency = "INR"
#     for i in ad:
#         curency = i.currencies
#         amount = i.expense_amount
#         result = c.convert(amount, curency, to_currency)
#         total = int(total) + int(result)
#
#     return Response({'total expence': total})

@api_view(['POST'])
def groupcreation(request):
    if request.method == 'POST':
        group = request.data.get('name')
        user_id = request.data.get('user')
        user = User.objects.get(id=user_id)
        groupname = CustomGroup.objects.create(name=group)
        groupuser = CustomGroupUser.objects.create(user=user, group=groupname)
        serializer = GroupSerializer(groupuser, many=False)
        return Response(serializer.data)


@api_view(['POST'])
def groupexpense(request):
    if request.method == 'POST':
        group_id = request.data.get('group')
        user_id = request.data.get('user')
        amount = request.data.get('payment')
        currency = request.data.get('currency')
        result = c.convert(amount,currency, "INR")
        group = CustomGroupUser.objects.get(id=group_id)
        user = User.objects.get(id=user_id)
        payment = GroupSplit.objects.create(group_id=group, user_id=user, payment=result, currency=currency)
        serializer = ExpenseSerializer(payment, many=False)
        return Response(serializer.data)


@api_view(['POST'])
def addcategory(request):
    if request.method == 'POST':
        name = request.data.get('category')
        category = CustomCategory.objects.create(category=name)
        serializer = CategorySerialiazer(category, many=False)
        return Response(serializer.data)


@api_view(['POST'])
def normalexpense(request):
    if request.method == 'POST':
        category_id = request.data.get('category_id')
        user_id = request.data.get('user_id')
        payment = request.data.get('payment')
        currency = request.data.get('currency')
        result = c.convert(payment,currency, "INR")
        category = CustomCategory.objects.get(id=category_id)
        user = User.objects.get(id=user_id)
        expense = NormalExpense.objects.create(user_id=user, category_id=category, payment=result, currency=currency)
        serializer = NormalSerializer(expense, many=False)
        return Response(serializer.data)


@api_view(['GET'])
def expenses(request, id, gid):
    user = User.objects.get(id=id)
    group = CustomGroupUser.objects.get(id=gid)
    nexpense = NormalExpense.objects.filter(user_id=user).values('payment').aggregate(Sum('payment'))
    result = NormalExpense.objects.filter(user_id=user).values('category_id').order_by('category_id').annotate(Sum('payment'))
    groupex = GroupSplit.objects.filter(group_id=group).values('user_id').order_by('user_id').annotate(Sum('payment'))
    currex = GroupSplit.objects.filter(group_id=group).values_list('currency').order_by('currency').annotate(Sum('payment'))
    l=[]
    list1=[]
    for exp in currex:
        if exp[0] is not 'INR':
            to =exp[0]
            payment=exp[1]
            res = c.convert(payment,"INR",to )
            print(res)
            l.append(to)
            l.append(res)
        else:
            print(exp[1])
            l.append(exp[0])
            l.append(exp[1])
    print(l)

    return Response({'total_sum':nexpense,'category_expence':result,'users_trip_expence':groupex,'currency':l})