<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<html>
<body>
<h1>CSE Department</h1>
<form action="aselect.jsp">
<table border=1>
<tr>
<th>Id</th>
<th>Name</th>
<th>Department</th>
<th><input type="submit" value="select"></th>
</tr>
<%
    String driver = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String database = "emailsoftware";
    String userid = "alekhya";
    String password = "alekhya37";

    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;

    try {
        Class.forName(driver);
        connection = DriverManager.getConnection(connectionUrl + database, userid, password);
        statement = connection.createStatement();
       

        
    } catch (Exception e) {
        out.println(e.getMessage());
    }
    
%>
</table>
</form>
</body>
</html>

