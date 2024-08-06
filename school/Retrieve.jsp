<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("uname");
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
ResultSet resultSet = null;
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

<h1>Retrieve data from database in jsp</h1>
<table border="1" align="center" width="60%">
<tr>
<th>Faculty</th>


</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from final";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){

%>
<tr>
<td><%=resultSet.getString("faculty") %></td>

</tr>
<%
}
connection.close();
} catch (Exception e) {
out.println(e.getMessage());
}
%>
</table> 

</body>
</html>