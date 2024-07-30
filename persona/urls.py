from django.urls import path
from django.contrib.auth import get_user_model

from persona.views import ObjetoListado, ObjetoDetalle, activation_sent_view, activate, activation_complete_view

from persona.views import PacienteCrear, PacienteActualizar, inactivar_paciente, create_doctor, edit_doctor, inactivar_doctor, activar_doctor, activar_paciente
from persona import models

urlpatterns = [
    path('paciente/', ObjetoListado.as_view(
        model=models.Paciente,
        template_name="paciente/index.html",
        extra_context={
            'titulo': 'Paciente',
            'plural': 'Pacientes'
        }), name='leerPaciente'
    ),
    path('paciente/detalle/<str:pk>', ObjetoDetalle.as_view(
        template_name="paciente/detalles.html",
        model=models.Paciente,
        extra_context={'titulo': 'Paciente'}), name='detallesPaciente'
    ),
    path('paciente/crear', PacienteCrear.as_view(
        template_name="paciente/crear_editar.html",
        extra_context={'titulo':'Crear Paciente'}), name='CrearPaciente'
    ),
    path('paciente/editar/<str:pk>', PacienteActualizar.as_view(
        template_name="paciente/crear_editar.html",
        extra_context={'titulo':'Editar Paciente'}), name='actualizarPaciente'
    ),
    path('paciente/inactivar/<str:pk>', inactivar_paciente, name='eliminarPaciente'),
    path('paciente/activar/<str:pk>', activar_paciente, name='activarPaciente'),
    path('doctor/', ObjetoListado.as_view(
        template_name="doctor/index.html",
        model=get_user_model(),
        extra_context={
            'titulo': 'Psicólogo',
            'plural': 'Psicólogos'
        }), name='leerDoctor'
    ),
    path('doctor/detalle/<str:pk>', ObjetoDetalle.as_view(
        template_name="doctor/detalles.html",
        model=get_user_model(),
        extra_context={'titulo': 'Psicólogo'}), name='detallesDoctor'
    ),
    path('doctor/crear', create_doctor, name='crearDoctor'),
    path('doctor/editar/<str:pk>', edit_doctor, name='actualizarDoctor'),
    path('doctor/inactivar/<str:pk>', inactivar_doctor, name='eliminarDoctor'),
    path('doctor/activar/<str:pk>', activar_doctor, name='activarDoctor'),
    path('signup/', create_doctor, name="signup"),
    path('sent/', activation_sent_view, name="activation_send"),
    path('activate/<slug:uidb64>/<slug:token>/', activate, name='activate'),
    path('activated/', activation_complete_view, name='activation_complete'),
]
