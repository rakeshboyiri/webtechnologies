<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*" %>
<%
    String roomId = request.getParameter("roomu");
    if (roomId == null) {
        out.println("Room ID not received.");
        return;
    }

    String bookedBy = "";
    String url = "jdbc:mysql://localhost:3306/hotel_management";
    String user = "root";
    String password = "root";
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);
        String selectQuery = "SELECT booked_by FROM rooms WHERE id = ?";
        pstmt = conn.prepareStatement(selectQuery);
        pstmt.setInt(1, Integer.parseInt(roomId));
        rs = pstmt.executeQuery();

        if (rs.next()) {
            bookedBy = rs.getString("booked_by");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
        if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
        if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
    }

    if (request.getMethod().equalsIgnoreCase("POST")) {
        try {
            conn = DriverManager.getConnection(url, user, password);
            String updateQuery = "UPDATE rooms SET status = 'vacant', booked_by = NULL WHERE id = ?";
            pstmt = conn.prepareStatement(updateQuery);
            pstmt.setInt(1, Integer.parseInt(roomId));
            pstmt.executeUpdate();

            response.sendRedirect("index.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
            if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Room Status</title>
</head>
<body>
    <h1>Update Room Status</h1>
    <form method="POST">
        <input type="hidden" name="roomId" value="<%= roomId %>" />
        <p>Updating Room ID: <%= roomId %></p>
        <p>Booked By: <%= bookedBy %></p>
        <button type="submit">Mark as Vacant</button>
    </form>
</body>
</html>

