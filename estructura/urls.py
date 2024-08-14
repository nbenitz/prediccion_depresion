# estructura/urls.py
from django.urls import path

from estructura import models
from .views import (
    PreguntaCrear,
    PreguntaActualizar,
    PreguntaEliminar,
    ObjetoListado,
    ObjetoDetalle,
    TrastornoCrear,
    TrastornoActualizar,
    TrastornoInactivar,
    TrastornoActivar,
    TipoDepresionCrear,
    TipoDepresionActualizar,
    TipoDepresionInactivar,
    TipoDepresionActivar,
    CuestionarioCrear,
    CuestionarioActualizar,
    CuestionarioEliminar,
    ReglaCrear,
    ReglaActualizar,
    ReglaEliminar,
    TestListar,
    TestCrear,
    TipoDepresionListar,
    TestActualizar,
    TestEliminar,
    TestCompletadoView,
)
from . import views

urlpatterns = [
    # url de trastorno
    path(
        "trastorno/",
        ObjetoListado.as_view(
            model=models.Trastorno,
            template_name="trastorno/index.html",
            extra_context={"titulo": "Tipo de Test", "plural": "Tipos de Test"},
        ),
        name="leerTrastorno",
    ),
    path(
        "trastorno/detalle/<str:pk>",
        ObjetoDetalle.as_view(
            model=models.Trastorno,
            template_name="trastorno/detalles.html",
            extra_context={"titulo": "Detalles del Tipo de Test"},
        ),
        name="detallesTrastorno",
    ),
    path(
        "trastorno/crear",
        TrastornoCrear.as_view(
            template_name="crud/crear_editar.html",
            extra_context={"titulo": "Crear Tipo de Test"},
        ),
        name="CrearTrastorno",
    ),
    path(
        "trastorno/editar/<str:pk>",
        TrastornoActualizar.as_view(
            template_name="crud/crear_editar.html",
            extra_context={"titulo": "Editar Tipo de Test"},
        ),
        name="actualizarTrastorno",
    ),
    path(
        "trastorno/eliminar/<str:pk>",
        TrastornoInactivar.as_view(),
        name="eliminarTrastorno",
    ),
    path(
        "trastorno/activar/<str:pk>",
        TrastornoActivar.as_view(),
        name="activarTrastorno",
    ),
    # url de Tipo de Depresión
    path(
        "escala/",
        TipoDepresionListar.as_view(
            extra_context={
                "titulo": "Tipo de Depresión",
                "plural": "Tipos de Depresión",
            },
        ),
        name="leerTipoDepresion",
    ),
    path(
        "escala/detalle/<str:pk>",
        ObjetoDetalle.as_view(
            model=models.Escala,
            template_name="escala/detalles.html",
            extra_context={"titulo": "Detalles del Tipo de Depresión"},
        ),
        name="detallesTipoDepresion",
    ),
    path(
        "escala/crear",
        TipoDepresionCrear.as_view(
            template_name="crud/crear_editar.html",
            extra_context={"titulo": "Crear Tipo de Depresión"},
        ),
        name="CrearTipoDepresion",
    ),
    path(
        "escala/editar/<str:pk>",
        TipoDepresionActualizar.as_view(
            template_name="crud/crear_editar.html",
            extra_context={"titulo": "Editar Tipo de Depresión"},
        ),
        name="actualizarTipoDepresion",
    ),
    path(
        "escala/eliminar/<str:pk>",
        TipoDepresionInactivar.as_view(),
        name="eliminarTipoDepresion",
    ),
    path(
        "escala/activar/<str:pk>",
        TipoDepresionActivar.as_view(),
        name="activarTipoDepresion",
    ),

    # --------------------- url de categoria pregunta ------------------------------------------
    path(
        "pregunta/",
        ObjetoListado.as_view(
            model=models.Pregunta,
            template_name="pregunta/index.html",
            extra_context={"titulo": "Pregunta", "plural": "Preguntas"},
        ),
        name="leerPregunta",
    ),
    path(
        "pregunta/detalle/<str:pk>",
        ObjetoDetalle.as_view(
            model=models.Pregunta,
            template_name="pregunta/detalles.html",
            extra_context={"titulo": "Pregunta"},
        ),
        name="detallesPregunta",
    ),
    path(
        "pregunta/crear",
        PreguntaCrear.as_view(
            template_name="crud/crear_editar.html",
            extra_context={"titulo": "Crear Pregunta"},
        ),
        name="CrearPregunta",
    ),
    path(
        "pregunta/editar/<str:pk>",
        PreguntaActualizar.as_view(
            template_name="crud/crear_editar.html",
            extra_context={"titulo": "Editar Pregunta"},
        ),
        name="actualizarPregunta",
    ),
    path(
        "pregunta/eliminar/<str:pk>",
        PreguntaEliminar.as_view(),
        name="eliminarPregunta",
    ),

    # ----------------------------------- Cuestionario URLs -----------------------------------------------------
    path(
        "cuestionario/",
        ObjetoListado.as_view(
            model=models.Cuestionario,
            template_name="cuestionario/index.html",
            extra_context={"titulo": "Cuestionario", "plural": "Cuestionarios"},
        ),
        name="leerCuestionario",
    ),
    path(
        "cuestionario/detalle/<str:pk>",
        ObjetoDetalle.as_view(
            model=models.Cuestionario,
            template_name="cuestionario/detalles.html",
            extra_context={"titulo": "Cuestionario"},
        ),
        name="detallesCuestionario",
    ),
    path(
        "cuestionario/crear",
        CuestionarioCrear.as_view(
            template_name="cuestionario/crear_editar.html",
            extra_context={"titulo": "Crear Cuestionario"},
        ),
        name="CrearCuestionario",
    ),
    path(
        "cuestionario/editar/<str:pk>",
        CuestionarioActualizar.as_view(
            template_name="cuestionario/crear_editar.html",
            extra_context={"titulo": "Editar Cuestionario"},
        ),
        name="actualizarCuestionario",
    ),
    path(
        "cuestionario/eliminar/<str:pk>",
        CuestionarioEliminar.as_view(),
        name="eliminarCuestionario",
    ),

    # ----------------------------------- Regla URLs -----------------------------------------------------
    path(
        "regla/",
        ObjetoListado.as_view(
            model=models.Regla,
            template_name="regla/index.html",
            extra_context={"titulo": "Regla", "plural": "Reglas"},
        ),
        name="leerRegla",
    ),
    path(
        "regla/detalle/<str:pk>",
        ObjetoDetalle.as_view(
            model=models.Regla,
            template_name="regla/detalles.html",
            extra_context={"titulo": "Regla"},
        ),
        name="detallesRegla",
    ),
    path("regla/crear", ReglaCrear.as_view(), name="CrearRegla"),
    path("regla/editar/<str:pk>", ReglaActualizar.as_view(), name="actualizarRegla"),
    path("regla/eliminar/<str:pk>", ReglaEliminar.as_view(), name="eliminarRegla"),
    path("regla/ajax/cargar-preguntas/", views.cargar_preguntas, name="cargar_preguntas"),

    # ----------------------------------- Test URLs -----------------------------------------------------
    path("test/", TestListar.as_view(), name="leerTest"),
    path(
        "test/crear",
        TestCrear.as_view(
            template_name="test/crear.html", extra_context={"titulo": "Generar Test"}
        ),
        name="CrearTest",
    ),
    path("test/<int:test_id>/procesar", views.procesar_test, name="procesar_test"),
    path(
        "test/<int:test_id>/generar_link", views.generar_link, name="test_generar_link"
    ),
    path(
        "test/completado/<int:test_id>",
        views.TestCompletadoView.as_view(),
        name="test_completado",
    ),
]
