from django.contrib.auth.hashers import make_password
from django.contrib.auth.models import AbstractUser, BaseUserManager
from django.db import models
from currency_converter import CurrencyConverter as c

SELECT_CATEGORY_CHOICES = [
    ("Food", "Food"),
    ("Travel", "Travel"),
    ("Shopping", "Shopping"),
    ("Necessities", "Necessities"),
    ("Entertainment", "Entertainment"),
    ("Other", "Other")
]

Currency_choice = [
    ("USD", "USD"),
    ("INR", "INR"),
    ("AED", "AED"),
    ("BAM", "BAM"),
    ("CAD", "CAD"),
    ("GBP", "GBP"),
    ("JEP", "JEP"),

]


class UserManager(BaseUserManager):

    def _create_user(self, phone, password, **other_fields):
        """
        Create and save a user with the given email and password. And any other fields, if specified.
        """
        if not phone:
            raise ValueError('Valid Mobile number must be given')
        # email = self.normalize_email(email)

        user = self.model(phone=phone, **other_fields)
        user.password = make_password(password)
        user.save(using=self._db)
        return user

    def _create_user_phone(self, phone, password, otp, **other_fields):
        """
        Create and save a user with the given email and password. And any other fields, if specified.
        """
        if not phone:
            raise ValueError('Phone number is mandatory')

        user = self.model(phone=phone, password=password, otp=otp, **other_fields)
        user.password = make_password(password)
        user.save(using=self._db)
        return user

    def create_user(self, phone, password=None, **other_fields):
        other_fields.setdefault('is_staff', False)
        other_fields.setdefault('is_superuser', False)
        return self._create_user(phone, password, **other_fields)

    def create_user_phone(self, phone, password, otp, **other_fields):
        other_fields.setdefault('is_staff', False)
        other_fields.setdefault('is_superuser', False)
        return self._create_user_phone(phone, password, otp, **other_fields)

    def create_superuser(self, phone, password=None, **other_fields):
        other_fields.setdefault('is_staff', True)
        other_fields.setdefault('is_superuser', True)

        if other_fields.get('is_staff') is not True:
            raise ValueError('Superuser must have is_staff=True.')
        if other_fields.get('is_superuser') is not True:
            raise ValueError('Superuser must have is_superuser=True.')

        return self._create_user(phone, password, **other_fields)


class User(AbstractUser):
    STATUS = (
        ('Registered', 'Registered'),
        ('Subscriber', 'Subscriber')
    )

    username = models.CharField(max_length=100, null=True, blank=True)
    password = models.CharField(max_length=100, null=True, blank=True)
    firstName = models.CharField(max_length=100, null=True, blank=True)
    phone = models.CharField(unique=True, null=True, blank=True, max_length=100)
    date = models.DateField(null=True, blank=True, auto_now=True)
    email = models.EmailField(max_length=50, null=True, blank=True)
    USERNAME_FIELD = 'phone'

    REQUIRED_FIELDS = ['created', 'parentUserID']
    objects = UserManager()

    def get_username(self):
        return self.email


# class CUSTOM(models.Model):
#     CUSTOM_type = models.CharField(max_length=100, null=True, blank=True)
#     CUSTOM_KEY = models.CharField(unique=True, max_length=100, null=True, blank=True, default="null")
#
#
# class expense(models.Model):
#     userId = models.ForeignKey(User, on_delete=models.CASCADE, null=True, blank=True)
#     categorys = models.CharField(max_length=200, null=True, choices=SELECT_CATEGORY_CHOICES, default='Food')
#     currencies = models.CharField(max_length=200, choices=Currency_choice, default='Food')
#     expense_amount = models.IntegerField(null=True, blank=True)
#     date = models.DateTimeField(null=True, blank=True, auto_now=True)
#     Custom = models.ForeignKey(CUSTOM, on_delete=models.CASCADE, null=True, blank=True)


class CustomCategory(models.Model):
    category = models.CharField(max_length=100, choices=SELECT_CATEGORY_CHOICES)


class CustomGroup(models.Model):
    name = models.CharField(max_length=100, null=True)
    date = models.DateTimeField(auto_now=True)


class CustomGroupUser(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    group = models.ForeignKey(CustomGroup, on_delete=models.CASCADE)
    date = models.DateTimeField(auto_now=True)


class GroupSplit(models.Model):
    group_id = models.ForeignKey(CustomGroupUser, on_delete=models.CASCADE)
    user_id = models.ForeignKey(User, on_delete=models.CASCADE)
    payment = models.IntegerField()
    currency = models.CharField(max_length=10, choices=Currency_choice)
    date = models.DateTimeField(auto_now=True)


class NormalExpense(models.Model):
    user_id = models.ForeignKey(User, on_delete=models.CASCADE)
    category_id = models.ForeignKey(CustomCategory, on_delete=models.CASCADE)
    payment = models.IntegerField()
    currency = models.CharField(max_length=10, choices=Currency_choice)
    date = models.DateTimeField(auto_now=True)

    @property
    def amountconverted(self):
        if self.currency != "INR":
            return c.convert(self.payment,self.currency,"INR")
        else:
            return self.payment


