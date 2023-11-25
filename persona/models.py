# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models
#from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver

from django.contrib.auth.models import AbstractUser


class User(AbstractUser):
    telefono = models.CharField("Teléfono", max_length=15, blank=True, null=True)
    direccion = models.CharField("Dirección", max_length=50, blank=True, null=True)
    signup_confirmation = models.BooleanField(default=False)

    def __str__(self):
        return self.first_name + " " + self.last_name
 
    
class Paciente(models.Model):
    ci = models.CharField(max_length=15, unique=True)
    nombre = models.CharField(max_length=50)
    apellido = models.CharField(max_length=50)
    fecha_nacimiento = models.DateField()
    telefono = models.CharField("Teléfono", max_length=15, blank=True, null=True)
    direccion = models.CharField("Dirección", max_length=50, blank=True, null=True)
    email = models.EmailField(unique=True)

    def __str__(self):
        return self.apellido + ", " + self.nombre
    
  
class Doctor(models.Model):
    user = models.OneToOneField(
        User,
        on_delete=models.CASCADE,
        null=True,
        related_name='doctor'
    )
    ci = models.CharField(max_length=15, unique=True) 
        
    def __str__(self):
        return self.user.last_name + ", " + self.user.first_name


    
