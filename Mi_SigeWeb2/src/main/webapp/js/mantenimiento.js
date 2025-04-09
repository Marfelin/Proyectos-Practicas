function showContainer(containerId) {
    // Ocultar todos los contenedores
    const containers = document.querySelectorAll('.content-container');
    containers.forEach(container => {
        container.style.display = 'none';
    });

    // Ocultar el contenido principal
    document.getElementById('mainContent').style.display = 'none';

    // Mostrar el contenedor seleccionado
    const selectedContainer = document.getElementById(containerId);
    if (selectedContainer) {
        selectedContainer.style.display = 'block';
    }
}

function generarReporteUtilesHerramientas() {
    const idUsuario = document.getElementById('userId').value; // Obtén el ID del usuario desde la sesión
    const centroCostoCodigo = document.getElementById('listaOpcionesCentroCostoUtilesHerramientas').value;
    const valorCentroCosto = encodeURIComponent(centroCostoCodigo);
    const url = `http://localhost:8211/GenerarReporteUyH?usuarioid=${encodeURIComponent(idUsuario)}&centrocostoscodigo=${valorCentroCosto}`;
    window.open(url, '_blank');
}
function bajasTecnicasMantenimiento() {
    // Obtener lista de activos vinculados al usuario
    fetch('/api/activosPorUsuario')
        .then(response => response.json())
        .then(activos => {
            let activosList = document.createElement('ul');
            activos.forEach(activo => {
                let listItem = document.createElement('li');
                listItem.textContent = `${activo.descripcion} (${activo.codigo})`;
                listItem.onclick = () => {
                    let opciones = confirm("¿El activo es reparable?");
                    if (opciones) {
                        // Mostrar formulario para rellenar presupuesto de reparación
                        let formulario = document.createElement('form');
                        formulario.innerHTML = `
                            <h3>Presupuesto de Reparación</h3>
                            <label>Activo: ${activo.descripcion} (${activo.codigo})</label><br>
                            <label>Empleado responsable: ${activo.nombre_empleado}</label><br>
                            <label>Centro: ${activo.centro}</label><br>
                            <label>Área: ${activo.area}</label><br>
                            <label for="presupuesto">Presupuesto:</label>
                            <input type="text" id="presupuesto" name="presupuesto" required><br>
                            <button type="submit">Guardar</button>
                        `;
                        formulario.onsubmit = (e) => {
                            e.preventDefault();
                            let presupuesto = document.getElementById('presupuesto').value;
                            alert(`Estimado usuario,

El presupuesto de reparación ha sido guardado exitosamente. A continuación, se detallan los datos relevantes:

- Activo: ${activo.descripcion} (${activo.codigo})
- Empleado responsable: ${activo.nombre_empleado}
- Centro: ${activo.centro}
- Área: ${activo.area}
- Presupuesto: ${presupuesto}

Atentamente,
Departamento de Soporte Técnico`);
                        };
                        document.body.appendChild(formulario);
                    } else {
                        // Mostrar mensaje de activo irreparable
                        alert(`Estimado usuario,

Lamentamos informarle que el activo ${activo.descripcion} (${activo.codigo}) no se pudo reparar. El estado del activo ha sido actualizado a "Fuera de Servicio".

Atentamente,
Departamento de Soporte Técnico`);
                        // Actualizar estado del activo en la base de datos
                        fetch(`/api/actualizarEstadoActivo/${activo.id}`, {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json'
                            },
                            body: JSON.stringify({ estado: 'Fuera de Servicio' })
                        });
                    }
                };
                activosList.appendChild(listItem);
            });
            document.body.appendChild(activosList);
        });
}