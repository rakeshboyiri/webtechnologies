<%@ include file="DBConn.jsp" %>
<html>
<head>
    <title>Confirm Booking</title>
</head>
<body>
    <%
        int busId = Integer.parseInt(request.getParameter("busId"));
        int numSeats = Integer.parseInt(request.getParameter("numSeats"));

        Connection conn = getConnection();
        String query = "UPDATE buses SET vacant_seats = vacant_seats - ? WHERE bus_id = ?";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setInt(1, numSeats);
        pstmt.setInt(2, busId);
        pstmt.executeUpdate();

        query = "INSERT INTO bookings (bus_id, num_seats) VALUES (?, ?)";
        pstmt = conn.prepareStatement(query);
        pstmt.setInt(1, busId);
        pstmt.setInt(2, numSeats);
        pstmt.executeUpdate();

        conn.close();
    %>
    <p>Booking Confirmed!</p>
    <a href="selectStations.jsp">Book Another</a>
</body>
</html>

