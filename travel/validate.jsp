<%@include file="DBConn.jsp"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String src = request.getParameter("src");
String dest = request.getParameter("dest");
if(src=="" || dest ==""){
  response.sendRedirect("index.jsp?msg='Invalid Selection!'&bool=0");
}
out.println(src);

%>

<html>
<head>
<style>
*{
text-align:center;
}
th,td{
font-size:32px;
}

</style>
<script lang="javascript">

</script>

</head>
<body>

<h1>Retrieve data from database in jsp</h1>
<form action="book.jsp" >
<table border="1" align="center" width="60%">
<tr>
<th>ID</th>
<th>Name</th>

</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from sche where source_bus='"+src+"'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td id="source_bus"><%=resultSet.getString("source_bus") %></td>
<td id="dest_bus"><%=resultSet.getString("dest_bus") %></td>
<td><%=resultSet.getString("bus_id") %></td>
<td><%=resultSet.getInt("seats") %></td>
<%
  int bid=Integer.parseInt(resultSet.getString("bus_id"));
%>
<td align="center"><input type="checkbox" class="myCheckBox" name="deleteList" value="<%=bid  %>"></td>


</tr>
<%
}
connection.close();
} catch (Exception e) {
out.println(e.getMessage());
}
%>

</table> 
<input type="submit" value="book">
</form>
</body>
</html>
