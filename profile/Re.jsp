<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("uname");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "MyProjectDatabase";
String userid = "root";
String password = "root";
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
<th>ID</th>
<th>Name</th>


</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from users";
resultSet = statement.executeQuery(sql);
String uid=null;
String linkUrl=null,linkUrl2=null;
while(resultSet.next()){
uid=resultSet.getString("id");
linkUrl="deleteUser.jsp?uid="+uid;
linkUrl2="viewUser.jsp?uid="+uid;
%>
<tr>
<td><%=uid%></td>
<td><%=resultSet.getString("name") %></td>
<td><a href=<%=linkUrl2%>>View Profile</a></td>
<td><a href=<%=linkUrl%>>Delete</a></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
out.println(e.getMessage());
}
%>
</table> <br><br>
<a href="UserRegistration.jsp">New User Registration</a>

</body>
</html>
