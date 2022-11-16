# from django.shortcuts import render

from django.views.generic import ListView, DetailView 
from django.views.generic.edit import CreateView, UpdateView, DeleteView
from .models import TipoDepresion, Items
from django.urls import reverse
from django.contrib import messages 
from django.contrib.messages.views import SuccessMessageMixin 
from django.contrib.auth.mixins import LoginRequiredMixin

# Create your views here.

class ObjetoListado(LoginRequiredMixin, ListView): 
    """Lista los objetos model pasado desde urls.py"""
    
class ObjetoDetalle(LoginRequiredMixin, DetailView): 
    """Muestra los detalles del objeto model pasado desde urls.py"""

#=================================== TipoDepresion ===========================================    

class TipoDepresionCrear(LoginRequiredMixin, SuccessMessageMixin, CreateView): 
    model = TipoDepresion  # Llamamos a la clase 'TipoDepresion' que se encuentra en nuestro archivo 'models.py'
    form = TipoDepresion  # Definimos nuestro formulario con el nombre de la clase o modelo 'Habitacion'
    fields = "__all__"  # Le decimos a Django que muestre todos los campos de la tabla 'Habitacion' de nuestra Base de Datos 
    success_message = 'Tipo de Depresión Creada Correctamente !'  # Mostramos este Mensaje luego de Crear un Postre
 
    # Redireccionamos a la pagina principal luego de crear un registro o postre
    def get_success_url(self):        
        return reverse('leerTipoDepresion')  # Redireccionamos a la vista principal 'leer'
    
 
class TipoDepresionActualizar(LoginRequiredMixin, SuccessMessageMixin, UpdateView): 
    model = TipoDepresion  # Llamamos a la clase 'TipoDepresion' que se encuentra en nuestro archivo 'models.py' 
    form = TipoDepresion  # Definimos nuestro formulario con el nombre de la clase o modelo 'TipoDepresion' 
    fields = "__all__"  # Le decimos a Django que muestre todos los campos de la tabla 'TipoDepresion' de nuestra Base de Datos 
    success_message = 'Tipo de Depresión Actualizada Correctamente !'  # Mostramos este Mensaje luego de Editar un Postre 
 
    # Redireccionamos a la pagina principal luego de actualizar un registro o postre
    def get_success_url(self):               
        return reverse('leerTipoDepresion')  # Redireccionamos a la vista principal 'leer'

   
class TipoDepresionEliminar(LoginRequiredMixin, SuccessMessageMixin, DeleteView): 
    model = TipoDepresion 
    form = TipoDepresion
    fields = "__all__"     
 
    # Redireccionamos a la pagina principal luego de eliminar un registro o Habitacion
    def get_success_url(self): 
        success_message = 'Tipo de Depresión Eliminado Correctamente !'  # Mostramos este Mensaje luego de Editar un Habitacion 
        messages.success (self.request, (success_message))       
        return reverse('leerTipoDepresion')  # Redireccionamos a la vista principal 'leer'


#=================================== Item ============================================

class ItemCrear(LoginRequiredMixin, SuccessMessageMixin, CreateView): 
    model = Items  # Llamamos a la clase 'Items' que se encuentra en nuestro archivo 'models.py'
    form = Items  # Definimos nuestro formulario con el nombre de la clase o modelo 'Habitacion'
    fields = "__all__"  # Le decimos a Django que muestre todos los campos de la tabla 'Habitacion' de nuestra Base de Datos 
    success_message = 'Item Creado Correctamente !'  # Mostramos este Mensaje luego de Crear un Postre
 
    # Redireccionamos a la pagina principal luego de crear un registro o postre
    def get_success_url(self):        
        return reverse('leerItem')  # Redireccionamos a la vista principal 'leer'
    
 
class ItemActualizar(LoginRequiredMixin, SuccessMessageMixin, UpdateView): 
    model = Items  # Llamamos a la clase 'Habitacion' que se encuentra en nuestro archivo 'models.py' 
    form = Items  # Definimos nuestro formulario con el nombre de la clase o modelo 'Habitacion' 
    fields = "__all__"  # Le decimos a Django que muestre todos los campos de la tabla 'Habitacion' de nuestra Base de Datos 
    success_message = 'Item Actualizado Correctamente !'  # Mostramos este Mensaje luego de Editar un Postre 
 
    # Redireccionamos a la pagina principal luego de actualizar un registro o postre
    def get_success_url(self):               
        return reverse('leerItem')  # Redireccionamos a la vista principal 'leer'

   
class ItemEliminar(LoginRequiredMixin, SuccessMessageMixin, DeleteView): 
    model = Items 
    form = Items
    fields = "__all__"     
 
    # Redireccionamos a la pagina principal luego de eliminar un registro
    def get_success_url(self): 
        success_message = 'Item Eliminado Correctamente !'  # Mostramos este Mensaje luego de Editar un Habitacion 
        messages.success (self.request, (success_message))       
        return reverse('leerItem')  # Redireccionamos a la vista principal 'leer'


