<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.SQLException" %>
<%@ page import="java.util.Random" %>
<%
    String nombreusuario = request.getParameter("nombreusuario");
    String correo = request.getParameter("correo");
    String tipoid = request.getParameter("tipoid");
    String contraseña = request.getParameter("contraseña");

    Connection con = null;
    PreparedStatement ps = null;

    try {
        Class.forName("org.postgresql.Driver");
        con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/SigeWeb2", "postgres", "joser3007");

        Random random = new Random();
        int id = random.nextInt(1000000); // Genera un número aleatorio entre 0 y 999999

        String query = "INSERT INTO usuario (id, nombreusuario, correo, tipoid, contraseña) VALUES (?, ?, ?, ?, ?)";
        ps = con.prepareStatement(query);
        ps.setInt(1, id);
        ps.setString(2, nombreusuario);
        ps.setString(3, correo);
        ps.setInt(4, Integer.parseInt(tipoid));
        ps.setString(5, contraseña);
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
