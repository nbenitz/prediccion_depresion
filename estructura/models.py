from django.db import models
from django.contrib.humanize.templatetags.humanize import intcomma


class TipoDepresion(models.Model):
    id = models.AutoField(primary_key=True)
    tipo = models.CharField(max_length=50, verbose_name="Tipo de Depresión", default="")
    descripcion = models.TextField(max_length=1024, verbose_name="Descripción")
    is_active = models.BooleanField(default=True, verbose_name="Activo")

    class Meta:
        db_table = 'tipo_depresión'
        ordering = ["tipo"]
        verbose_name_plural = "Tipos de Depresión"

    def __str__(self):  # Python 3
        return self.descripcion


class Items(models.Model):
    id = models.AutoField(primary_key=True)
    descripcion = models.CharField(max_length=20)
    is_active = models.BooleanField(default=True)

    class Meta:
        db_table = 'item'
        
    def __str__(self):  # Python 3
        return self.descripcion

