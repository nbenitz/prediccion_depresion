# estructura/urls.py
from django.urls import path

from estructura import models
from estructura.views import TipoDepresionCrear, TipoDepresionActualizar, TipoDepresionEliminar 
from estructura.views import ItemCrear, ItemActualizar, ItemEliminar
from estructura.views import ObjetoListado, ObjetoDetalle

urlpatterns = [
    #url de categoria habitacion
    path('tipodepresion/', ObjetoListado.as_view(model = models.TipoDepresion,
                                                 template_name="tipodepresion/index.html",
                                                 extra_context={'titulo':'Tipo de Depresión',
                                                                'plural':'Tipos de Depresión'}), name='leerTipoDepresion'),


    path('tipodepresion/detalle/<str:pk>', ObjetoDetalle.as_view(model = models.TipoDepresion,
                                                                template_name="tipodepresion/detalles.html",
                                                                extra_context={'titulo':'Detalles del Tipo de Depresión'},
                                                                ), name='detallesTipoDepresion'),
    
    path('tipodepresion/crear', TipoDepresionCrear.as_view(template_name="crud/crear_editar.html",
                                                         extra_context={'titulo':'Crear Tipo de Depresión'}), name='CrearTipoDepresion'),
    
    path('tipodepresion/editar/<str:pk>', TipoDepresionActualizar.as_view(template_name="crud/crear_editar.html",
                                                                        extra_context={'titulo':'Editar Tipo de Depresión'}), name='actualizarTipoDepresion'),
    
    path('tipodepresion/eliminar/<str:pk>', TipoDepresionEliminar.as_view(), name='eliminarTipoDepresion'),
    
    #url de categoria producto
    path('item/', ObjetoListado.as_view(model = models.Items,
                                                 template_name="item/index.html",
                                                 extra_context={'titulo':'Pregunta',
                                                                'plural':'Preguntas'}), name='leerItem'),
    
    path('item/detalle/<str:pk>', ObjetoDetalle.as_view(model = models.Items, 
                                                                 template_name="item/detalles.html",
                                                                 extra_context={'titulo':'Item'},
                                                                 ), name='detallesItem'),
    
    path('item/crear', ItemCrear.as_view(template_name="crud/crear_editar.html",
                                                           extra_context={'titulo':'Crear Pregunta'}), name='CrearItem'),
    
    path('item/editar/<str:pk>', ItemActualizar.as_view(template_name="crud/crear_editar.html",
                                                                          extra_context={'titulo':'Editar Pregunta'}), name='actualizarItem'),
    
    path('item/eliminar/<str:pk>', ItemEliminar.as_view(), name='eliminarItem'),
    
]