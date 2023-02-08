# from django.shortcuts import render

from django.views.generic import ListView, DetailView, TemplateView
from django.views.generic.edit import CreateView, UpdateView, DeleteView, FormView
from .models import Trastorno, Escala, Pregunta, Cuestionario, Test, Resultado
from django.urls import reverse
from django.contrib import messages 
from django.contrib.messages.views import SuccessMessageMixin 
from django.contrib.auth.mixins import LoginRequiredMixin
from django.shortcuts import render, redirect, get_object_or_404
from .diagnostico import determine_depression_type
# Create your views here.

class ObjetoListado(LoginRequiredMixin, ListView): 
    """Lista los objetos model pasado desde urls.py"""
    
class ObjetoDetalle(LoginRequiredMixin, DetailView): 
    """Muestra los detalles del objeto model pasado desde urls.py"""



#=================================== Trastorno ===========================================    

class TrastornoCrear(LoginRequiredMixin, SuccessMessageMixin, CreateView): 
    model = Trastorno 
    form = Trastorno  
    fields = "__all__" 
    success_message = 'Trastorno Creado Correctamente !' 
 
    def get_success_url(self):        
        return reverse('leerTrastorno')  
    
 
class TrastornoActualizar(LoginRequiredMixin, SuccessMessageMixin, UpdateView): 
    model = Trastorno  
    form = Trastorno  
    fields = "__all__" 
    success_message = 'Trastorno Actualizado Correctamente !'  
 
    def get_success_url(self):               
        return reverse('leerTrastorno') 

   
class TrastornoEliminar(LoginRequiredMixin, SuccessMessageMixin, DeleteView): 
    model = Trastorno 
    form = Trastorno
    fields = "__all__"     
 
    def get_success_url(self): 
        success_message = 'Trastorno Eliminado Correctamente !' 
        messages.success (self.request, (success_message))       
        return reverse('leerTrastorno') 


#=================================== TipoDepresion ===========================================    

class TipoDepresionCrear(LoginRequiredMixin, SuccessMessageMixin, CreateView): 
    model = Escala  # Llamamos a la clase 'TipoDepresion' que se encuentra en nuestro archivo 'models.py'
    form = Escala  # Definimos nuestro formulario con el nombre de la clase o modelo 'Habitacion'
    fields = "__all__"  # Le decimos a Django que muestre todos los campos de la tabla 'Habitacion' de nuestra Base de Datos 
    success_message = 'Tipo de Depresión Creada Correctamente !'  # Mostramos este Mensaje luego de Crear un Postre
 
    # Redireccionamos a la pagina principal luego de crear un registro o postre
    def get_success_url(self):        
        return reverse('leerTipoDepresion')  # Redireccionamos a la vista principal 'leer'
    
 
class TipoDepresionActualizar(LoginRequiredMixin, SuccessMessageMixin, UpdateView): 
    model = Escala  
    form = Escala  
    fields = "__all__" 
    success_message = 'Tipo de Depresión Actualizado Correctamente !' 
    def get_success_url(self):               
        return reverse('leerTipoDepresion')  

   
class TipoDepresionEliminar(LoginRequiredMixin, SuccessMessageMixin, DeleteView): 
    model = Escala 
    form = Escala
    fields = "__all__"     
 
    def get_success_url(self): 
        success_message = 'Tipo de Depresión Eliminado Correctamente !' 
        messages.success (self.request, (success_message))       
        return reverse('leerTipoDepresion')


#=================================== Pregunta ============================================

class PreguntaCrear(LoginRequiredMixin, SuccessMessageMixin, CreateView): 
    model = Pregunta 
    form = Pregunta 
    fields = "__all__" 
    success_message = 'Pregunta Creada Correctamente !' 
 
    def get_success_url(self):        
        return reverse('leerPregunta') 
    
 
class PreguntaActualizar(LoginRequiredMixin, SuccessMessageMixin, UpdateView): 
    model = Pregunta 
    form = Pregunta 
    fields = "__all__"  
    success_message = 'Pregunta Actualizada Correctamente !' 
 
    def get_success_url(self):               
        return reverse('leerPregunta')
   
class PreguntaEliminar(LoginRequiredMixin, SuccessMessageMixin, DeleteView): 
    model = Pregunta 
    form = Pregunta
    fields = "__all__"     
 
    def get_success_url(self): 
        success_message = 'Pregunta Eliminada Correctamente !' 
        messages.success (self.request, (success_message))       
        return reverse('leerPregunta') 


class CuestionarioCrear(LoginRequiredMixin, SuccessMessageMixin, CreateView): 
    model = Cuestionario 
    form = Cuestionario  
    fields = "__all__" 
    success_message = 'Cuestionario Creado Correctamente !' 
 
    def get_success_url(self):        
        return reverse('leerTrastorno')


class CuestionarioActualizar(LoginRequiredMixin, SuccessMessageMixin, UpdateView): 
    model = Cuestionario  
    form = Cuestionario  
    fields = "__all__" 
    success_message = 'Cuestionario Actualizado Correctamente !' 
    def get_success_url(self):               
        return reverse('leerCuestionario')  

   
class CuestionarioEliminar(LoginRequiredMixin, SuccessMessageMixin, DeleteView): 
    model = Cuestionario 
    form = Cuestionario
    fields = "__all__"     
 
    def get_success_url(self): 
        success_message = 'Cuestionario Eliminado Correctamente !' 
        messages.success (self.request, (success_message))       
        return reverse('leerCuestionario')


# ========================== Test ===================================================================
class TestCrear(LoginRequiredMixin, SuccessMessageMixin, CreateView): 
    model = Test 
    form = Test  
    fields = "__all__" 
    success_message = 'Test Creado Correctamente !' 
 
    def get_success_url(self):        
        return reverse('procesar_test', args=[self.object.id])

class TestActualizar(LoginRequiredMixin, SuccessMessageMixin, UpdateView): 
    model = Test  
    form = Test  
    fields = "__all__" 
    success_message = 'Test Actualizado Correctamente !' 
    def get_success_url(self):               
        return reverse('leerTest')  

   
class TestEliminar(LoginRequiredMixin, SuccessMessageMixin, DeleteView): 
    model = Test 
    form = Test
    fields = "__all__"     
 
    def get_success_url(self): 
        success_message = 'Test Eliminado Correctamente !' 
        messages.success (self.request, (success_message))       
        return reverse('leerTest')


def procesar_test(request, test_id):
    test = get_object_or_404(Test, id=test_id)
    cuestionario = test.cuestionario

    if request.method == 'POST':
        for pregunta in cuestionario.preguntas.all():
            respuesta = request.POST.get(str(pregunta.id), None)
            if respuesta is not None:
                Resultado.objects.create(test=test, pregunta=pregunta, respuesta=respuesta)

        return redirect('test_completado', test_id=test_id)

    return render(request, 'resultado/test.html', {'cuestionario': cuestionario})


class TestCompletadoView(TemplateView):
    template_name = 'resultado/test_completado.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        test_id = kwargs['test_id']

        test = Test.objects.get(id=test_id)
        resultados = Resultado.objects.filter(test=test)

        if resultados:
            answers_true = [resultado.pregunta.nro_item for resultado in resultados if resultado.respuesta]
            depression_type = determine_depression_type(answers_true)

            escala = None
            if depression_type:
                escala = Escala.objects.get(id=depression_type)

            context['resultados'] = resultados
            context['tipo_depresion'] = escala
            return context
        else:
            context['resultados'] = None
            context['test_id'] = test_id
            return context


