<%@include file="DBConn.jsp"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
int bid = Integer.parseInt(request.getParameter("abc"));
int bcount = Integer.parseInt(request.getParameter("bcount"));
%>

<html>
<head>
<style>
* {
    text-align: center;
}
th, td {
    font-size: 32px;
}
</style>
</head>
<body>
<%

try {


    connection = DriverManager.getConnection(connectionUrl+database, userid, password);
    statement=connection.createStatement();
    String sql = "SELECT seats FROM sche WHERE bus_id=" + bid;
    resultSet = statement.executeQuery(sql);

    int currentVacantSeats = 0;
    if (resultSet.next()) {
        currentVacantSeats = resultSet.getInt("seats");
    }

    int newVacantSeats = currentVacantSeats - bcount;
    if (newVacantSeats >= 0) {
        String updateSql = "UPDATE sche SET seats=" + newVacantSeats + " WHERE bus_id=" + bid;
        statement.executeUpdate(updateSql);
        out.println("Seats booked successfully. Remaining seats: " + newVacantSeats);
    } else {
        out.println("Not enough vacant seats.");
    }
} catch (Exception e) {
    out.println(e.getMessage());
} finally {
    try {
        if (resultSet != null) resultSet.close();
        if (statement != null) statement.close();
        if (connection != null) connection.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
}
%>
<br/><br/>
<a href="index.jsp">Book More</a>
</body>
</html>

