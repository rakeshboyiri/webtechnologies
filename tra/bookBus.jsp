<%@ include file="DBConn.jsp" %>
<html>
<head>
    <title>Book Bus</title>
</head>
<body>
    <%
        int busId = Integer.parseInt(request.getParameter("busId"));
    %>
    <form action="confirmBooking.jsp" method="post">
        <input type="hidden" name="busId" value="<%= busId %>">
        <label for="numSeats">Number of Seats:</label>
        <input type="number" name="numSeats" id="numSeats" required>
        <input type="submit" value="Book Now">
    </form>
</body>
</html>

