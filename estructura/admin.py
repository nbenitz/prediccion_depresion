from django.contrib import admin

# Register your models here.
from .models import TipoDepresion, Items


admin.site.register(TipoDepresion)
admin.site.register(Items)

