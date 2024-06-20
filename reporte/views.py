from django.shortcuts import render



from django.core import management
from django.views.generic import View
from django.contrib.auth.mixins import LoginRequiredMixin
from django.http import HttpResponse
from django.template.loader import render_to_string
from django.urls import reverse
#from weasyprint import HTML
from estructura.models import Test, Resultado, Escala
from estructura.diagnostico import determine_depression_type

""" class TestPDFView(LoginRequiredMixin, View):
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

        html_string = render_to_string('resultado/test_completado_pdf.html', context)
        html = HTML(string=html_string)
        pdf_file = html.write_pdf()

        response = HttpResponse(pdf_file, content_type='application/pdf')
        response['Content-Disposition'] = f'attachment; filename="test_{test_id}_resultados.pdf"'

        return response """

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

