<%@page import="java.sql.*"%>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "travel_db";
String userid = "naresh";
String password = "Naresh.@123";


String busId = request.getParameter("bus_id");
String numSeatsStr = request.getParameter("num_seats");

if (numSeatsStr != null) {
int numSeats = Integer.parseInt(numSeatsStr);
try {
Class.forName(driver);
Connection connection = DriverManager.getConnection(connectionUrl + database,userid, password);
Statement statement = connection.createStatement();


// Check available seats


String checkSeatsSql = "SELECT vacant_seats FROM buses WHERE id = " + busId;
ResultSet resultSet = statement.executeQuery(checkSeatsSql);
resultSet.next();
int vacantSeats = resultSet.getInt("vacant_seats");
if (numSeats <= vacantSeats) {
// Update vacant seats
String updateSeatsSql = "UPDATE buses SET vacant_seats = vacant_seats - " +numSeats + " WHERE id = " + busId;
statement.executeUpdate(updateSeatsSql);


// Insert booking
String insertBookingSql = "INSERT INTO bookings (bus_id, num_seats) VALUES ("+ busId + ", " + numSeats + ")";
statement.executeUpdate(insertBookingSql);
out.println("Booking successful!");
} else {
out.println("Not enough vacant seats available.");
}
connection.close();
} catch (Exception e) {
out.println(e.getMessage());
}
} else {
%>
<!DOCTYPE html>
<html>
<head>
<title>Book Seats</title>
</head>
<body>
<h1>Book Seats</h1>
<form action="bookNow.jsp" method="post">
<input type="hidden" name="bus_id" value="<%= busId %>">
Number of seats: <input type="number" name="num_seats"><br>
<input type="submit" value="Book">
</form>
</body>
</html>
<%
}
%>