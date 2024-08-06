<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Room Vacancy Status</title>
    <style>
        .room {
            margin: 20px;
            cursor: pointer;
        }
    </style>
    <script>
        function handleClick(roomId, status) {
            // Debug: show the roomId value
            console.log(roomId);

            if (status === 'vacant') {
               // window.location.href = `booking.jsp?roomId=${roomId}`;
              document.f1.roomb.value=roomId;
               f1.submit();
            } else {
              //  window.location.href = `updateStatus.jsp?roomId=${roomId}`;
              document.f2.roomu.value=roomId;
               f2.submit();
            }
        }
    </script>
</head>
<body>
    <h1>Room Vacancy Status</h1>
    <div>
        <%
            String url = "jdbc:mysql://localhost:3306/hotel_management";
            String user = "root";
            String password = "root";
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(url, user, password);
                stmt = conn.createStatement();
                String query = "SELECT id, room_number, status FROM rooms";
                rs = stmt.executeQuery(query);

                while (rs.next()) {
                    int roomId = rs.getInt("id");
                    String roomNumber = rs.getString("room_number");
                    String status = rs.getString("status");
                    String imageUrl = status.equals("vacant") ? "images/vacant.png" : "images/booked.png";
        %>
            <img src="<%= imageUrl %>" class="room" alt="<%= status %>" onclick="handleClick('<%= roomId %>', '<%= status %>')" />
            
           
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
                if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
            }
        %>
    </div>
     <form name="f1" action="booking.jsp">
              <input type="hidden" name="roomb" id="roomb" value="">
            </form>
            
            <form name="f2" action="updateStatus.jsp">
              <input type="hidden" name="roomu" id="roomu" value="">
            </form>
</body>
</html>

