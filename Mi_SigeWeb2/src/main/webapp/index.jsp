<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="java.sql.*" %>
<%
    HttpSession httpSession = request.getSession(true); // No crear una nueva sesi�n si no existeaaa

    if (httpSession == null || httpSession.getAttribute("logeado") == null || httpSession.getAttribute("logeado").equals("0")) {
        // Redirigir a login.html si el usuario no est� logueado
        response.sendRedirect("login.html");
    } else {
        // Continuar con la p�gina si el usuario est� logueado
        Integer userId = (Integer) httpSession.getAttribute("userId");
        String tipoUsuario = (String) httpSession.getAttribute("tipo");

        if ("Administrador".equals(tipoUsuario) || "administrador".equals(tipoUsuario)) {
            response.sendRedirect("admin.jsp");
        } else if ("Economista".equals(tipoUsuario) || "economista".equals(tipoUsuario)) {
            response.sendRedirect("economista.jsp");
        } else if ("Mantenimiento".equals(tipoUsuario) || "mantenimiento".equals(tipoUsuario)) {
            response.sendRedirect("mantenimiento.jsp");
        } else if ("visita".equals(tipoUsuario) || "Visita".equals(tipoUsuario)) {
            response.sendRedirect("visita.jsp");
        } else if ("recursosHumanos".equals(tipoUsuario) || "RecursosHumanos".equals(tipoUsuario)) {
            response.sendRedirect("recursosHumanos.jsp");
        } else if ("ResponsableAreas".equals(tipoUsuario) || "responsableAreas".equals(tipoUsuario)) {
            response.sendRedirect("area.jsp");
        } else {
            // Redirigir a login.html si el tipo de usuario no es v�lido
            response.sendRedirect("login.html");
        }
    }
%>
