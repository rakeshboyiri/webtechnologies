<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*" %>
<%
    String roomId = request.getParameter("roomb");
    if (roomId == null) {
        out.println("Room ID not received.");
        return;
    }

    if (request.getMethod().equalsIgnoreCase("POST")) {
        String username = request.getParameter("username");
        if (username == null || username.trim().isEmpty()) {
            out.println("Username is required.");
            return;
        }

        String url = "jdbc:mysql://localhost:3306/hotel_management";
        String user = "root";
        String password = "root";
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);
            String updateQuery = "UPDATE rooms SET status = 'booked', booked_by = ? WHERE id = ?";
            pstmt = conn.prepareStatement(updateQuery);
            pstmt.setString(1, username);
            pstmt.setInt(2, Integer.parseInt(roomId));
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
    <title>Room Booking</title>
</head>
<body>
    <h1>Room Booking</h1>
    <form method="POST">
        <input type="hidden" name="roomId" value="<%= roomId %>" />
        <p>Booking Room ID: <%= roomId %></p>
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required>
        <button type="submit">Confirm Booking</button>
    </form>
</body>
</html>

