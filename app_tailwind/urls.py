
from django.contrib import admin
from django.urls import path

from app_tailwind.views import about
app_name = 'app_tailwind'

urlpatterns = [
    path('/about/', about, name='about'),
]
