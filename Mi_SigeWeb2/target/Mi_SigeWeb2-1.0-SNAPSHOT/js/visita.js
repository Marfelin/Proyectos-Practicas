function ejecutarFuncion() {
    const seleccion = document.getElementById('opciones').value;
    if (seleccion === 'centroCosto') {
        generarReporteCentro();
    } else if (seleccion === 'activosFijos') {
        generarReporteActivosFijos();
    } else if (seleccion === 'activosFijosClasificacion') {
        generarReporteActivosFijosClasificacion();
    } else if (seleccion === 'utilesHerramientas') {
        generarReporteUtilesHerramientas();
    } else if (seleccion === 'existenciaProductos') {
        generarReporteExistenciaProductos();
    } else if (seleccion === 'listadoTrabajadores') {
        generarReporteListadoTrabajadores();
    }
}

function generarReporteCentro() {
    const url = `http://localhost:8211/GenerarReporteCcostosv`;
    window.open(url, '_blank');
}

function generarReporteActivosFijos() {
    const url = `http://localhost:8211/GenerarReporteActivosFijosv`;
    window.open(url, '_blank');
}



function generarReporteUtilesHerramientas() {
    const url = `http://localhost:8211/GenerarReporteUyHv`;
    window.open(url, '_blank');
}

function generarReporteExistenciaProductos() {
    const url = `http://localhost:8211/GenerarReporteProductosv`;
    window.open(url, '_blank');
}


