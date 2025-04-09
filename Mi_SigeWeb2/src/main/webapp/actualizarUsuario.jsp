<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.SQLException" %>
<%
    String id = request.getParameter("id");
    String nombreusuario = request.getParameter("nombreusuario");
    String correo = request.getParameter("correo");
    String tipoid = request.getParameter("tipoid");
    String contraseña = request.getParameter("contraseña");

    Connection con = null;
    PreparedStatement ps = null;

    try {
        Class.forName("org.postgresql.Driver");
        con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/SigeWeb2", "postgres", "joser3007");

        String query = "UPDATE usuario SET nombreusuario = ?, correo = ?, tipoid = ?, contraseña = ? WHERE id = ?";
        ps = con.prepareStatement(query);
        ps.setString(1, nombreusuario);
        ps.setString(2, correo);
        ps.setInt(3, Integer.parseInt(tipoid));
        ps.setString(4, contraseña);
        ps.setString(5, id);
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


