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
int user_id=Integer.parseInt(request.getParameter("uid"));
String user_name=request.getParameter("uname");
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
<head>
<style>
*{
text-align:center;
color:white;
}

body{
	background-color:black;
}
th,td{
font-size:32px;
}
.container{
	width:60%;
	height:100px;
	border: 1px solid white;
	margin:200px auto;
	padding:100px 0px 40px 0px;
	border-radius:50px;
	background-color:gray;
	color:black;
	box-shadow: 0px 0px 20px green;
	

}
.container >center > a {
	
	color:black;
	

}

</style>
</head>
<body>

<h1></h1>
<div class="container">

<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from users where id="+user_id+" and name="+"\'"+user_name+"\'";
resultSet = statement.executeQuery(sql);

if(resultSet.next()){
	out.println("<center><b>Successfully Login!<br><br/><a href='userHome.html'>Go To HomePage</a></b></center>");
}else{
	out.println("User Not Found<br/>");
	out.println("<center><a href='signup.html' >Create new Account</a></b></center>");
	
}

%>

<%
connection.close();
} catch (Exception e) {
out.println(e.getMessage());
}
%>
</div> 

</body>
</html>
