from django.contrib import admin

# Register your models here.
from .models import Escala, Pregunta, Regla


admin.site.register(Escala)
admin.site.register(Pregunta)
admin.site.register(Regla)

