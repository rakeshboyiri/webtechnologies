<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("uname");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";

String database = "faculty";
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

<html>
	<head>
		<title>Retrive </title>
		<style type="text/css">
		.maindiv{
			margin:50px auto;
			width:400px;
			height:400;
			background-color:gray;
		}
		h1{
		  text-align:center;
		}
		</style>
	</head>
	<body>
		<div class="maindiv">
		<h1>Faculty Details </h1>
		<form action="retrive.jsp" method="get">
		<select id="dept"  name="dept" onChange="submit()"> 
		  <option value=""></option>
		  <option value="cse">CSE </option>
		  <option value="ece">ECE </option>
		  <option value="civil">CIVIL </option>
		</select>
		</from>
		<% 
		  String deptname =request.getParameter("dept");
		  if(deptname!=null){
		    out.println("<h1>");
		    out.println(deptname);
		    out.println("</h1>");
		    }
		  %>
		<table border="1" align="center" width="60%">
<tr>
<th>ID</th>
<th>Name</th> 
<th> Select </th>
</tr>
<% 
if(deptname!=null)
{
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from faculty where dept='"+deptname+"'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getInt("id") %></td>
<td><%=resultSet.getString("name") %></td>
<td><input type="checkbox"></td>
</tr>
<%
}
connection.close();
}
 catch (Exception e) {
out.println(e.getMessage());
}
}
%>
</table> 
		</div>
	</body>
	
</html>
