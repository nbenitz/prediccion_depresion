# formulario para filtrar por rango de fechas en django
from django import forms
from django.utils.translation import gettext_lazy 

class DateRangeForm(forms.Form):
    start_date = forms.DateField(
        label='Start Date',
        input_formats=['%Y-%m-%d'],
        widget=forms.DateInput(
            attrs={
                'class': 'form-control datepicker',
                'placeholder': 'YYYY-MM-DD'
            }
        )
    )
    end_date = forms.DateField(
        label='End Date',
        input_formats=['%Y-%m-%d'],
        widget=forms.DateInput(
            attrs={
                'class': 'form-control datepicker',
                'placeholder': 'YYYY-MM-DD'
            }
        )
    )

    def clean(self):
        cleaned_data = super().clean()
        start_date = cleaned_data.get('start_date')
        end_date = cleaned_data.get('end_date')

        if start_date and end_date and start_date > end_date:
            raise forms.ValidationError(gettext_lazy('Start date must be before end date.'))

        return cleaned_data