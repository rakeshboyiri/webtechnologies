<%@ page import="java.sql.*" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/school_management", "root", "root");
        Statement stmt = con.createStatement();
        String sql = "SELECT * FROM users WHERE username='" + username + "' AND password='" + password + "'";
        ResultSet rs = stmt.executeQuery(sql);

        if (rs.next()) {
            String role = rs.getString("role");
            if (role.equals("admin")) {
                response.sendRedirect("admin_dashboard.jsp");
            } else if (role.equals("teacher")) {
                response.sendRedirect("teacher_dashboard.jsp");
            } else if (role.equals("student")) {
               response.sendRedirect("student_dashboard.jsp?uname=" + username);


            }
        } else {
            out.println("Invalid username or password");
        }
        con.close();
    } catch (Exception e) {
        out.println("Database connection error: " + e.getMessage());
    }
%>

