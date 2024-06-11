from django import forms
from .models import Test, Regla, Cuestionario, Pregunta



class TestForm(forms.ModelForm):
    class Meta:
        model = Test
        fields = [
            'paciente',
            'doctor',
            'cuestionario',
        ]
        widgets = {
            'paciente': forms.Select(attrs={'class': 'form-control selectpicker', 'data-live-search': 'true'}),
            'doctor': forms.Select(attrs={'class': 'form-control selectpicker', 'data-live-search': 'true'}),
            'cuestionario': forms.Select(attrs={'class': 'form-control selectpicker', 'data-live-search': 'true'}),
        }

    def __init__(self, *args, **kwargs):
        super(TestForm, self).__init__(*args, **kwargs)

        self.fields['paciente'].empty_label = "Seleccione un Paciente"
        self.fields['doctor'].empty_label = "Seleccione un Psicólogo"
        self.fields['cuestionario'].empty_label = "Seleccione un Cuestionario"



class ReglaForm(forms.ModelForm):
    class Meta:
        model = Regla
        fields = "__all__"
        widgets = {
            'cuestionario': forms.Select(attrs={'class': 'form-control selectpicker', 'data-live-search': 'true'}),
            'escala': forms.Select(attrs={'class': 'form-control selectpicker', 'data-live-search': 'true'}),
            'respuestas_necesarias': forms.SelectMultiple(attrs={'class': 'form-control'}),
        }

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['cuestionario'].empty_label = "Seleccione el Cuestionario"
        self.fields['escala'].empty_label = "Seleccione el Diagnóstico"
        
        
        # Filtrar las respuestas necesarias basadas en el cuestionario seleccionado
        if 'cuestionario' in self.data:
            try:
                cuestionario_id = int(self.data.get('cuestionario'))
                self.fields['respuestas_necesarias'].queryset = Pregunta.objects.filter(cuestionario__id=cuestionario_id)
            except (ValueError, TypeError):
                pass  # Invalid input from the client; ignore and fallback to empty queryset
        elif self.instance.pk:
            self.fields['respuestas_necesarias'].queryset = self.instance.cuestionario.preguntas.all()
        else:
            self.fields['respuestas_necesarias'].queryset = Pregunta.objects.none()