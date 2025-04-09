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


