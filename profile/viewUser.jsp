<%@page import="java.sql.*"%>

<%
String uid2 = request.getParameter("uid");
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
<th>email</th>
<th>Mobile</th>
</tr>
<%
String linkUrl="editProfile.jsp?uid="+uid2;
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from users where id="+uid2;
resultSet = statement.executeQuery(sql);
String uid=null;
while(resultSet.next()){
uid=resultSet.getString("id");

%>
<tr>
<td><%=uid%></td>
<td><%=resultSet.getString("name")%></td>
<td><%=resultSet.getString("email")%></td>
<td><%=resultSet.getString("mobile") %></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
out.println(e.getMessage());
}
%>
</table> 
<center><a href=Re.jsp>Back</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href=<%=linkUrl%>>Edit Profile</a></center>
</body>
</html>
