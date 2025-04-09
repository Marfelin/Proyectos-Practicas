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

function generarReporteActivosFijos() {
    const idUsuario = document.getElementById('userId').value;
    const ccostos = document.getElementById('listaOpcionesCentroCostoActivosFijos').value;
    const url = `http://localhost:8211/GenerarReporteActivosFijos?idUsario=${encodeURIComponent(idUsuario)}&ccostos=${encodeURIComponent(ccostos)}`;
    window.open(url, '_blank');
}

function generarReporteActivosFijosPorClasificacion() {
    const idUsuario = document.getElementById('userId').value;
    const clasificacion = document.getElementById('listaClasificaciones').value;
    const subclasificacion = document.getElementById('listaSubClasificaciones').value;
    const url = `http://localhost:8211/GenerarReportedeactivosfijosClasif?clasificacion=${encodeURIComponent(clasificacion)}&subclasificacion=${encodeURIComponent(subclasificacion)}&idUsario=${encodeURIComponent(idUsuario)}`;
    window.open(url, '_blank');
}

function generarReporteActivosFijosPorClasificacionSinFiltro() {
    const idUsuario = document.getElementById('userId').value;
    const url = `http://localhost:8211/GenerarReportedeactivosfijosClasifsf?idUsario=${encodeURIComponent(idUsuario)}`;
    window.open(url, '_blank');
}

function generarReporteProductos() {
    const idUsuario = document.getElementById('userId').value;
    const categoria = document.getElementById('listaCategorias').value;
    const subcategoria = document.getElementById('listaSubCategorias').value;
    const id = document.getElementById('listaAlmacenes').value;
    const url = `http://localhost:8211/GenerarReporteProductos?usuarioid=${encodeURIComponent(idUsuario)}&categoria=${encodeURIComponent(categoria)}&subcategoria=${encodeURIComponent(subcategoria)}&id=${encodeURIComponent(id)}`;
    window.open(url, '_blank');
}

function generarReporteProductosSinCategoria() {
    const idUsuario = document.getElementById('userId').value;
    const subcategoria = document.getElementById('listaSubCategorias').value;
    const id = document.getElementById('listaAlmacenes').value;
    const url = `http://localhost:8211/GenerarReporteProductossfc?usuarioid=${encodeURIComponent(idUsuario)}&subcategoria=${encodeURIComponent(subcategoria)}&id=${encodeURIComponent(id)}`;
    window.open(url, '_blank');
}

function generarReporteProductosSinSubcategoria() {
    const idUsuario = document.getElementById('userId').value;
    const categoria = document.getElementById('listaCategorias').value;
    const id = document.getElementById('listaAlmacenes').value;
    const url = `http://localhost:8211/GenerarReporteProductossfSc?usuarioid=${encodeURIComponent(idUsuario)}&categoria=${encodeURIComponent(categoria)}&id=${encodeURIComponent(id)}`;
    window.open(url, '_blank');
}

function generarReporteProductosCompleto() {
    const idUsuario = document.getElementById('userId').value;
    const categoria = document.getElementById('listaCategorias').value;
    const subcategoria = document.getElementById('listaSubCategorias').value;
    const url = `http://localhost:8211/GenerarReporteProductossfa?usuarioid=${encodeURIComponent(idUsuario)}&categoria=${encodeURIComponent(categoria)}&subcategoria=${encodeURIComponent(subcategoria)}`;
    window.open(url, '_blank');
}

//--------------------Productos--------------------------------------------
function bajasTecnicasArea() {
    // Obtener lista de activos vinculados a las áreas del usuario
    fetch('/api/activosPorArea')
        .then(response => response.json())
        .then(activos => {
            let activosList = document.createElement('ul');
            activos.forEach(activo => {
                let listItem = document.createElement('li');
                listItem.textContent = `${activo.descripcion} (${activo.codigo})`;
                listItem.onclick = () => {
                    let mensaje = `Estimado usuario,

Le informamos que el activo ${activo.descripcion} (${activo.codigo}) se encuentra actualmente dañado. A continuación, se detallan los datos relevantes:

- Empleado responsable: ${activo.nombre_empleado}
- Centro: ${activo.centro}
- Área: ${activo.area}

Atentamente,
Departamento de Soporte Técnico`;
                    alert(mensaje);

                    // Obtener lista de economistas
                    fetch('/api/economistas')
                        .then(response => response.json())
                        .then(economistas => {
                            let economistasList = document.createElement('ul');
                            economistas.forEach(economista => {
                                let econItem = document.createElement('li');
                                econItem.textContent = economista.nombre;
                                econItem.onclick = () => {
                                    let reporte = `Reporte de avería del activo ${activo.descripcion} (${activo.codigo}):
                                    Empleado responsable: ${activo.nombre_empleado}.
                                    Centro: ${activo.centro}.
                                    Área: ${activo.area}.`;
                                    let mensajeEconomista = `Estimado usuario,

Se ha generado el siguiente reporte de avería:

${reporte}

Correo del economista asignado: ${economista.correo}

Atentamente,
Departamento de Soporte Técnico`;
                                    alert(mensajeEconomista);
                                };
                                economistasList.appendChild(econItem);
                            });
                            document.body.appendChild(economistasList);
                        });
                };
                activosList.appendChild(listItem);
            });
            document.body.appendChild(activosList);
        });
}