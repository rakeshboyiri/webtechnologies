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
	box-shadow: 0px 0px 20px cyan;
	

}
.container >center > a {
	
	color:black;
	

}

</style>
</head>
<body>

<h1></h1>
<div class="container">
    <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
int user_id=Integer.parseInt(request.getParameter("uid"));
String user_name=request.getParameter("uname");
try
{
         Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/MyProjectDatabase", "root", "root");
           Statement st=conn.createStatement();
           int i=st.executeUpdate("insert into users(id,name)values("+user_id+",'"+user_name+"')");
        out.println("<center><b>Successfully Signed-in!<br><a href='login.html'>Login</a></b></center>");
        }
        catch(Exception e)
        {
        out.println(e.getMessage());
        e.printStackTrace();
        }
 %>
</div> 

</body>
</html>
