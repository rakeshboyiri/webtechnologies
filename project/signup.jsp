<%@ page import="java.sql.*" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String role = request.getParameter("role");
    int result = 0;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/school_management", "root", "root");
        Statement stmt = con.createStatement();

        if ("student".equals(role)) {
            // Insert into users table
            String userInsertQuery = "INSERT INTO users (username, password, role) VALUES ('" + username + "', '" + password + "', '" + role + "')";
            result = stmt.executeUpdate(userInsertQuery);

            // Retrieve the generated user_id
            ResultSet rs = stmt.executeQuery("SELECT * FROM users WHERE username='" + username + "'");
            if (rs.next()) {
                int userId = rs.getInt("user_id");

                // Insert into students table
                String studentInsertQuery = "INSERT INTO students (student_id, name) VALUES (" + userId + ", '" + username + "')";
                stmt.executeUpdate(studentInsertQuery);
            }
        }

        if (result > 0) {
            response.sendRedirect("login.html");
        } else {
            out.println("Error in registration");
        }

        con.close();
    } catch (Exception e) {
        out.println("Database connection error: " + e.getMessage());
    }
%>

