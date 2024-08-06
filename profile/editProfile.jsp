<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
.myInput{
font-size:18px;
}
</style></head>
<body>
<form name="f1" action=editUser.jsp>
<h1>Edit Profile</h1>
<table border="1" align="center" width="60%">
<tr>
<th>ID</th>
<th>Name</th>
<th>email</th>
<th>Mobile</th>
</tr>
<%
String linkUrl="editUser.jsp?uid="+uid2;
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
<td><input type=text class=myInput value=<%=uid%> name=uid readonly></td>
<td><input type=text class=myInput value=<%=resultSet.getString("name")%> name=uname> </td>
<td><input type=text class=myInput value=<%=resultSet.getString("email")%>  name=uemail></td>
<td><input type=text class=myInput value=<%=resultSet.getString("mobile")%>  name=umobile></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
out.println(e.getMessage());
}
%>
</table> 
<center><a href=Re.jsp>Back</a>&nbsp;&nbsp;&nbsp;&nbsp;<input type=submit value="Edit" class=myInput></center></form>
</body>
</html>
