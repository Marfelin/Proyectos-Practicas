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
