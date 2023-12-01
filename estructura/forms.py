from django import forms
from .models import Test



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
        self.fields['doctor'].empty_label = "Seleccione un Doctor"
        self.fields['cuestionario'].empty_label = "Seleccione un Cuestionario"