from rest_framework import serializers

from expense_tracker_app.models import User, GroupSplit, CustomGroup, CustomCategory, NormalExpense, CustomGroupUser


class userserializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = [
            'id',
            'phone',
            'email',
            'username',
            'password',
            'firstName',
            'date',
        ]


# class customserializer(serializers.ModelSerializer):
#     class Meta:
#         model = CUSTOM
#         fields = [
#             'id',
#             'CUSTOM_type',
#             'CUSTOM_type',
#         ]
#
#
# class expenseserializer(serializers.ModelSerializer):
#     class Meta:
#         model = expense
#         fields = [
#             'id',
#             'currencies',
#             'expense_amount',
#             'date',
#             'userId',
#             'categorys',
#             'Custom',
#         ]

class GroupSerializer(serializers.ModelSerializer):
    class Meta:
        model = CustomGroupUser
        fields = [
            'id',
            'user',
            'group',
            'date',
        ]


class ExpenseSerializer(serializers.ModelSerializer):
    class Meta:
        model = GroupSplit
        fields = [
            'id',
            'user_id',
            'group_id',
            'payment',
            'currency',
            'date',
        ]


class CategorySerialiazer(serializers.ModelSerializer):
    class Meta:
        model = CustomCategory
        fields = [
            'id',
            'category',
        ]


class NormalSerializer(serializers.ModelSerializer):
    class Meta:
        model = NormalExpense
        fields = [
            'id',
            'user_id',
            'category_id',
            'payment',
            'date',
            'currency'
        ]
