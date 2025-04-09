<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.SQLException" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Eliminar Usuario</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script>
        function confirmarEliminacion() {
            if (confirm("¿Estás seguro de que deseas eliminar este usuario?")) {
                document.getElementById("eliminarForm").submit();
            } else {
                window.location.href = 'admin.jsp';
            }
        }
    </script>
</head>
<body onload="confirmarEliminacion()">
    <%
        String id = request.getParameter("id");

        Connection con = null;
        PreparedStatement ps = null;

        try {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/SigeWeb2", "postgres", "joser3007");

            String query = "DELETE FROM usuario WHERE id = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();

            response.sendRedirect("admin.jsp?success=true");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin.jsp?success=false&error=" + e.getMessage());
        } finally {
            if (ps != null) try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (con != null) try { con.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    %>
    <form id="eliminarForm" method="post" action="eliminarUsuario.jsp">
        <input type="hidden" name="id" value="<%= id %>">
    </form>
</body>
</html>




