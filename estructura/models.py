from django.db import models
from django.contrib.humanize.templatetags.humanize import intcomma
from persona.models import Paciente, Doctor


class Trastorno(models.Model):
    nombre = models.CharField(
        max_length=50, verbose_name="Nombre del tipo de test", default=""
    )
    descripcion = models.TextField(max_length=1024, verbose_name="Descripción")
    is_active = models.BooleanField(default=True, verbose_name="Activo")

    class Meta:
        ordering = ["nombre"]
        verbose_name_plural = "Tipos de Test"
        db_table = "trastorno"

    def __str__(self):
        return self.nombre


class Escala(models.Model):
    id = models.AutoField(primary_key=True)
    transtorno = models.ForeignKey(Trastorno, models.RESTRICT, db_column="id_trastorno")
    tipo = models.CharField(max_length=50, verbose_name="Tipo de Depresión", default="")
    descripcion = models.TextField(max_length=1024, verbose_name="Descripción")
    caracteristicas = models.TextField(max_length=1024, verbose_name="Características")
    tratamientos = models.TextField(max_length=1024, verbose_name="Tratamientos")
    is_active = models.BooleanField(default=True, verbose_name="Activo")

    class Meta:
        ordering = ["id"]
        verbose_name_plural = "Tipos de Depresión"
        db_table = "escala"

    def __str__(self):
        return self.tipo


class Pregunta(models.Model):
    id = models.AutoField(primary_key=True)
    nro_item = models.IntegerField()
    pregunta = models.CharField(max_length=256)

    class Meta:
        ordering = ["nro_item"]
        db_table = "pregunta"

    def __str__(self):
        return f"{self.nro_item}. {self.pregunta}"


class Cuestionario(models.Model):
    nombre = models.CharField(
        max_length=50, verbose_name="Nombre del Cuestionario", default=""
    )
    trastorno = models.ForeignKey(Trastorno, on_delete=models.RESTRICT)
    preguntas = models.ManyToManyField(Pregunta)

    class Meta:
        db_table = "cuestionario"

    def __str__(self):
        return self.nombre


class Regla(models.Model):
    # nombre = models.CharField(max_length=50, verbose_name="Nombre de la regla", default='')
    cuestionario = models.ForeignKey(
        Cuestionario,
        on_delete=models.RESTRICT,
        related_name="reglas",
        verbose_name="Cuestionario",
    )
    respuestas_necesarias = models.ManyToManyField(
        Pregunta, related_name="reglas", verbose_name="Respuestas Necesarias"
    )
    escala = models.ForeignKey(
        Escala,
        on_delete=models.RESTRICT,
        related_name="reglas",
        verbose_name="Diagnóstico",
    )

    class Meta:
        db_table = "regla"

    def __str__(self):
        return self.nombre


class Test(models.Model):
    paciente = models.ForeignKey(Paciente, on_delete=models.RESTRICT)
    doctor = models.ForeignKey(Doctor, on_delete=models.RESTRICT, verbose_name='Psicólogo')
    cuestionario = models.ForeignKey(Cuestionario, on_delete=models.RESTRICT)
    fecha = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = "test"

    def __str__(self):
        return f"{self.paciente} - {self.fecha}"


class Resultado(models.Model):
    test = models.ForeignKey(Test, on_delete=models.RESTRICT, related_name="resultado")
    pregunta = models.ForeignKey(Pregunta, on_delete=models.RESTRICT)
    respuesta = models.BooleanField()

    class Meta:
        db_table = "resultado"
