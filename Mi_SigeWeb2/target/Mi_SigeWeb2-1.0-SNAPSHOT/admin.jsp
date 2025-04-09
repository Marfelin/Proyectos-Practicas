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
        <title>Administrador - Mi SIEWEB2</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

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
                        <a class="nav-link disabled" href="#">Mi SIEWEB2</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled" href="#">General</a>
                        <ul class="nav flex-column ml-3">
                            <li class="nav-item">
                                <a class="nav-link" href="#" onclick="showContainer('centroCosto')">Centro de Costo</a>
                            </li>
                        </ul>
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
                                <a class="nav-link" href="#" onclick="showContainer('utilesHerramientas')">Útiles y Herramientas</a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled" href="#">Inventario</a>
                        <ul class="nav flex-column ml-3">
                            <li class="nav-item">
                                <a class="nav-link" href="#" onclick="showContainer('existenciaProductos')">Existencia de Productos</a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" onclick="showContainer('listadoUsuarios')">Administrar Usuarios</a>
                    </li>
                </ul>
            </nav>
            <main class="container mt-5">
                <div id="miSigeWeb" class="content-container">
                    <h2>Mi SIEWEB2</h2>
                    <p>El panel de administración de la plataforma web proporciona al administrador herramientas para ejercer control total sobre el sistema. Facilita la gestión de usuarios, habilitando la creación, modificación y eliminación de cuentas. Adicionalmente, el administrador puede acceder a un registro completo de las acciones de todos los usuarios, lo que proporciona una auditoría detallada de las actividades del sistema. Para complementar el control, se tiene acceso a todos los reportes financieros del sistema</p>
                </div>
                <div id="centroCosto" class="content-container" style="display: none;">
                    <div class="d-flex align-items-center mb-3">
                        <img src="img/Centro de costo.jpg" alt="Centro de Costo" width="150" height="150">
                        <h3 class="ml-3">Centro de Costo</h3>
                    </div>
                    <p>Descripción de la opción Centro de Costos en SIEWEB.</p>
                    <hr>
                    <select id="listaOpcionesCentroCosto" class="form-control mt-3">
                        <option value="CC001">Centro de Costo de Area </option>
                        <option value="CC002">Centro de Costo de Almacenes</option>
  
                    </select>
                    <button class="btn btn-success mt-3" onclick="verTodosLosCentrosDeCosto()">Ver todos los centros de costo</button>
                    <button class="btn btn-primary mt-3" onclick="verCentroDeCosto()">Ver Centro de Costo</button>
                </div>

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

                <div id="utilesHerramientas" class="content-container" style="display: none;">
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

                <div id="existenciaProductos" class="content-container" style="display: none;">
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

                <div id="listadoTrabajadores" class="content-container" style="display: none;">
                    <div class="d-flex align-items-center mb-3">
                        <img src="img/lista de trabajadores.jpg" alt="Listado de Trabajadores" width="150" height="150">
                        <h3 class="ml-3">Listado de Trabajadores</h3>
                    </div>
                    <p>Descripción de la opción Listado de Trabajadores en SIEWEB.</p>
                    <hr>
                    <select id="listaProvincias" class="form-control mt-3">
                        <option value="mayabeque">Mayabeque</option>
                        <option value="habana">La Habana</option>
                        <option value="artemisa">Artemisa</option>
                        <option value="matanzas">Matanzas</option>
                        <option value="pinar">Pinar del Rio</option>
                        <option value="isla">Isla de la Juventud</option>
                    </select>
                    <select id="listaCargos" class="form-control mt-3">
                        <option value="Profesor">Profesor</option>
                        <option value="Especialista">Especialista</option>
                        <option value="Tecnico">Tecnico</option>
                        <option value="Analista">Analista</option>
                        <option value="Contador">Contador</option>
                        <option value="Investigador">Investigador</option>
                    </select>
                    <select id="listaProfesiones" class="form-control mt-3">
                        <option value="ContadorPúblico">Contador Publico</option>
                        <option value="IngieneriaInformatica">Ingieneria Informatica</option>
                        <option value="IngenieroenSistemas">Ingeniero en Sistemas</option>
                        <option value="Tecnicodelaboratorio">Tecnico de laboratorio</option>
                    </select>
                    <select id="listaCentrosCosto" class="form-control mt-3">
                        <option value="CC001">Centro de Costo 1</option>
                        <option value="CC002">Centro de Costo 2</option>
                        <option value="CC003">Centro de Costo 3</option>
                        <option value="CC004">Centro de Costo 4</option>
                        <option value="CC005">Centro de Costo 5</option>
                        <option value="CC006">Centro de Costo 6</option>
                        <option value="CC007">Centro de Costo 7</option>
                        <option value="CC008">Centro de Costo 8</option>
                        <option value="CC009">Centro de Costo 9</option>
                        <option value="CC010">Centro de Costo 10</option>
                        <option value="CC011">Centro de Costo 11</option>
                        <option value="CC012">Centro de Costo 12</option>
                    </select>
                    <button class="btn btn-primary mt-3" onclick="generarReporteListaTrabajadores()">Generar Reporte</button>
                    <button class="btn btn-primary mt-3" onclick="verTrabajadores()">Ver Trabajadores</button>
                    <button class="btn btn-primary mt-3" onclick="verTrabajadoresSinProvincia()">Ver Trabajadores sin tener en cuenta la Provincia</button>
                    <button class="btn btn-primary mt-3" onclick="verTrabajadoresSinCargo()">Ver Trabajadores sin tener en cuenta el Cargo</button>
                    <button class="btn btn-primary mt-3" onclick="verTrabajadoresSinProfesion()">Ver Trabajadores sin tener en cuenta la Profesión</button>
                    <button class="btn btn-primary mt-3" onclick="verTrabajadoresSinCentroCosto()">Ver Trabajadores sin tener en cuenta el Centro de Costo</button>
                </div>

               <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException" %>
<%
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("org.postgresql.Driver");
        con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/SigeWeb2", "postgres", "joser3007");

        String query = "SELECT u.id, u.nombreusuario, t.nombre FROM usuario u JOIN tipo t ON u.tipoid = t.id";
        ps = con.prepareStatement(query);
        rs = ps.executeQuery();
%>
<div id="listadoUsuarios" class="content-container">
    <div class="d-flex align-items-center mb-3">
        <img src="img/gestionUsuarios.jpg" alt="Listado de Usuarios" width="150" height="150">
        <h3 class="ml-3">Listado de Usuarios</h3>
    </div>
    <p>Descripción de la opción Listado de Usuarios en SIEWEB.</p>
    <hr>
    <button class="btn btn-success mb-3" onclick="window.location.href = 'agregarUsuario.jsp'">Crear Usuario</button>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre y Apellidos</th>
                <th>Tipo</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <%
                while (rs.next()) {
                    String id = rs.getString("id");
                    String nombre = rs.getString("nombreusuario");
                    String tipo = rs.getString("nombre");
            %>
            <tr>
                <td><%= id %></td>
                <td><%= nombre %></td>
                <td><%= tipo %></td>
                <td>
                    <button class="btn btn-warning" onclick="window.location.href = 'modificarUsuario.jsp?id=<%= id %>'">Modificar</button>
                    <button class="btn btn-danger" onclick="window.location.href = 'eliminarUsuario.jsp?id=<%= id %>'">Eliminar</button>
                </td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>

<%
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (ps != null) try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (con != null) try { con.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>

            </main>
        </div>
        <footer class="bg-light text-center p-3 mt-5">
            <p>© 2024 SEVEN. Todos los derechos reservados.</p>
        </footer>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="js/admin.js"></script>
    </body>
</html>
