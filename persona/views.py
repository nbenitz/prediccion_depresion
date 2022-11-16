
from django.views.generic import ListView, DetailView 
from django.views.generic.edit import CreateView, UpdateView, DeleteView
from django.contrib.auth.mixins import LoginRequiredMixin
from django.shortcuts import redirect, render
from django.contrib import messages 
from django.contrib.auth import get_user_model, authenticate, login
from persona.forms import UserForm, PacienteForm, DoctorForm, SignUpForm
from django.contrib.auth.forms import UserCreationForm
from django.template.loader import render_to_string
from django.contrib.sites.shortcuts import get_current_site
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.utils.encoding import force_bytes, force_text
from persona.tokens import account_activation_token
from django.conf import settings
from django.contrib.auth.decorators import login_required




# Create your views here.

class ObjetoListado(LoginRequiredMixin, ListView):         
    def get_queryset(self):
        qs = self.model.objects.filter(is_paciente=self.kwargs['is_paciente'])
        return qs
    

class ObjetoDetalle(LoginRequiredMixin, DetailView): 
    """model = get_user_model()"""


#=================================== CLIENTE ===========================================   
    
def create_paciente(request):
    
    if request.method == 'POST':
        user_form = UserForm(request.POST, prefix='UF')
        paciente_form = PacienteForm(request.POST, prefix='PF')
            
        if user_form.is_valid() and paciente_form.is_valid():         
            user = user_form.save(commit=False)
            user_form.instance.is_paciente = True
            user.save()
    
            user.paciente.ci = paciente_form.cleaned_data.get('ci')
            user.paciente.save()
            messages.success(request, ('Paciente creado correctmente'))
            return redirect('leerPaciente')
            
    else:
        user_form = UserForm(prefix='UF')
        paciente_form = PacienteForm(prefix='PF')
        
    return render(request, 'Paciente/crear.html',{
        'user_form': user_form,
        'paciente_form': paciente_form,
        })


@login_required
def edit_paciente(request, pk):
    
    user = get_user_model().objects.get(id=pk)
    
    if request.method == 'POST':
        user_form = UserForm(request.POST, prefix='UF', instance=user)
        paciente_form = PacienteForm(request.POST, prefix='PF', instance=user.paciente)
            
        if user_form.is_valid() and paciente_form.is_valid():
            user = user_form.save(commit=False)
            user_form.instance.is_paciente = True
            user.save()
    
            user.paciente.ci = paciente_form.cleaned_data.get('ci')
            user.paciente.save()
            messages.success(request, ('Paciente actualizado correctmente'))
            return redirect('leerPaciente')
            
    else:
        user_form = UserForm(prefix='UF', instance=user)
        paciente_form = PacienteForm(prefix='PF', instance=user.paciente)
        
    return render(request, 'paciente/actualizar.html',{
        'user_form': user_form,
        'paciente_form': paciente_form,
        })
    
    
    
#=================================== EMPLEADO ===========================================  
    
def create_doctor(request):
    
    if request.method == 'POST':
        user_form = UserForm(request.POST, prefix='UF')
        doctor_form = DoctorForm(request.POST, prefix='PF')
            
        if user_form.is_valid() and doctor_form.is_valid():
            user = user_form.save(commit=False)
            user.save()
    
            user.doctor.ci = doctor_form.cleaned_data.get('ci')
            user.doctor.save()
            messages.success(request, ('Doctor creado correctmente'))
            return redirect('leerDoctor')
            
    else:
        user_form = UserForm(prefix='UF')
        doctor_form = PacienteForm(prefix='PF')
        
    return render(request, 'doctor/crear.html',{
        'user_form': user_form,
        'doctor_form': doctor_form,
        })


@login_required
def edit_doctor(request, pk):
    
    user = get_user_model().objects.get(id=pk)
    
    if request.method == 'POST':
        user_form = UserForm(request.POST, prefix='UF', instance=user)
        doctor_form = DoctorForm(request.POST, prefix='PF', instance=user.doctor)
            
        if user_form.is_valid() and doctor_form.is_valid():
            user = user_form.save(commit=False)
            user.save()
    
            user.doctor.ci = doctor_form.cleaned_data.get('ci')
            user.doctor.save()
            messages.success(request, ('Doctor actualizado correctmente'))
            return redirect('leerDoctor')
            
    else:
        user_form = UserForm(prefix='UF', instance=user)
        doctor_form = DoctorForm(prefix='PF', instance=user.doctor)
        
    return render(request, 'doctor/crear.html',{
        'user_form': user_form,
        'doctor_form': doctor_form,
        })

        
#=================================== USUARIO ===========================================
class UsuarioListado(LoginRequiredMixin, ListView): 
    model = get_user_model() 
    
class UsuarioDetalle(LoginRequiredMixin, DetailView): 
    model = get_user_model()


def create_paciente2(request):
    
    if request.method == 'POST':
        user_form = SignUpForm(request.POST, prefix='UF')
        paciente_form = PacienteForm(request.POST, prefix='PF')
            
        if user_form.is_valid() and paciente_form.is_valid():         
            user = user_form.save(commit=False)
            user_form.instance.is_paciente = True
            user_form.instance.is_active = False
            user.save()
    
            user.paciente.ci = paciente_form.cleaned_data.get('ci')
            user.paciente.save()
            #messages.success(request, ('Paciente creado correctmente'))
            #return redirect('leerPaciente')
            
            
            current_site = get_current_site(request)
            subject = 'Por favor activa tu cuenta'
            email_from = settings.EMAIL_HOST_USER
            message = render_to_string('registration/activation_request.html', {
                'user': user,
                'domain': current_site.domain,
                'uid': urlsafe_base64_encode(force_bytes(user.pk)),
                'token': account_activation_token.make_token(user),
            })
            user.email_user(subject, message, email_from)
        
            return redirect('activation_send')
            
            
    else:
        user_form = SignUpForm(prefix='UF')
        paciente_form = PacienteForm(prefix='PF')
        
    return render(request, 'paciente/crear.html',{
        'user_form': user_form,
        'paciente_form': paciente_form,
        })
    
    
def activate(request, uidb64, token):
    try:
        uid = force_text(urlsafe_base64_decode(uidb64))
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


