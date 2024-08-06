<%@ page session="false" %>
<%
    session.invalidate();
    response.sendRedirect("login.html");
%>

