document.addEventListener('DOMContentLoaded', function () {
    showContainer('miSigeWeb');
});

function showContainer(containerId) {
    var containers = document.getElementsByClassName('content-container');
    for (var i = 0; i < containers.length; i++) {
        containers[i].style.display = 'none';
    }
    document.getElementById(containerId).style.display = 'block';
}

function mostrarLista(opcion) {
    const listaOpciones = document.getElementById('listaOpcionesCentroCosto');
    listaOpciones.innerHTML = '';
    if (opcion === 'centroCosto') {
        listaOpciones.innerHTML = `
            <option value="cc1">Centro de Costo 1</option>
            <option value="cc2">Centro de Costo 2</option>
            <option value="cc3">Centro de Costo 3</option>
        `;
    } else if (opcion === 'areasResponsabilidad') {
        listaOpciones.innerHTML = `
            <option value="ar1">Área de Responsabilidad 1</option>
            <option value="ar2">Área de Responsabilidad 2</option>
            <option value="ar3">Área de Responsabilidad 3</option>
        `;
    }
}

function generarReporteActivosFijos() {
    const idUsuario = document.getElementById('userId').value;
    const ccostos = document.getElementById('listaOpcionesCentroCostoActivosFijos').value;
    const url = `http://localhost:8211/GenerarReporteActivosFijos?idUsario=${encodeURIComponent(idUsuario)}&ccostos=${encodeURIComponent(ccostos)}`;
    window.open(url, '_blank');
}

function generarReporteActivosFijosPorClasificacionSinFiltro() {
    const idUsuario = document.getElementById('userId').value;
    const url = `http://localhost:8211/GenerarReportedeactivosfijosClasifsf?idUsario=${encodeURIComponent(idUsuario)}`;
    window.open(url, '_blank');
}

function generarReporteActivosFijosPorClasificacion() {
    const idUsuario = document.getElementById('userId').value;
    const clasificacion = document.getElementById('listaClasificaciones').value;
    const subclasificacion = document.getElementById('listaSubClasificaciones').value;
    const url = `http://localhost:8211/GenerarReportedeactivosfijosClasif?clasificacion=${encodeURIComponent(clasificacion)}&subclasificacion=${encodeURIComponent(subclasificacion)}&idUsario=${encodeURIComponent(idUsuario)}`;
    window.open(url, '_blank');
}

function generarReporteUtilesHerramientas() {
    const usuarioid = document.getElementById('userId').value;
    const centrocostoscodigo = document.getElementById('listaOpcionesCentroCostoUtilesHerramientas').value;
    const url = `http://localhost:8211/GenerarReporteUyH?usuarioid=${encodeURIComponent(usuarioid)}&centrocostoscodigo=${encodeURIComponent(centrocostoscodigo)}`;
    window.open(url, '_blank');
}

function generarReporteProductos() {
    const usuarioid = document.getElementById('userId').value;
    const categoria = document.getElementById('listaCategorias').value;
    const subcategoria = document.getElementById('listaSubCategorias').value;
    const id = document.getElementById('listaAlmacenes').value;
    const url = `http://localhost:8211/GenerarReporteProductos?usuarioid=${encodeURIComponent(usuarioid)}&categoria=${encodeURIComponent(categoria)}&subcategoria=${encodeURIComponent(subcategoria)}&id=${encodeURIComponent(id)}`;
    window.open(url, '_blank');
}

function generarReporteProductosSinCategoria() {
    const usuarioid = document.getElementById('userId').value;
    const subcategoria = document.getElementById('listaSubCategorias').value;
    const id = document.getElementById('listaAlmacenes').value;
    const url = `http://localhost:8211/GenerarReporteProductossfc?usuarioid=${encodeURIComponent(usuarioid)}&subcategoria=${encodeURIComponent(subcategoria)}&id=${encodeURIComponent(id)}`;
    window.open(url, '_blank');
}

function generarReporteProductosSinSubcategoria() {
    const usuarioid = document.getElementById('userId').value;
    const categoria = document.getElementById('listaCategorias').value;
    const id = document.getElementById('listaAlmacenes').value;
    const url = `http://localhost:8211/GenerarReporteProductossfSc?usuarioid=${encodeURIComponent(usuarioid)}&categoria=${encodeURIComponent(categoria)}&id=${encodeURIComponent(id)}`;
    window.open(url, '_blank');
}

