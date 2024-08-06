<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("uname");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "election";
String userid = "root";
String password = "root";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
%>
<!DOCTYPE html>
<html>
<head><style>
*{
text-align:center;
}
th,td{
font-size:32px;
}

</style></head>
<body>

<%
try{
int flag=0;
int uid=Integer.parseInt(request.getParameter("val"));

connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();


if(uid==0){
 	statement.executeUpdate("update status set status=0");
    response.sendRedirect("voteschedule.jsp?msg='Stoped'");
}
else{
    
    
    statement.executeUpdate("update status set status=1");
    response.sendRedirect("voteschedule.jsp?msg='Started'");
}
}
catch(Exception e){
    out.println(e.getMessage());
}
%>

</body>
</html>
