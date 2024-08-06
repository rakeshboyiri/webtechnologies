<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%> 
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("uname");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "travel_db";
String userid = "naresh";
String password = "Naresh.@123";
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

<h1>Buses</h1>
<table border="1" align="center" width="60%">
<tr>
<th>ID</th>
<th>Source</th>
<th>Destination</th>
<th>Vacancy</th>

</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from buses";
resultSet = statement.executeQuery(sql);
int uid;
String source;
String destination;
int vacancy;
String linkUrl=null;
while(resultSet.next()){
     uid=Integer.parseInt(resultSet.getString("id"));
     source=resultSet.getString("source");
     destination=resultSet.getString("destination");
     vacancy=Integer.parseInt(resultSet.getString("vacant_seats"));
    
%>
<tr>
<td><%=uid %></td>
<td><%=resultSet.getString("source")%></td>
<td><%=resultSet.getString("destination") %></td>
<td><%=vacancy%></td>



</tr>
<%
}
connection.close();
} catch (Exception e) {
out.println(e.getMessage());
}
%>
</table> 


<h1>Online Travel Management</h1>
<form action="listBuses.jsp" method="get">

<label for="source">Source :</label>
<select name="source" id="source">
    <option value="Select Source" selected disabled>Select Source</option>
    <option value="CityA">CityA</option>
    <option value="CityB">CityB</option>
    <option value="CityC">CityC</option>
</select>
<br>
<br>

<label for="destination">Destination :</label>

<select name="destination" id="destination">
    <option value="Select destination" selected disabled>Select Destination</option>
    <option value="CityA">CityA</option>
    <option value="CityB">CityB</option>
    <option value="CityC">CityC</option>
</select>
<br>
<br>
<input type="submit" value="Search Buses">
</form>
</body>
</html>



