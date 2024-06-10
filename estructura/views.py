# from django.shortcuts import render

from django.views.generic import ListView, DetailView, TemplateView
from django.views.generic.edit import CreateView, UpdateView, DeleteView, FormView
from .models import Trastorno, Escala, Pregunta, Cuestionario, Test, Resultado, Regla
from django.urls import reverse
from django.contrib import messages 
from django.contrib.messages.views import SuccessMessageMixin 
from django.contrib.auth.mixins import LoginRequiredMixin
from django.shortcuts import render, redirect, get_object_or_404
from django.http import JsonResponse
from .diagnostico import determine_depression_type
from .forms import TestForm, ReglaForm


class ObjetoListado(LoginRequiredMixin, ListView): 
    """Lista los objetos model pasado desde urls.py"""
    
class ObjetoDetalle(LoginRequiredMixin, DetailView): 
    """Muestra los detalles del objeto model pasado desde urls.py"""



#=================================== Trastorno ===========================================    

class TrastornoCrear(LoginRequiredMixin, SuccessMessageMixin, CreateView): 
    model = Trastorno 
    form = Trastorno  
    fields = "__all__" 
    success_message = 'Trastorno Creado Correctamente!' 
 
    def get_success_url(self):        
        return reverse('leerTrastorno')  
    
 
class TrastornoActualizar(LoginRequiredMixin, SuccessMessageMixin, UpdateView): 
    model = Trastorno  
    form = Trastorno  
    fields = "__all__" 
    success_message = 'Trastorno Actualizado Correctamente!'  
 
    def get_success_url(self):               
        return reverse('leerTrastorno') 

   
class TrastornoEliminar(LoginRequiredMixin, SuccessMessageMixin, DeleteView): 
    model = Trastorno 
    form = Trastorno
    fields = "__all__"     
 
    def get_success_url(self): 
        success_message = 'Trastorno Eliminado Correctamente!' 
        messages.success (self.request, (success_message))       
        return reverse('leerTrastorno') 


#=================================== TipoDepresion ===========================================    

class TipoDepresionCrear(LoginRequiredMixin, SuccessMessageMixin, CreateView): 
    model = Escala  # Llamamos a la clase 'TipoDepresion' que se encuentra en nuestro archivo 'models.py'
    form = Escala  # Definimos nuestro formulario con el nombre de la clase o modelo 'Habitacion'
    fields = "__all__"  # Le decimos a Django que muestre todos los campos de la tabla 'Habitacion' de nuestra Base de Datos 
    success_message = 'Tipo de Depresión Creada Correctamente!'  # Mostramos este Mensaje luego de Crear un Postre
 
    # Redireccionamos a la pagina principal luego de crear un registro o postre
    def get_success_url(self):        
        return reverse('leerTipoDepresion')  # Redireccionamos a la vista principal 'leer'
    
 
class TipoDepresionActualizar(LoginRequiredMixin, SuccessMessageMixin, UpdateView): 
    model = Escala  
    form = Escala  
    fields = "__all__" 
    success_message = 'Tipo de Depresión Actualizado Correctamente!' 
    def get_success_url(self):               
        return reverse('leerTipoDepresion')  

   
class TipoDepresionEliminar(LoginRequiredMixin, SuccessMessageMixin, DeleteView): 
    model = Escala 
    form = Escala
    fields = "__all__"     
 
    def get_success_url(self): 
        success_message = 'Tipo de Depresión Eliminado Correctamente!' 
        messages.success (self.request, (success_message))       
        return reverse('leerTipoDepresion')


#=================================== Pregunta ============================================

class PreguntaCrear(LoginRequiredMixin, SuccessMessageMixin, CreateView): 
    model = Pregunta 
    form = Pregunta 
    fields = "__all__" 
    success_message = 'Pregunta Creada Correctamente!' 
 
    def get_success_url(self):        
        return reverse('leerPregunta') 
    
 
class PreguntaActualizar(LoginRequiredMixin, SuccessMessageMixin, UpdateView): 
    model = Pregunta 
    form = Pregunta 
    fields = "__all__"  
    success_message = 'Pregunta Actualizada Correctamente!' 
 
    def get_success_url(self):               
        return reverse('leerPregunta')
   
class PreguntaEliminar(LoginRequiredMixin, SuccessMessageMixin, DeleteView): 
    model = Pregunta 
    form = Pregunta
    fields = "__all__"     
 
    def get_success_url(self): 
        success_message = 'Pregunta Eliminada Correctamente!' 
        messages.success (self.request, (success_message))       
        return reverse('leerPregunta') 


# ========================== Test ===================================================================
class CuestionarioCrear(LoginRequiredMixin, SuccessMessageMixin, CreateView): 
    model = Cuestionario 
    form = Cuestionario  
    fields = "__all__" 
    success_message = 'Cuestionario Creado Correctamente!' 
 
    def get_success_url(self):        
        return reverse('leerTrastorno')


