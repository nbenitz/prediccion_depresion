from django.contrib import admin

# Register your models here.
from .models import Escala, Pregunta


admin.site.register(Escala)
admin.site.register(Pregunta)

