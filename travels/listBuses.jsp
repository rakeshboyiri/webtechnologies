<%@page import="java.sql.*"%>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "travel_db";
String userid = "root";
String password = "root";
String source = request.getParameter("source");
String destination = request.getParameter("destination");
try {
Class.forName(driver);
Connection connection = DriverManager.getConnection(connectionUrl + database, userid,password);
Statement statement = connection.createStatement();
String sql = "SELECT * FROM buses WHERE source = '" + source + "' AND destination = '"+ destination + "'";
ResultSet resultSet = statement.executeQuery(sql);
%>
<!DOCTYPE html>
<html>
<head>
<title>Available Buses</title>
</head>
<body>
<h1>Available Buses</h1>
<table border="1">
<tr>
<th>Bus ID</th>
<th>Source</th>
<th>Destination</th>
<th>Vacant Seats</th>
<th>Action</th>
</tr>
<%
while (resultSet.next()) {
%>
<tr>
<td><%= resultSet.getInt("id") %></td>
<td><%= resultSet.getString("source") %></td>
<td><%= resultSet.getString("destination") %></td>
<td><%= resultSet.getInt("vacant_seats") %></td>
<td><a href="bookNow.jsp?bus_id=<%= resultSet.getInt("id") %>">Book Now</a>
</td>
</tr>
<%
}
connection.close();
%>
</table>
</body>
</html>
<%
} catch (Exception e) {
out.println(e.getMessage());
}
%>
