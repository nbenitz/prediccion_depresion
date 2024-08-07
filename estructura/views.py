# from django.shortcuts import render
from django.http import HttpResponseRedirect
from django.views.generic import ListView, DetailView, TemplateView, View
from django.views.generic.edit import CreateView, UpdateView, DeleteView, FormView
from .models import Trastorno, Escala, Pregunta, Cuestionario, Test, Resultado, Regla
from django.urls import reverse
from django.contrib import messages 
from django.contrib.messages.views import SuccessMessageMixin 
from django.contrib.auth.mixins import LoginRequiredMixin
from django.shortcuts import render, redirect, get_object_or_404
from django.http import JsonResponse
from django.db.models import Prefetch
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


    
class TrastornoInactivar(LoginRequiredMixin, SuccessMessageMixin, View):
    def post(self, request, pk):
        trastorno = get_object_or_404(Trastorno, pk=pk)
        trastorno.is_active = False
        trastorno.save()
        success_message = 'Trastorno Inactivado Correctamente!'
        messages.success(request, success_message)
        return HttpResponseRedirect(reverse('leerTrastorno'))
    


class TrastornoActivar(LoginRequiredMixin, SuccessMessageMixin, View):
    def post(self, request, pk):
        trastorno = get_object_or_404(Trastorno, pk=pk)
        trastorno.is_active = True
        trastorno.save()
        success_message = 'Trastorno Activado Correctamente!'
        messages.success(request, success_message)
        return HttpResponseRedirect(reverse('leerTrastorno'))


#=================================== TipoDepresion ===========================================    

class TipoDepresionListar(LoginRequiredMixin, ListView): 
    model = Escala
    form = Escala
    fields = "__all__" 
    template_name="escala/index.html"


    def get_queryset(self):
        query = self.request.GET.get("q")
        print('query:', query)
        if query:
            return Escala.objects.filter(tipo__icontains=query)
        else:
            return Escala.objects.all()
        

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['q'] = self.request.GET.get("q")
        return context
    


class TipoDepresionCrear(LoginRequiredMixin, SuccessMessageMixin, CreateView): 
    model = Escala
    form = Escala
    fields = "__all__" 
    success_message = 'Tipo de Depresión Creada Correctamente!'
 
    def get_success_url(self):        
        return reverse('leerTipoDepresion')
    

 
class TipoDepresionActualizar(LoginRequiredMixin, SuccessMessageMixin, UpdateView): 
    model = Escala  
    form = Escala  
    fields = "__all__" 
    success_message = 'Tipo de Depresión Actualizado Correctamente!' 
    def get_success_url(self):               
        return reverse('leerTipoDepresion')  

   
class TipoDepresionInactivar(LoginRequiredMixin, SuccessMessageMixin, View):
    def post(self, request, pk):
        escala = get_object_or_404(Escala, pk=pk)
        escala.is_active = False
        escala.save()
        success_message = 'Tipo de Depresión Inactivado Correctamente!'
        messages.success(request, success_message)
        return HttpResponseRedirect(reverse('leerTipoDepresion'))
    


class TipoDepresionActivar(LoginRequiredMixin, SuccessMessageMixin, View):
    def post(self, request, pk):
        escala = get_object_or_404(Escala, pk=pk)
        escala.is_active = True
        escala.save()
        success_message = 'Tipo de Depresión Activado Correctamente!'
        messages.success(request, success_message)
        return HttpResponseRedirect(reverse('leerTipoDepresion'))


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

    def get_form(self, form_class=None):
        form = super().get_form(form_class)
        form.fields['trastorno'].queryset = Trastorno.objects.filter(is_active=True)
        return form

    def get_success_url(self):
        return reverse('leerCuestionario')


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
class TestListar(LoginRequiredMixin, ListView):
    model = Test
    template_name = "test/index.html"
    extra_context = {"titulo": "Test", "plural": "Tests"}

    def get_queryset(self):
        queryset = super().get_queryset()
        
        # Prefetch results to avoid N+1 query problem
        queryset = queryset.prefetch_related(
            Prefetch('resultado', queryset=Resultado.objects.all())
        )
        
        # Añadir un campo `diagnostico` a cada instancia en el queryset
        for test in queryset:
            test.diagnostico = self.get_diagnostico(test)
        
        return queryset

    def get_diagnostico(self, test):
        resultados = Resultado.objects.filter(test=test)
        if resultados:
            answers_true = [resultado.pregunta.id for resultado in resultados if resultado.respuesta]
            escala_id = determine_depression_type(answers_true)

            if escala_id:
                escala = Escala.objects.get(id=escala_id)
                return escala
            else:
                return 'No se determina ningún tipo de depresión'
        else:
            return None

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context.update(self.extra_context)
        return context



class TestCrear(LoginRequiredMixin, SuccessMessageMixin, CreateView): 
    model = Test 
    form_class = TestForm  
    success_message = 'Test Creado Correctamente!' 
 
    def get_form_kwargs(self):
        kwargs = super().get_form_kwargs()
        kwargs['user'] = self.request.user
        return kwargs

    def get_success_url(self):        
        return reverse('test_completado', args=[self.object.id])



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
