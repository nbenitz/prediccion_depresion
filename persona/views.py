
from django.views.generic import ListView, DetailView
from django.views.generic.edit import CreateView, UpdateView, DeleteView
from django.contrib.auth.mixins import LoginRequiredMixin
from django.shortcuts import redirect, render
from django.contrib import messages
from django.contrib.auth import get_user_model, authenticate, login
from persona.forms import UserForm, DoctorForm, SignUpForm
from django.contrib.auth.forms import UserCreationForm
from django.template.loader import render_to_string
from django.contrib.sites.shortcuts import get_current_site
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.utils.encoding import force_bytes, force_str
from persona.tokens import account_activation_token
from django.conf import settings
from django.contrib.auth.decorators import login_required
from django.contrib.messages.views import SuccessMessageMixin
from .models import Paciente, Doctor
from django.urls import reverse


class ObjetoListado(LoginRequiredMixin, ListView):
    """Lista los objetos model pasado desde urls.py"""


class ObjetoDetalle(LoginRequiredMixin, DetailView):
    """Muestra los detalles del objeto model pasado desde urls.py"""


# =================================== PACIENTE ===========================================

class PacienteCrear(LoginRequiredMixin, SuccessMessageMixin, CreateView):
    model = Paciente
    form = Paciente
    fields = "__all__"
    success_message = 'Paciente Creado Correctamente !'

    def get_success_url(self):
        return reverse('leerPaciente')


class PacienteActualizar(LoginRequiredMixin, SuccessMessageMixin, UpdateView):
    model = Paciente
    form = Paciente
    fields = "__all__"
    success_message = 'Paciente Actualizado Correctamente !'

    def get_success_url(self):
        return reverse('leerPaciente')


def inactivar_paciente(request, pk):
    paciente = Paciente.objects.get(id=pk)
    paciente.estado = False
    paciente.save()
    messages.success(request, ('Paciente activado correctamente'))
    return redirect('leerPaciente')


def activar_paciente(request, pk):
    paciente = Paciente.objects.get(id=pk)
    paciente.estado = True
    paciente.save()
    messages.success(request, ('Paciente activado correctamente'))
    return redirect('leerPaciente')


# =================================== DOCTOR ===========================================

def create_doctor(request):

    if request.method == 'POST':
        user_form = SignUpForm(request.POST, prefix='UF')
        doctor_form = DoctorForm(request.POST, prefix='PF')

        if user_form.is_valid() and doctor_form.is_valid():
            user_instance = user_form.save()
            doctor_instance = doctor_form.save(commit=False)
            doctor_instance.user = user_instance
            doctor_instance.save()

            messages.success(request, ('Psicólogo creado correctamente'))
            return redirect('leerDoctor')

    else:
        user_form = SignUpForm(prefix='UF')
        doctor_form = DoctorForm(prefix='PF')

    return render(request, 'doctor/crear.html', {
        'user_form': user_form,
        'doctor_form': doctor_form,
        'titulo': 'Crear Psicólogo',
    })


@login_required
def edit_doctor(request, pk):

    user = get_user_model().objects.get(id=pk)

    if request.method == 'POST':
        user_form = UserForm(request.POST, prefix='UF', instance=user)
        doctor_form = DoctorForm(
            request.POST, prefix='PF', instance=user.doctor)

        if user_form.is_valid() and doctor_form.is_valid():
            user_form.save()
            doctor_form.save()
            messages.success(request, ('Psicólogo actualizado correctamente'))
            return redirect('leerDoctor')

    else:
        user_form = UserForm(prefix='UF', instance=user)
        doctor_form = DoctorForm(prefix='PF', instance=user.doctor)

    return render(request, 'doctor/crear.html', {
        'user_form': user_form,
        'doctor_form': doctor_form,
        'titulo': 'Editar Psicólogo',
    })


def inactivar_doctor(request, pk):
    doctor = Doctor.objects.get(id=pk)
    doctor.estado = False
    doctor.save()
    messages.success(request, ('Psicólogo inactivado correctamente'))
    return redirect('leerDoctor')


def activar_doctor(request, pk):
    doctor = Doctor.objects.get(id=pk)
    doctor.estado = True
    doctor.save()
    messages.success(request, ('Psicólogo activado correctamente'))
    return redirect('leerDoctor')


# =================================== USUARIO ===========================================
def activate(request, uidb64, token):
    try:
        uid = force_str(urlsafe_base64_decode(uidb64))
        user = get_user_model().objects.get(pk=uid)
    except (TypeError, ValueError, OverflowError, get_user_model().DoesNotExist):
        user = None

    # checking if the user exists, if the token is valid.
    if user is not None and account_activation_token.check_token(user, token):
        # if valid set active true
        user.is_active = True
        # set signup_confirmation true
        user.signup_confirmation = True
        user.save()
        login(request, user)
        return redirect('activation_complete')
    else:
        return render(request, 'registration/activation_invalid.html')


def activation_sent_view(request):
    return render(request, 'registration/registration_complete.html')


def activation_complete_view(request):
    return render(request, 'registration/activation_complete.html')
