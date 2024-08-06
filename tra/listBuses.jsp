<%@ include file="DBConn.jsp" %>
<html>
<head>
    <title>Available Buses</title>
</head>
<body>
    <%
        int source = Integer.parseInt(request.getParameter("source"));
        int destination = Integer.parseInt(request.getParameter("destination"));

        Connection conn = getConnection();
        String query = "SELECT * FROM buses WHERE source_id = ? AND destination_id = ?";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setInt(1, source);
        pstmt.setInt(2, destination);
        ResultSet rs = pstmt.executeQuery();
    %>
    <table border="1">
        <tr>
            <th>Bus ID</th>
            <th>Vacant Seats</th>
            <th>Action</th>
        </tr>
        <%
            while (rs.next()) {
                int busId = rs.getInt("bus_id");
                int vacantSeats = rs.getInt("vacant_seats");
        %>
        <tr>
            <td><%= busId %></td>
            <td><%= vacantSeats %></td>
            <td><a href="bookBus.jsp?busId=<%= busId %>">Book Now</a></td>
        </tr>
        <%
            }
            conn.close();
        %>
    </table>
</body>
</html>

