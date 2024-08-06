<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Enumeration"%>
<%
    String driver = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String database = "university_faculty_db";
    String userid = "manu";
    String password = "Manu@0809";
    try {
        Class.forName(driver);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    Connection connection = null;
    Statement statement = null;
    try {
        connection = DriverManager.getConnection(connectionUrl+database, userid, password);
        statement = connection.createStatement();
        String[] deleteIds = request.getParameterValues("deleteIds");
        if (deleteIds != null) {
            for (String id : deleteIds) {
                String sql = "insert into final(faculty) values('"+id+"')";
                statement.executeUpdate(sql);
            }
        }
        connection.close();
    } catch (Exception e) {
        out.println(e.getMessage());
    }
    response.sendRedirect("index.html");
%>