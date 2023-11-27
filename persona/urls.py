from django.urls import path
from django.contrib.auth import get_user_model

from persona.views import ObjetoListado, ObjetoDetalle, activation_sent_view, activate, activation_complete_view

from persona.views import PacienteCrear, PacienteActualizar, PacienteEliminar, create_doctor, edit_doctor
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
    # path('paciente/eliminar/<str:pk>', PacienteEliminar.as_view(), name='eliminarPaciente'),
    path('doctor/', ObjetoListado.as_view(
        template_name="doctor/index.html",
        model=get_user_model(),
        extra_context={
            'titulo': 'Doctor',
            'plural': 'Doctores'
        }), name='leerDoctor'
    ),
    path('doctor/detalle/<str:pk>', ObjetoDetalle.as_view(
        template_name="doctor/detalles.html",
        model=get_user_model(),
        extra_context={'titulo': 'Doctor'}), name='detallesDoctor'
    ),
    path('doctor/crear', create_doctor, name='crearDoctor'),
    path('doctor/editar/<str:pk>', edit_doctor, name='actualizarDoctor'),
    # path('doctor/eliminar/<str:pk>', DoctorEliminar.as_view(), name='eliminarDoctor'),
    path('signup/', create_doctor, name="signup"),
    path('sent/', activation_sent_view, name="activation_send"),
    path('activate/<slug:uidb64>/<slug:token>/', activate, name='activate'),
    path('activated/', activation_complete_view, name='activation_complete'),
]
