from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
#from django.contrib.auth.models import User

# Register your models here.
from .models import User, Paciente, Doctor

    
# Define an inline admin descriptor for Worker model
# which acts a bit like a singleton
class PacienteProfileInline(admin.StackedInline):
    model = Paciente
    can_delete = False
    verbose_name_plural = 'Pacientes'

# Define a new User admin
class UserAdmin(BaseUserAdmin):
    inlines = (PacienteProfileInline,)


admin.site.register(User, UserAdmin)
admin.site.register(Paciente)
admin.site.register(Doctor)