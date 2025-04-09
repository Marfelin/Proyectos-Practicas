<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Agregar Usuario</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
<h2>Crear Usuario</h2>
<form id="formCrearUsuario" action="procesarAgregarUsuario.jsp" method="post">
    <label for="nombre">Nombre de Usuario:</label>
    <input type="text" id="nombre" name="nombreusuario" required>
    <label for="correo">Correo:</label>
    <input type="email" id="correo" name="correo" required>
    <label for="tipo">Tipo:</label>
    <select id="tipo" name="tipoid" required>
        <option value="1">Admin</option>
        <option value="2">Responsable de Áreas</option>
        <option value="3">Economista</option>
        <option value="4">Mantenimiento</option>
    </select>
    <label for="contraseña">Contraseña:</label>
    <input type="password" id="contraseña" name="contraseña" required>
    <button type="submit" class="btn btn-primary">Crear</button>
</form>
<%
    String success = request.getParameter("success");
    if ("true".equals(success)) {
%>
    <script>alert("Usuario creado correctamente.");</script>
<%
    } else if ("false".equals(success)) {
%>
    <script>alert("Error al crear el usuario.");</script>
<%
    }
%>
</body>
</html>

