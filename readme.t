# -*- coding: utf-8 -*-
Paso 1: Preparar el entorno
#---------------------------------

# Crear un entorno virtual
python -m venv venv
# Activar el entorno virtual
# En Windows:
venv\Scripts\activate
# En macOS/Linux:
source venv/bin/activate
# Actualizar pip
python -m pip install --upgrade pip


#---------------------------------- 
Paso 2: Instalar Django y crear un proyecto
#----------------------------------

# Instalar Django
bash
# Instalar Django
pip install django
# Crear un proyecto Django
django-admin startproject miproyecto
# Entrar al directorio del proyecto
cd miproyecto
# Crear una aplicación (opcional pero recomendado)
python manage.py startapp miapp

#-----------------------------------
Paso 3: Configurar la aplicación en el proyecto
Abre miproyecto/settings.py y añade tu aplicación:
#-----------------------------------

python
INSTALLED_APPS = [
 'django.contrib.admin',
 'django.contrib.auth',
 'django.contrib.contenttypes',
 'django.contrib.sessions',
 'django.contrib.messages',
 'django.contrib.staticfiles',
 'miapp', # Añadir tu aplicación
]

#-----------------------------------
Paso 4: Instalar django-tailwind
#-----------------------------------

# Instalar django-tailwind con soporte para recarga automática
pip install "django-tailwind[reload]"
Paso 5: Configurar django-tailwind en el proyecto
Abre miproyecto/settings.py y añade 'tailwind' a INSTALLED_APPS:
python
INSTALLED_APPS = [
 'django.contrib.admin',
 'django.contrib.auth',
 'django.contrib.contenttypes',
 'django.contrib.sessions',
 'django.contrib.messages',
 'django.contrib.staticfiles',
 'miapp',
 'tailwind', # Añadir tailwind
]

# -------------------------------------
Paso 6: Inicializar Tailwind CSS
# -------------------------------------

# Inicializar tailwind (creará una aplicación 'theme')
python manage.py tailwind init
Este comando creará una nueva aplicación Django llamada 'theme' que contendrá la
configuración de Tailwind CSS.

# -------------------------------------
Paso 7: Añadir la aplicación theme a INSTALLED_APPS
Después de ejecutar el comando anterior, abre miproyecto/settings.py y añade
# -------------------------------------

'theme' a INSTALLED_APPS:
python
INSTALLED_APPS = [
 'django.contrib.admin',
 'django.contrib.auth',
 'django.contrib.contenttypes',
 'django.contrib.sessions',
 'django.contrib.messages',
 'django.contrib.staticfiles',
 'miapp',
 'tailwind',
 'theme', # Añadir la aplicación theme
]

# -------------------------------------
Paso 8: Configurar el nombre de la aplicación Tailwind
En el mismo archivo miproyecto/settings.py, añade esta línea:
python

TAILWIND_APP_NAME = 'theme'

# ------------------------------------------------------------------------------
Paso 9: Instalar Node.js (prerrequisito)
# -------------------------------------------------------------------------------

Tailwind requiere Node.js. Si no lo tienes instalado:
• Para Windows: Descarga e instala desde nodejs.org
• Para macOS: Puedes usar Homebrew con brew install node
• Para Linux: Usa el gestor de paquetes de tu distribución, como apt install
nodejs
Verifica la instalación con:
bash
node --version
npm --version
En el   miproyecto/settings.py colocar:

NPM_BIN_PATH = r"C:\Program Files\nodejs\npm.cmd"
Esta ruta es donde está instalado nodeis en tu equipo para obtenerla
ejecuta este comando: where npm
La ruta que te es la que colocas en NPM_BIN_PATH(le puedes indicar a
la IA que te sugiera cual de ellas si te sale mas de una y como
colocarla)


Paso 10: Instalar las dependencias de Tailwind
bash
# Instalar las dependencias de Tailwind
python manage.py tailwind install
Este comando instalará todas las dependencias de npm necesarias para Tailwind CSS.
Paso 11: Configurar la recarga automática (opcional pero recomendado)
Si instalaste con el extra "reload", configura el middleware y las URLs:
Añade el middleware en miproyecto/settings.py:
python
MIDDLEWARE = [
 # ... otros middleware
 'django_browser_reload.middleware.BrowserReloadMiddleware',
]

Añade la URL en miproyecto/urls.py:
python
from django.urls import include, path
urlpatterns = [
 # ... otras URLs
 path("__reload__/", include("django_browser_reload.urls")),
]
También añade 'django_browser_reload' a INSTALLED_APPS:
python
INSTALLED_APPS = [
 # ... otras apps
 'django_browser_reload',
]

# -------------------------------------
Paso 12: Configurar el directorio de plantillas
# -------------------------------------

Crea un directorio para tus plantillas y configúralo en miproyecto/settings.py:
bash
# Crear directorio de plantillas
mkdir templates
python
TEMPLATES = [
 {
 'BACKEND': 'django.template.backends.django.DjangoTemplates',
 'DIRS': [BASE_DIR / 'templates'], # Añadir esta línea
 'APP_DIRS': True,
 # ...
 },
]

# -------------------------------------
Paso 13: Crear una plantilla base
# -------------------------------------

Crea un archivo templates/base.html:
html
{% load static tailwind_tags %}
<!DOCTYPE html>
<html lang="es">
<head>
 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initialscale=1.0">
 <title>{% block title %}Mi Proyecto Django{% endblock %}</title>
 {% tailwind_css %}
</head>
<body class="bg-gray-100 min-h-screen">
 <div class="container mx-auto px-4 py-8">
 {% block content %}{% endblock %}
 </div>
</body>
</html>

# -------------------------------------
Paso 14: Crear una vista home y su plantilla
# -------------------------------------


En miapp/views.py:
python
from django.shortcuts import render
def home(request):
 return render(request, 'home.html')
Crea un archivo templates/home.html:
html
{% extends 'base.html' %}
{% block title %}Inicio{% endblock %}
{% block content %}
<div class="max-w-md mx-auto bg-white rounded-xl shadow-md overflowhidden md:max-w-2xl p-8 mt-10">
 <h1 class="text-3xl font-bold text-indigo-600 mb-4">Bienvenido a
mi proyecto Django + Tailwind CSS</h1>
 <p class="text-gray-700">Este es un ejemplo de un proyecto Django
con Tailwind CSS 4.0 correctamente configurado.</p>
 <button class="mt-4 bg-indigo-500 hover:bg-indigo-700 text-white
font-bold py-2 px-4 rounded">
 Click Me
 </button>
</div>
{% endblock %}


# -------------------------------------
Paso 15: Configurar las URLs
# -------------------------------------

En miproyecto/urls.py:

from django.contrib import admin
from django.urls import path, include
from miapp.views import home

urlpatterns = [
 path('admin/', admin.site.urls),
 path('', home, name='home'),
 path("__reload__/", include("django_browser_reload.urls")),
]


# ------------------------------------- 
Paso 16: Iniciar Tailwind y el servidor Django
# -------------------------------------

# Inicia el proceso de compilación de Tailwind
# En una terminal, inicia el proceso de compilación de Tailwind:

python manage.py tailwind start

 # En otra terminal, ejecuta las migraciones e inicia el servidor de Django:

python manage.py migrate
python manage.py runserver