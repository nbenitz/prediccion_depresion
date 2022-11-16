# persona/urls.py
from django.urls import path
from django.contrib.auth import get_user_model

from persona.views import ObjetoListado, ObjetoDetalle, activation_sent_view,\
    activate, activation_complete_view
from persona.views import UsuarioListado

from persona.views import create_paciente, edit_paciente, create_doctor, edit_doctor,\
    create_paciente2

urlpatterns = [
    path('paciente/', ObjetoListado.as_view(template_name="paciente/index.html",
                                            model = get_user_model(),
                                            extra_context={'titulo':'Paciente',
                                                           'plural':'Pacientes'}
                                            ), name='leerPaciente', kwargs={'is_paciente':'1'}),
    
    path('paciente/detalle/<str:pk>', ObjetoDetalle.as_view(template_name="paciente/detalles.html",
                                                           model = get_user_model(),
                                                           extra_context={'titulo':'Paciente'}
                                                           ), name='detallesPaciente'),
    
    path('paciente/crear', create_paciente2, name='crearPaciente'),
    path('paciente/editar/<str:pk>', edit_paciente, name='actualizarPaciente'),
    #path('paciente/eliminar/<str:pk>', PacienteEliminar.as_view(), name='eliminarPaciente'),

    path('doctor/', ObjetoListado.as_view(template_name="doctor/index.html",
                                            model = get_user_model(),
                                            extra_context={'titulo':'Psicólogo',
                                                           'plural':'Psicólogos'}
                                            ), name='leerDoctor', kwargs={'is_paciente':'0'}),
    
    path('doctor/detalle/<str:pk>', ObjetoDetalle.as_view(template_name="doctor/detalles.html",
                                                            model = get_user_model(),
                                                            extra_context={'titulo':'Psicólogo'}
                                                            ), name='detallesDoctor'),
    
    path('doctor/crear', create_doctor, name='crearDoctor'),
    path('doctor/editar/<str:pk>', edit_doctor, name='actualizarDoctor'),
    #path('doctor/eliminar/<str:pk>', DoctorEliminar.as_view(), name='eliminarDoctor'),

    path('user/', UsuarioListado.as_view(template_name="user/index.html"), name='leerUsuario'),   

    path('signup/', create_paciente2, name="signup"),
    path('sent/', activation_sent_view, name="activation_send"),
    path('activate/<slug:uidb64>/<slug:token>/', activate, name='activate'),
    path('activated/', activation_complete_view, name='activation_complete'),
    
]

