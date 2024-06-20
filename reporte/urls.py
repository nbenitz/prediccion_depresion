from django.urls import path

from .views import ver_opcion_mantenimiento, backup, restore, TestListar, TestPDFView
urlpatterns = [
    path("reporte/", TestListar.as_view(), name="listaTest"),
    path('reporte/test/<int:test_id>/pdf/', TestPDFView.as_view(), name='test_pdf'),
    path('reporte/mantenimiento/', ver_opcion_mantenimiento, name='mantenimiento'),
    path('reporte/mantenimiento/backup', backup, name='backup'),
    path('reporte/mantenimiento/restore', restore, name='restore'),
]
