from django.shortcuts import render


from collections import defaultdict
from django.core import management
from django.views.generic import View, ListView
from django.contrib.auth.mixins import LoginRequiredMixin
from django.http import HttpResponse
from django.template.loader import render_to_string
from django.urls import reverse
from django.db.models import Prefetch
from weasyprint import HTML, CSS
from estructura.models import Test, Resultado, Escala
from estructura.diagnostico import determine_depression_type
#importar formulario
from .forms import DateRangeForm



class TestListar(LoginRequiredMixin, ListView):
    model = Test
    template_name = "reporte/index.html"
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



class TestPDFView(LoginRequiredMixin, View):
    def get(self, request, *args, **kwargs):
        test_id = kwargs['test_id']
        test = Test.objects.get(id=test_id)
        resultados = Resultado.objects.filter(test=test)

        if resultados:
            answers_true = [resultado.pregunta.id for resultado in resultados if resultado.respuesta]
            escala_id = determine_depression_type(answers_true)
            escala = Escala.objects.get(id=escala_id) if escala_id else None
        else:
            escala = None

        context = {
            'resultados': resultados,
            'tipo_depresion': escala,
            'url_back': reverse('leerTest')
        }

        html_string = render_to_string('reporte/test_completado_pdf.html', context)
        html = HTML(string=html_string)
        pdf_file = html.write_pdf()

        response = HttpResponse(pdf_file, content_type='application/pdf')
        response['Content-Disposition'] = f'inline; filename="test_{test_id}_resultados.pdf"'
        return response


# Vista para mostrar pagina para filtrar tests por rango de fechas
class FiltrarTestsPorFechaView(LoginRequiredMixin, View):
    def get(self, request):
        form = DateRangeForm()
        context = {'form': form}
        return render(request, 'reporte/filtrar_tests_por_fecha.html', context)

    def post(self, request):
        form = DateRangeForm(request.POST)
        if form.is_valid():
            start_date = form.cleaned_data['start_date']
            end_date = form.cleaned_data['end_date']
            tests = Test.objects.filter(fecha__range=[start_date, end_date])
            context = {'form': form, 'tests': tests}
            return render(request, 'reporte/filtrar_tests_por_fecha.html', context)
        else:
            context = {'form': form}
            return render(request, 'reporte/filtrar_tests_por_fecha.html', context)




class TestListarPDFView(LoginRequiredMixin, ListView):
    model = Test
    template_name = "reporte/index.html"  # Asegúrate de ajustar este nombre según tu aplicación
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
        resultados = test.resultado.all()
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

    def get(self, request, *args, **kwargs):
        tests = self.get_queryset()
        context = {'tests': tests}
        html_string = render_to_string('reporte/listado_tests.html', context)

        # Configuración de HTML y CSS para WeasyPrint
        html = HTML(string=html_string)
        css = CSS(string='@page { size: A4 landscape; margin: 1cm; }')  # Configurar orientación horizontal
        
        # Generar el PDF
        pdf_file = html.write_pdf(stylesheets=[css])

        # Devolver el PDF como respuesta HTTP
        response = HttpResponse(pdf_file, content_type='application/pdf')
        response['Content-Disposition'] = 'inline; filename="listado_tests.pdf"'
        return response
    


class TiposDepresionDiagnosticadosPDFView(LoginRequiredMixin, View):

    def get(self, request, *args, **kwargs):
        tests = Test.objects.all().prefetch_related('resultado')
        tipos_depresion = {}

        # Lógica para determinar y contar tipos de depresión
        for test in tests:
            resultados = Resultado.objects.filter(test=test)
            if resultados:
                answers_true = [resultado.pregunta.id for resultado in resultados if resultado.respuesta]
                tipo_id = determine_depression_type(answers_true)
                tipo = Escala.objects.get(id=tipo_id) if tipo_id else 'No se determina tipo de depresión'
                
                if tipo:
                    tipos_depresion[tipo] = tipos_depresion.get(tipo, 0) + 1

        context = {'tipos_depresion': tipos_depresion}
        html_string = render_to_string('reporte/tipos_depresion_pdf.html', context)

        # Configurar HTML y CSS para WeasyPrint
        html = HTML(string=html_string)
        css = CSS(string='@page { size: A4 landscape; margin: 1cm; }')  # Configurar orientación horizontal
        
        # Generar el PDF
        pdf_file = html.write_pdf(stylesheets=[css])

        # Devolver el PDF como respuesta HTTP
        response = HttpResponse(pdf_file, content_type='application/pdf')
        response['Content-Disposition'] = 'inline; filename="tipos_depresion_diagnosticados.pdf"'
        return response




# Vista de reporte para mostrar porcentaje de pacientes con depresión usando la clase View
class PorcentajePacientesConDepresionView(LoginRequiredMixin, View):
    def get(self, request, *args, **kwargs):
        tests = Test.objects.all().prefetch_related('resultado')
        tipos_depresion = defaultdict(int)
        total_tests = 0
        total_depresion = 0

        # Lógica para determinar y contar tipos de depresión
        for test in tests:
            resultados = Resultado.objects.filter(test=test)
            if resultados:
                total_tests += 1
                answers_true = [resultado.pregunta.id for resultado in resultados if resultado.respuesta]
                tipo_id = determine_depression_type(answers_true)
                tipo = Escala.objects.get(id=tipo_id) if tipo_id else 'No se determina tipo de depresión'
                
                if tipo and tipo != 'No se determina tipo de depresión':
                    tipos_depresion[tipo] += 1
                    total_depresion += 1

        # Calcular porcentajes
        porcentaje_tipos_depresion = {tipo: (cantidad / total_depresion) * 100 for tipo, cantidad in tipos_depresion.items()}
        porcentaje_depresion = (total_depresion / total_tests) * 100
        porcentaje_no_depresion = 100 - porcentaje_depresion

        context = {
            'tipos_depresion': tipos_depresion,
            'porcentaje_tipos_depresion': porcentaje_tipos_depresion,
            'porcentaje_depresion': porcentaje_depresion,
            'porcentaje_no_depresion': porcentaje_no_depresion
        }
        html_string = render_to_string('reporte/porcentaje_pacientes_con_depresion.html', context)

        # Configurar HTML y CSS para WeasyPrint
        html = HTML(string=html_string)
        css = CSS(string='@page { size: A4 landscape; margin: 1cm; }')  # Configurar orientación horizontal
        
        # Generar el PDF
        pdf_file = html.write_pdf(stylesheets=[css])

        # Devolver el PDF como respuesta HTTP
        response = HttpResponse(pdf_file, content_type='application/pdf')
        response['Content-Disposition'] = 'inline; filename="tipos_depresion_diagnosticados.pdf"'
        return response

    

    


def ver_opcion_mantenimiento(request):
    return render(request, "mantenimiento/backup_restore.html")

def backup(request):
    management.call_command('dumpdata', 'persona', output='persona/fixtures/db.json', format='json')
    management.call_command('dumpdata', 'estructura', output='estructura/fixtures/db.json', format='json')
    return render(request, "mantenimiento/backup.html")

def restore(request):
    management.call_command('loaddata', 'db.json', format='json', app_label='persona')
    management.call_command('loaddata', 'db.json', format='json', app_label='estructura')
    return render(request, "mantenimiento/restore.html")

