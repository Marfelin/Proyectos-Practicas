<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Modificar Usuario</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h1 class="mt-5">Modificar Usuario</h1>
        <%
            String id = request.getParameter("id");
            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            String nombreusuario = "";
            String correo = "";
            int tipoid = 0;
            String contraseña = "";

            try {
                Class.forName("org.postgresql.Driver");
                con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/SigeWeb2", "postgres", "joser3007");

                String query = "SELECT nombreusuario, correo, tipoid, contraseña FROM usuario WHERE id = ?";
                ps = con.prepareStatement(query);
                ps.setString(1, id);
                rs = ps.executeQuery();

                if (rs.next()) {
                    nombreusuario = rs.getString("nombreusuario");
                    correo = rs.getString("correo");
                    tipoid = rs.getInt("tipoid");
                    contraseña = rs.getString("contraseña");
                }
        %>
        <form action="actualizarUsuario.jsp" method="post" class="mt-4">
            <input type="hidden" name="id" value="<%= id %>">
            <div class="form-group">
                <label for="nombreusuario">Nombre de Usuario:</label>
                <input type="text" class="form-control" id="nombreusuario" name="nombreusuario" value="<%= nombreusuario %>" required>
            </div>
            <div class="form-group">
                <label for="correo">Correo:</label>
                <input type="email" class="form-control" id="correo" name="correo" value="<%= correo %>" required>
            </div>
            <div class="form-group">
                <label for="tipoid">Tipo ID:</label>
                <select class="form-control" id="tipoid" name="tipoid" required>
                    <%
                        String tipoQuery = "SELECT id, nombre FROM tipo";
                        ps = con.prepareStatement(tipoQuery);
                        ResultSet tipoRs = ps.executeQuery();
                        while (tipoRs.next()) {
                            int tipoIdValue = tipoRs.getInt("id");
                            String tipoNombre = tipoRs.getString("nombre");
                    %>
                    <option value="<%= tipoIdValue %>" <%= tipoid == tipoIdValue ? "selected" : "" %>><%= tipoNombre %></option>
                    <%
                        }
                        tipoRs.close();
                    %>
                </select>
            </div>
            <div class="form-group">
                <label for="contraseña">Contraseña:</label>
                <input type="password" class="form-control" id="contraseña" name="contraseña" value="<%= contraseña %>" required>
            </div>
            <button type="submit" class="btn btn-primary">Actualizar</button>
        </form>
        <%
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (ps != null) try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (con != null) try { con.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        %>
    </div>
</body>
</html>


