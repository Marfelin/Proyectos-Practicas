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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Responsable de Àrea - Mi SIEWEB2</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <body>
        <header class="bg-success text-white p-3">
            <div class="container">
                <div class="d-flex justify-content-between align-items-center">
                    <h1 class="logo">Responsable de Área</h1>
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
                            <a class="nav-link disabled" href="#">Responsable de Área</a>
                        </li>
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
                                    <a class="nav-link" href="#" onclick="showContainer('bajaTecnica')">Baja Técnica</a>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link disabled" href="#">Áreas</a>
                            <ul class="nav flex-column ml-3">
                                <li class="nav-item">
                                    <a class="nav-link" href="#" onclick="showContainer('productos')">Productos</a>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" onclick="showContainer('bajaTecnica')">Baja Técnica</a>
                        </li>
                    </ul>
                </nav>
                <main class="col-md-10 mt-5">
                    <div id="bienvenida" class="content-container">
                        <h1>Bienvenido</h1>
                        <p>Esta es la página del Responsable de Àreas</p>
                    </div>
                    <!-- Contenedor para Activos Fijos -->
                    <div id="activosFijos" class="content-container" style="display: none;">
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
                    <!-- Contenedor para Activos Fijos por Clasificación -->
                    <div id="activosFijosClasificacion" class="content-container" style="display: none;">
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
                    <!-- Contenedor para Productos -->
                    <div id="productos" class="content-container" style="display: none;">
                        <div class="d-flex align-items-center mb-3">
                            <img src="img/almacen.jpg" alt="Existencia de Productos" width="150" height="150">
                            <h3 class="ml-3">Existencia de Productos</h3>
                        </div>
                        <p>Descripción de la opción Existencia de Productos en SIEWEB.</p>
                        <hr>
                        <select id="listaAlmacenes" class="form-control mt-3">
                            <option value="AL01">Almacén Central</option>
                            <option value="AL02">Almacén Secundario</option>
                            <option value="AL03">Almacén de Tecnología</option>
                            <option value="AL04">Almacén de Mantenimiento</option>
                            <option value="AL05">Almacén Administrativo</option>
                        </select>
                        <select id="listaCategorias" class="form-control mt-3">
                            <option value="Electrónicos">Electrónicos</option>
                            <option value="Muebles">Inmobiliario</option>
                            <option value="Herramientas">Herramientas</option>
                            <option value="Material Oficina">Material Oficina</option>
                            <option value="Equipos Comunicación">Equipos Comunicación</option>
                        </select>
                        <select id="listaSubCategorias" class="form-control mt-3">
                            <option value="Computadoras">Computadoras</option>
                            <option value="Impresoras">Impresoras</option>
                            <option value="Mesas">Mesas</option>
                            <option value="Sillas">Sillas</option>
                            <option value="Herramientas">Herramientas</option>
                            <option value="Escritura">Escritura</option>
                            <option value="Teléfonos">Teléfonos</option>
                            <option value="Radios">Radios</option>
                        </select>
                        <button class="btn btn-primary mt-3" onclick="generarReporteProductos()">Ver Existencia de Productos sin tener en cuenta Almacénes</button>
                        <button class="btn btn-primary mt-3" onclick="generarReporteProductosSinCategoria()">Ver Existencia de Productos sin tener en cuenta Categoría</button>
                        <button class="btn btn-primary mt-3" onclick="generarReporteProductosSinSubcategoria()">Ver Existencia de Productos sin tener en cuenta Subcategoría</button>
                        <button class="btn btn-success mt-3" onclick="generarReporteProductosCompleto()">Ver Existencia de Productos</button>
                    </div>
                    <!-- Contenedor para Baja Técnicas -->
                    <div id="bajaTecnica" class="container-content">
                        <div class="d-flex align-items-center mb-3">
                            <img src="img/bajaTecnica.jpg" alt="Baja Técnica" width="150" height="150">
                            <h3 class="ml-3">Baja Técnica</h3>
                        </div>
                        <p>Baja Técnica en SIEWEB.</p>
                        <hr>
                        <button class="btn btn-primary" onclick="bajasTecnicasArea()">Baja Técnica</button>
                    </div>
                </main>
            </div>
        </div>
        <footer class="bg-light text-center p-3 mt-5">
            <p>© 2024 SEVEN. Todos los derechos reservados.</p>
        </footer>
        <script src="js/area.js"></script>
        <script src="js/bajasTecnicas.js"></script>
    </body>
</html>