class CuestionarioActualizar(LoginRequiredMixin, SuccessMessageMixin, UpdateView): 
    model = Cuestionario  
    form = Cuestionario  
    fields = "__all__" 
    success_message = 'Cuestionario Actualizado Correctamente!' 
    def get_success_url(self):               
        return reverse('leerCuestionario')  

   
class CuestionarioEliminar(LoginRequiredMixin, SuccessMessageMixin, DeleteView): 
    model = Cuestionario 
    form = Cuestionario
    fields = "__all__"     
 
    def get_success_url(self): 
        success_message = 'Cuestionario Eliminado Correctamente!' 
        messages.success (self.request, (success_message))       
        return reverse('leerCuestionario')


# ========================== Regla ===================================================================
class ReglaCrear(LoginRequiredMixin, SuccessMessageMixin, CreateView): 
    model = Regla 
    form_class = ReglaForm
    template_name="regla/crear_editar.html"
    extra_context={'titulo': 'Crear Regla'}
    success_message = 'Regla Creada Correctamente!' 
 
    def get_success_url(self):        
        return reverse('leerRegla')


class ReglaActualizar(LoginRequiredMixin, SuccessMessageMixin, UpdateView): 
    model = Regla  
    form_class = ReglaForm
    template_name="regla/crear_editar.html"
    extra_context={'titulo': 'Editar Regla'}
    success_message = 'Regla Actualizada Correctamente!' 

    def get_success_url(self):               
        return reverse('leerRegla')  

   
class ReglaEliminar(LoginRequiredMixin, SuccessMessageMixin, DeleteView): 
    model = Regla 
    form = Regla
    fields = "__all__"     
 
    def get_success_url(self): 
        success_message = 'Regla Eliminada Correctamente!' 
        messages.success (self.request, (success_message))       
        return reverse('leerRegla')
    

# ========================== Test ===================================================================
class TestCrear(LoginRequiredMixin, SuccessMessageMixin, CreateView): 
    model = Test 
    form_class = TestForm  
    success_message = 'Test Creado Correctamente!' 
 
    def get_success_url(self):        
        return reverse('procesar_test', args=[self.object.id])


class TestActualizar(LoginRequiredMixin, SuccessMessageMixin, UpdateView): 
    model = Test  
    form = Test  
    fields = "__all__" 
    success_message = 'Test Actualizado Correctamente!' 
    def get_success_url(self):               
        return reverse('leerTest')  

   
class TestEliminar(LoginRequiredMixin, SuccessMessageMixin, DeleteView): 
    model = Test 
    form = Test
    fields = "__all__"     
 
    def get_success_url(self): 
        success_message = 'Test Eliminado Correctamente!' 
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


def generar_link(request, test_id):
    url_back = reverse('test_completado', args=[test_id])
    link = request.build_absolute_uri(reverse('procesar_test', args=[test_id]))
    
    return render(request, 'resultado/generar_link.html', {
        'link': link, 
        'titulo': 'Generar Enlace',
        'url_back':url_back,
    })



class TestCompletadoView(LoginRequiredMixin, TemplateView):
    template_name = 'resultado/test_completado.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['url_back'] = reverse('leerTest')
        test_id = kwargs['test_id']

        test = Test.objects.get(id=test_id)
        resultados = Resultado.objects.filter(test=test)

        if resultados:
            answers_true = [resultado.pregunta.id for resultado in resultados if resultado.respuesta]
            escala_id = determine_depression_type(answers_true)

            escala = None
            if escala_id:
                escala = Escala.objects.get(id=escala_id)

            context['resultados'] = resultados
            context['tipo_depresion'] = escala
            return context
        else:
            context['resultados'] = None
            context['test_id'] = test_id
            return context
        


class TestCompletadoView2(LoginRequiredMixin, TemplateView):
    template_name = 'resultado/test_completado.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['url_back'] = reverse('leerTest')
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


# ========================== Ajax ===================================================================
def cargar_preguntas(request):
    cuestionario_id = request.GET.get('cuestionario_id')
    regla_id = request.GET.get('regla_id')

    preguntas = Pregunta.objects.filter(cuestionario__id=cuestionario_id).values('id', 'nro_item', 'pregunta')
    preguntas_seleccionadas = []

    if regla_id:
        try:
            regla = Regla.objects.get(id=regla_id)
            if str(regla.cuestionario.id) == cuestionario_id:
                preguntas_seleccionadas = list(regla.respuestas_necesarias.values('id', 'nro_item', 'pregunta'))
        except Regla.DoesNotExist:
            pass

    return JsonResponse({
        'preguntas': list(preguntas),
        'preguntas_seleccionadas': preguntas_seleccionadas
    })
