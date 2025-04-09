<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="java.sql.*" %>
<%
    HttpSession httpSession = request.getSession(false); 
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
        <title>Economista - Mi SIEWEB2</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <style>
            .container-content {
                display: none;
            }
            #bienvenida {
                display: block;
            }
        </style>
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
        <div class="d-flex">
            <nav class="bg-light p-3" id="sidebar">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link disabled" href="#">Contabilidad</a>
                        <ul class="nav flex-column ml-3">
                            <li class="nav-item">
                                <a class="nav-link" href="#" onclick="showContainer('activosFijos')">Activos Fijos</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" onclick="showContainer('activosFijosClasificacion')">Activos Fijos por Clasificación</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" onclick="showContainer('utilesHerramientas')">Útiles y Herramientas</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" onclick="showContainer('bajaTecnica')">Baja Técnica</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </nav>
            <div class="container mt-5">
                <div id="bienvenida" class="container-content">
                    <h1>Bienvenido, Economista</h1>
                    <p>Esta es la página de economista.</p>
                </div>
                <div id="activosFijos" class="container-content">
                    <div class="d-flex align-items-center mb-3">
                        <img src="img/activofijo.jpg" alt="Activos Fijos" width="150" height="150">
                        <h3 class="ml-3">Activos Fijos</h3>
                    </div>
                    <p>Descripción de la opción Activos Fijos en SIEWEB.</p>
                    <hr>
                    <select id="listaOpcionesCentroCostoActivosFijos" class="form-control mt-3">
                        <option value="CC001">Centro de Costo de Area</option>
                        <option value="CC002">Centro de Costo de Almacenes</option>
                    </select>
                    <button class="btn btn-primary mt-3" onclick="generarReporteActivosFijos()">Ver Activos Fijos</button>
                </div>
                <div id="activosFijosClasificacion" class="container-content">
                    <div class="d-flex align-items-center mb-3">
                        <img src="img/activoFijoClasificacion.jpg" alt="Activos Fijos por Clasificación" width="150" height="150">
                        <h3 class="ml-3">Activos Fijos por Clasificación</h3>
                    </div>
                    <p>Descripción de la opción Activos Fijos por Clasificación en SIEWEB.</p>
                    <hr>
                    <select id="listaClasificaciones" class="form-control mt-3">
                        <option value="Electrónicos">Electrónicos</option>
                        <option value="Muebles">Inmobiliario</option>
                    </select>
                    <select id="listaSubClasificaciones" class="form-control mt-3">
                        <option value="Impresoras">Impresoras</option>
                        <option value="Computadoras">Computadoras</option>
                    </select>
                    <button class="btn btn-primary mt-3" onclick="generarReporteActivosFijosPorClasificacionSinFiltro()">Todo</button>
                    <button class="btn btn-secondary mt-3" onclick="generarReporteActivosFijosPorClasificacion()">Ver por Clasificación y Subclasificación</button>
                </div>
                <div id="utilesHerramientas" class="container-content">
                    <div class="d-flex align-items-center mb-3">
                        <img src="img/utilesHerramientas.jpg" alt="Útiles y Herramientas" width="150" height="150">
                        <h3 class="ml-3">Útiles y Herramientas</h3>
                    </div>
                    <p>Descripción de la opción Útiles y Herramientas en SIEWEB.</p>
                    <hr>
                    <select id="listaOpcionesCentroCostoUtilesHerramientas" class="form-control mt-3">
                        <option value="CC001">Centro de Costo de Area</option>
                        <option value="CC002">Centro de Costo de Almacenes</option>
                    </select>
                    <button class="btn btn-primary mt-3" onclick="generarReporteUtilesHerramientas()">Ver Útiles y Herramientas</button>
                </div>
                <div id="bajaTecnica" class="container-content">
                    <div class="d-flex align-items-center mb-3">
                        <img src="img/bajaTecnica.jpg" alt="Baja Técnica" width="150" height="150">
                        <h3 class="ml-3">Baja Técnica</h3>
                    </div>
                    <p>Baja Técnica en SIEWEB.</p>
                    <hr>
                    <button class="btn btn-primary" onclick="bajasTecnicasEconomia()">Baja Técnica</button>
                </div>

            </div>
        </div>
        <footer class="bg-light text-center p-3 mt-5">
            <p>© 2024 SEVEN. Todos los derechos reservados.</p>
        </footer>
        <script src="js/economista.js"></script>
        <script src="js/bajasTecnicas.js"></script>
    </body>
</html>
