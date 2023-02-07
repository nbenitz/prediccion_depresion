from django.db import models
from django.contrib.humanize.templatetags.humanize import intcomma
from persona.models import Paciente, Doctor



class Trastorno(models.Model):
    nombre = models.CharField(max_length=50, verbose_name="Nombre del trastorno", default="")
    descripcion = models.TextField(max_length=1024, verbose_name="Descripción")
    is_active = models.BooleanField(default=True, verbose_name="Activo")

    class Meta:
        ordering = ["nombre"]
        verbose_name_plural = "Trastornos"

    def __str__(self):  # Python 3
        return self.nombre


class Escala(models.Model):
    id = models.AutoField(primary_key=True)
    transtorno = models.ForeignKey(Trastorno,
                                   models.DO_NOTHING,
                                   db_column='id_trastorno',
                                   verbose_name="Trastorno")
    tipo = models.CharField(max_length=50, verbose_name="Tipo de Depresión", default="")
    descripcion = models.TextField(max_length=1024, verbose_name="Descripción")
    caracteristicas = models.TextField(max_length=1024, verbose_name="Características")
    tratamientos = models.TextField(max_length=1024, verbose_name="Tratamientos")
    is_active = models.BooleanField(default=True, verbose_name="Activo")

    class Meta:
        ordering = ["id"]
        verbose_name_plural = "Tipos de Depresión"

    def __str__(self):  # Python 3
        return self.tipo


class Pregunta(models.Model):
    id = models.AutoField(primary_key=True)
    nro_item = models.IntegerField()
    pregunta = models.CharField(max_length=256)

    class Meta:
        ordering = ["nro_item"]
        
    def __str__(self):  # Python 3
        return self.pregunta


class Cuestionario(models.Model):
    trastorno = models.ForeignKey(Trastorno, on_delete=models.CASCADE)
    preguntas = models.ManyToManyField(Pregunta)

    def __str__(self):
        return self.trastorno.nombre

class Test(models.Model):
    paciente = models.ForeignKey(Paciente, on_delete=models.CASCADE)
    doctor = models.ForeignKey(Doctor, on_delete=models.CASCADE)
    cuestionario = models.ForeignKey(Cuestionario, on_delete=models.CASCADE)
    fecha = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f'{self.paciente} - {self.fecha}'

class Resultado(models.Model):
    test = models.ForeignKey(Test, on_delete=models.CASCADE)
    pregunta = models.ForeignKey(Pregunta, on_delete=models.CASCADE)
    respuesta = models.BooleanField()

