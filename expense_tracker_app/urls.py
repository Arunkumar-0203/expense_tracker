from django.urls import path

from expense_tracker_app import views
urlpatterns = [
        path('registration',views.adduser,name='registration'),
        path('userauthentications',views.userauthentications,name="userauthentications"),
        path('groupcreation',views.groupcreation,name="groupcreation"),
        path('groupexpense',views.groupexpense,name="groupexpense"),
        path('addcategory',views.addcategory,name="addcategory"),
        path('normalexpense',views.normalexpense,name="normalexpense"),
        path('expense/<int:id>/<int:gid>',views.expenses,name="expense_report"),
        ]