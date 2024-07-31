from django import forms
from .models import Test, Regla, Cuestionario, Pregunta, Paciente, Doctor, Escala



class TestForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        user = kwargs.pop('user', None)
        super().__init__(*args, **kwargs)

        self._set_paciente_fields(user)
        self._set_doctor_fields(user)
        self._set_cuestionario_fields(user)

    def _set_paciente_fields(self, user):
        self.fields['paciente'].empty_label = "Seleccione un paciente"
        self.fields['paciente'].queryset = Paciente.objects.filter(estado=True)

    def _set_doctor_fields(self, user):
        self.fields['doctor'].empty_label = "Seleccione un psicólogo"
        doctors = self._get_doctors(user)
        self.fields['doctor'].queryset = doctors.select_related('user')
        self.fields['doctor'].initial = doctors.first()
        self._set_doctor_readonly_attributes(user)

    def _set_cuestionario_fields(self, user):
        self.fields['cuestionario'].empty_label = "Seleccione un cuestionario"
        self.fields['cuestionario'].queryset = self._get_cuestionarios(user)

    def _get_doctors(self, user):
        if user:
            return Doctor.objects.filter(estado=True, user=user)
        return Doctor.objects.filter(estado=True)

    def _get_cuestionarios(self, user):
        return Cuestionario.objects.select_related('trastorno').filter(trastorno__is_active=True)

    def _set_doctor_readonly_attributes(self, user):
        if user:
            self.fields['doctor'].widget.attrs['disabled'] = 'disabled'
            self.fields['doctor'].widget.attrs['readonly'] = 'readonly'
            self.fields['doctor'].widget.attrs['class'] = 'doctor-field-disabled'

    class Meta:
        model = Test
        fields = [
            'doctor',
            'paciente',
            'cuestionario',
        ]
        widgets = {
            'doctor': forms.Select(attrs={'class': 'form-control selectpicker', 'data-live-search': 'true'}),
            'paciente': forms.Select(attrs={'class': 'form-control selectpicker', 'data-live-search': 'true'}),
            'cuestionario': forms.Select(attrs={'class': 'form-control selectpicker', 'data-live-search': 'true'}),
        }



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
        self.fields['cuestionario'].queryset = Cuestionario.objects.select_related('trastorno').filter(trastorno__is_active=True)
        self.fields['escala'].empty_label = "Seleccione el Diagnóstico"
        self.fields['escala'].queryset = Escala.objects.filter(is_active=True)
        
        
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