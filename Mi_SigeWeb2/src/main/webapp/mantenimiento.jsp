<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="java.sql.*" %>
<%
    HttpSession httpSession = request.getSession(false); 
    String usuarioConectado = "";
    if (httpSession == null || httpSession.getAttribute("logeado") == null || httpSession.getAttribute("logeado").equals("0")) {
        response.sendRedirect("login.html");
    }
%>
<%
    Integer userId = (Integer) httpSession.getAttribute("userId");
%>
<input type="hidden" id="userId" value="<%= userId %>">
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Mantenimiento - Mi SIEWEB2</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="js/mantenimiento.js"></script>
    </head>
    <body>
        <header class="bg-success text-white p-3">
            <div class="container">
                <div class="d-flex justify-content-between align-items-center">
                    <h1 class="logo">Mi SIEWEB2</h1>
                    <div class="d-flex align-items-center">
                        <i class="fa-solid fa-user mr-2"></i>
                      
                        <form action="logout.jsp" method="post" class="d-inline">
                            <button class="btn btn-outline-light" type="submit">Log out</button>
                        </form>
                    </div>
                </div>
            </div>
        </header>
        <div class="container-fluid">
            <div class="row">
                <nav class="col-md-2 bg-light p-3" id="sidebar">
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link disabled" href="#">Mi SIEWEB2</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link disabled" href="#">Mantenimiento</a>
                            <ul class="nav flex-column ml-3">
                                <li class="nav-item">
                                    <a class="nav-link" href="#" onclick="showContainer('utilesHerramientas')">�tiles y Herramientas</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#" onclick="showContainer('bajaTecnicas')">Baja T�cnicas</a>
                                </li><li class="nav-item">
                                    <a class="nav-link" href="#" onclick="showContainer('bajaTecnica')">Baja T�cnica</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </nav>
                <main class="col-md-10 mt-5">
                    <div id="mainContent">
                        <h1>Bienvenido, Mantenimiento</h1>
                        <p>Esta es la p�gina de mantenimiento.</p>
                    </div>
                    <!-- Contenedor para �tiles y Herramientas -->
                    <div id="utilesHerramientas" class="content-container" style="display: none;">
                        <div class="d-flex align-items-center mb-3">
                            <img src="img/utilesHerramientas.jpg" alt="�tiles y Herramientas" width="150" height="150">
                            <h3 class="ml-3">�tiles y Herramientas</h3>
                        </div>
                        <p>Descripci�n de la opci�n �tiles y Herramientas en SIEWEB.</p>
                        <hr>
                        <select id="listaOpcionesCentroCostoUtilesHerramientas" class="form-control mt-3">
                            <option value="CC001">Centro de Costo de Area</option>
                            <option value="CC002">Centro de Costo de Almacenes</option>
                        </select>
                        <button class="btn btn-primary mt-3" onclick="generarReporteUtilesHerramientas()">Ver �tiles y Herramientas</button>
                    </div>
                    <!-- Contenedor para Baja T�cnicas -->
                    <div id="bajaTecnica" class="container-content">
                        <div class="d-flex align-items-center mb-3">
                            <img src="img/bajaTecnica.jpg" alt="Baja T�cnica" width="150" height="150">
                            <h3 class="ml-3">Baja T�cnica</h3>
                        </div>
                        <p>Baja T�cnica en SIEWEB.</p>
                        <hr>
                        <button class="btn btn-primary" onclick="bajasTecnicasMantenimiento()">Baja T�cnica</button>
                    </div>
                </main>
            </div>
        </div>
        <footer class="bg-light text-center p-3 mt-5">
            <p>� 2024 SEVEN. Todos los derechos reservados.</p>
        </footer>
        <script src="js/mantenimiento.js"></script> 
        <<script src="js/bajasTecnicas.js"></script>
    </body>
</html>
