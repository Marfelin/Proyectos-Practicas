<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Proceso de Bajas T�cnicas</title>
    </head>
    <body>
        <h1>Proceso de Bajas T�cnicas</h1>
        <form action="ProcesoBajasTecnicasServlet" method="post">
            <label for="idUsuario">ID Usuario:</label>
            <input type="text" id="idUsuario" name="idUsuario" required>
            <button type="submit">Buscar</button>
        </form>
    </body>
</html>
