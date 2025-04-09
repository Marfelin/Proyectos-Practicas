<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Visita - Mi SIEWEB2</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="visita.js"></script>
    </head>
    <body>
        <header class="bg-success text-white p-3">
            <div class="container">
                <div class="d-flex justify-content-between align-items-center">
                    <h1 class="logo">Mi SIEWEB</h1>
                    <div class="d-flex align-items-center">
                        <i class="fa-solid fa-user mr-2"></i>

                        <form action="logout.jsp" method="post" class="d-inline">
                            <button class="btn btn-outline-light" type="submit">Log out</button>
                        </form>
                    </div>
                </div>
            </div>
        </header>
        <div class="container mt-5">
            <h1>Bienvenido</h1>
            <p>Esta es la página de visita.</p>

            <!-- Añade más contenido específico para los visitantes aquí -->

            <select id="opciones" class="form-control mb-3">
                <option value="centroCosto">Centro de Costo</option>
                <option value="activosFijos">Activos Fijos</option>
                <option value="utilesHerramientas">Útiles y Herramientas</option>
                <option value="existenciaProductos">Existencia de Productos</option>
            
            </select>
            <button class="btn btn-primary" onclick="ejecutarFuncion()">Ejecutar</button>
        </div>
        <footer class="bg-light text-center p-3 mt-5">
            <p>© 2024 SEVEN. Todos los derechos reservados.</p>
        </footer>
        <script src="js/visita.js"></script>
    </body>
</html>
