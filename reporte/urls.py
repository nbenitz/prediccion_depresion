from django.urls import path

from .views import (
    ver_opcion_mantenimiento,
    backup,
    restore,
    TestListar,
    TestPDFView,
    TestListarPDFView,
    TiposDepresionDiagnosticadosPDFView,
    FiltrarTestsPorFechaView,
    PorcentajePacientesConDepresionView,
)

urlpatterns = [
    path("reporte/", TestListar.as_view(), name="listaTest"),
    path("reporte/test/<int:test_id>/pdf/", TestPDFView.as_view(), name="test_pdf"),
    path('filtrar-tests/', FiltrarTestsPorFechaView.as_view(), name='listado_tests'),
    path('reporte/listado_tests/pdf/', TestListarPDFView.as_view(), name='listado_tests_pdf'),
    path('reporte/porcentaje_depresion/pdf/', PorcentajePacientesConDepresionView.as_view(), name='porcentaje_depresion_pdf'),
    path('reporte/tipos_depresion/pdf/', TiposDepresionDiagnosticadosPDFView.as_view(), name='tipos_depresion_pdf'),
    path("reporte/mantenimiento/", ver_opcion_mantenimiento, name="mantenimiento"),
    path("reporte/mantenimiento/backup", backup, name="backup"),
    path("reporte/mantenimiento/restore", restore, name="restore"),
]
