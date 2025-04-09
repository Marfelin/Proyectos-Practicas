<%
    HttpSession httpSession = request.getSession(false);
    if (httpSession != null) {
        httpSession.invalidate();
    }
    response.sendRedirect("login.html");
%>
