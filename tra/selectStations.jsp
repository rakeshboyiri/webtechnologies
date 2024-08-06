<%@ include file="DBConn.jsp" %>
<html>
<head>
    <title>Select Stations</title>
</head>
<body>
    <form action="listBuses.jsp" method="post">
        <label for="source">Source Station:</label>
        <select name="source" id="source">
            <%
                Connection conn = getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM stations");
                while (rs.next()) {
                    out.println("<option value='" + rs.getInt("station_id") + "'>" + rs.getString("name") + "</option>");
                }
                conn.close();
            %>
        </select>
        <label for="destination">Destination Station:</label>
        <select name="destination" id="destination">
            <%
                conn = getConnection();
                stmt = conn.createStatement();
                rs = stmt.executeQuery("SELECT * FROM stations");
                while (rs.next()) {
                    out.println("<option value='" + rs.getInt("station_id") + "'>" + rs.getString("name") + "</option>");
                }
                conn.close();
            %>
        </select>
        <input type="submit" value="Find Buses">
    </form>
</body>
</html>

