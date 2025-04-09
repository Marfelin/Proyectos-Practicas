function showContainer(containerId) {
    const containers = document.querySelectorAll('.container-content');
    containers.forEach(container => {
        container.style.display = 'none';
    });
    document.getElementById(containerId).style.display = 'block';
}

// Función para generar reporte de Activos Fijos
function generarReporteActivosFijos() {
    const idUsuario = document.getElementById('userId').value; // Obtén el ID del usuario desde el elemento oculto
    const opcionSeleccionada = document.getElementById('listaOpcionesCentroCostoActivosFijos');
    const valor = encodeURIComponent(opcionSeleccionada.value);
    const url = `http://localhost:8211/GenerarReporteActivosFijos?idUsario=${encodeURIComponent(idUsuario)}&ccostos=${valor}`;
    window.open(url, '_blank');
}

// Función para generar reporte de Activos Fijos Por Clasificación
function generarReporteActivosFijosPorClasificacion() {
    const idUsuario = document.getElementById('userId').value; // Obtén el ID del usuario desde la sesión
    const clasificacion = document.getElementById('listaClasificaciones').value;
    const valorClasificacion = encodeURIComponent(clasificacion);
    const subclasificacion = document.getElementById('listaSubClasificaciones').value;
    const valorSubCla = encodeURIComponent(subclasificacion);
    const url = `http://localhost:8211/GenerarReportedeactivosfijosClasif?clasificacion=${valorClasificacion}&subclasificacion=${valorSubCla}&idUsario=${encodeURIComponent(idUsuario)}`;
    window.open(url, '_blank');
}

function generarReporteActivosFijosPorClasificacionSinFiltro() {
    const idUsuario = document.getElementById('userId').value; // Obtén el ID del usuario desde la sesión
    const url = `http://localhost:8211/GenerarReportedeactivosfijosClasifsf?idUsario=${encodeURIComponent(idUsuario)}`;
    window.open(url, '_blank');
}

// Función para generar reporte de Útiles y Herramientas
function generarReporteUtilesHerramientas() {
    const idUsuario = document.getElementById('userId').value; // Obtén el ID del usuario desde la sesión
    const centroCostoCodigo = document.getElementById('listaOpcionesCentroCostoUtilesHerramientas').value;
    const valorCentroCosto = encodeURIComponent(centroCostoCodigo);
    const url = `http://localhost:8211/GenerarReporteUyH?usuarioid=${encodeURIComponent(idUsuario)}&centrocostoscodigo=${valorCentroCosto}`;
    window.open(url, '_blank');
}
function bajasTecnicasEconomia() {
    // Obtener lista de activos vinculados al usuario
    fetch('/api/activosPorUsuario')
            .then(response => response.json())
            .then(activos => {
                let activosList = document.createElement('ul');
                activos.forEach(activo => {
                    let listItem = document.createElement('li');
                    listItem.textContent = `${activo.descripcion} (${activo.codigo})`;
                    listItem.onclick = () => {
                        // Obtener lista de usuarios de mantenimiento vinculados al área del activo
                        fetch(`/api/mantenimientoPorArea/${activo.area_id}`)
                                .then(response => response.json())
                                .then(mantenimiento => {
                                    let mantenimientoList = document.createElement('ul');
                                    mantenimiento.forEach(mant => {
                                        let mantItem = document.createElement('li');
                                        mantItem.textContent = mant.nombre;
                                        mantItem.onclick = () => {
                                            let mensaje = `Estimado usuario,

Se ha detectado una avería en el activo ${activo.descripcion} (${activo.codigo}). A continuación, se detallan los datos relevantes:

- Área: ${activo.area}
- Correo del usuario de mantenimiento asignado: ${mant.correo}

Atentamente,
Departamento de Soporte Técnico`;
                                            alert(mensaje);
                                        };
                                        mantenimientoList.appendChild(mantItem);
                                    });
                                    document.body.appendChild(mantenimientoList);
                                });
                    };
                    activosList.appendChild(listItem);
                });
                document.body.appendChild(activosList);
            });
}