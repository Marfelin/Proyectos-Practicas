<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    String usuario = request.getParameter("usuario");
    String password = request.getParameter("password");

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    boolean loginExitoso = false;
    int userId = -1;
    String tipo = "";

    try {
    
        Class.forName("org.postgresql.Driver");
        con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/SigeWeb2", "postgres", "joser3007");

        String query = "SELECT u.id, t.nombre AS tipo FROM usuario u JOIN tipo t ON u.tipoid = t.id WHERE u.nombreusuario = ? AND u.contraseña = ?";
        ps = con.prepareStatement(query);
        ps.setString(1, usuario);
        ps.setString(2, password);
        rs = ps.executeQuery();

        if (rs.next()) {
            loginExitoso = true;
            userId = rs.getInt("id");
            tipo = rs.getString("tipo"); // Asignar el tipo de usuario
            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("logeado", "1"); // Corregir el error tipográfico
            httpSession.setAttribute("userId", userId);
            httpSession.setAttribute("tipo", tipo);
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (ps != null) try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (con != null) try { con.close(); } catch (SQLException e) { e.printStackTrace(); }
    }

    if (loginExitoso) {
%>
<script>
    alert("Login exitoso. ¡Bienvenido, <%= usuario %>!");
    window.location.href = "index.jsp"; // Redirige a la página principal
</script>
<%
    } else {
%>
<script>
    alert("Usuario o contraseña incorrectos.");
    window.location.href = "login.html"; // Redirige de nuevo a la página de login
</script>
<%
    }
%>