function generarReporteProductosCompleto() {
    const usuarioid = document.getElementById('userId').value;
    const categoria = document.getElementById('listaCategorias').value;
    const subcategoria = document.getElementById('listaSubCategorias').value;
    const url = `http://localhost:8211/GenerarReporteProductossfa?usuarioid=${encodeURIComponent(usuarioid)}&categoria=${encodeURIComponent(categoria)}&subcategoria=${encodeURIComponent(subcategoria)}`;
    window.open(url, '_blank');
}

//--------------------Productos--------------------------------------------
// Función para generar reporte Lista de Trabajadores
function generarReporteListaTrabajadores() {
    const provincia = document.getElementById('listaProvincias').value;
    const cargo = document.getElementById('listaCargos').value;
    const profesion = document.getElementById('listaProfesiones').value;
    const centroCosto = document.getElementById('listaCentrosCosto').value;
    const url = `http://localhost:8211/GenerarReporteTrabajadores?valorprovincia=${encodeURIComponent(provincia)}&valorcargo=${encodeURIComponent(cargo)}&valorprofesion=${encodeURIComponent(profesion)}&valorcentrocostoscodigo=${encodeURIComponent(centroCosto)}`;
    window.open(url, '_blank');
}

function verTrabajadores() {
    const url = `http://localhost:8211/GenerarReporteTrabajadoressf`;
    window.open(url, '_blank');
}

function verTrabajadoresSinProvincia() {
    const cargo = document.getElementById('listaCargos').value;
    const profesion = document.getElementById('listaProfesiones').value;
    const centroCosto = document.getElementById('listaCentrosCosto').value;
    const url = `http://localhost:8211/GenerarReporteTrabajadoressfprovincia?valorcargo=${encodeURIComponent(cargo)}&valorprofesion=${encodeURIComponent(profesion)}&valorcentrocostoscodigo=${encodeURIComponent(centroCosto)}`;
    window.open(url, '_blank');
}

function verTrabajadoresSinCargo() {
    const provincia = document.getElementById('listaProvincias').value;
    const profesion = document.getElementById('listaProfesiones').value;
    const centroCosto = document.getElementById('listaCentrosCosto').value;
    const url = `http://localhost:8211/GenerarReporteTrabajadoressfc?valorprovincia=${encodeURIComponent(provincia)}&valorprofesion=${encodeURIComponent(profesion)}&valorcentrocostoscodigo=${encodeURIComponent(centroCosto)}`;
    window.open(url, '_blank');
}

function verTrabajadoresSinProfesion() {
    const cargo = document.getElementById('listaCargos').value;
    const centroCosto = document.getElementById('listaCentrosCosto').value;
    const provincia = document.getElementById('listaProvincias').value;
    const url = `http://localhost:8211/GenerarReporteTrabajadoressfp?valorcargo=${encodeURIComponent(cargo)}&valorcentrocostoscodigo=${encodeURIComponent(centroCosto)}&valorprovincia=${encodeURIComponent(provincia)}`;
    window.open(url, '_blank');
}

function verTrabajadoresSinCentroCosto() {
    const cargo = document.getElementById('listaCargos').value;
    const profesion = document.getElementById('listaProfesiones').value;
    const provincia = document.getElementById('listaProvincias').value;
    const url = `http://localhost:8211/GenerarReporteTrabajadoressfp?valorcargo=${encodeURIComponent(cargo)}&valorprofesion=${encodeURIComponent(profesion)}&valorprovincia=${encodeURIComponent(provincia)}`;
    window.open(url, '_blank');
}
function verCentroDeCosto() {
    const selectElement = document.getElementById("listaOpcionesCentroCosto");
    const valor = encodeURIComponent(selectElement.value); // Asegurarse de que el valor esté correctamente codificado para la URL
    const idUsario = document.getElementById('userId').value; // Obtén el ID del usuario desde el elemento oculto
    const url = `http://localhost:8211/GenerarReporteCcostos?cccostos=${valor}&idUsario=${encodeURIComponent(idUsario)}`;
    window.open(url, '_blank'); // Abrir en una nueva pestaña directamente
}

function verTodosLosCentrosDeCosto() {
    const idUsario = document.getElementById('userId').value; // Obtén el ID del usuario desde el elemento oculto
    const url = `http://localhost:8211/GenerarReporteCcostossf?idUsario=${encodeURIComponent(idUsario)}`;
    window.open(url, '_blank'); // Abrir en una nueva pestaña directamente
}

// Cerrar la ventana modal cuando el usuario hace clic fuera de ella
window.onclick = function (event) {
    var modal = document.getElementById("modalCrearUsuario");
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
