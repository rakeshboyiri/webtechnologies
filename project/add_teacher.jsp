<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.html");
        return;
    }

    String teacherName = request.getParameter("teacher_name");
    String subject = request.getParameter("subject");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/school_management", "root", "password");
        
        // Add teacher to teachers table
        String addTeacherQuery = "INSERT INTO teachers (name, subject) VALUES (?, ?)";
        PreparedStatement addTeacherStmt = con.prepareStatement(addTeacherQuery);
        addTeacherStmt.setString(1, teacherName);
        addTeacherStmt.setString(2, subject);

        int result = addTeacherStmt.executeUpdate();

        if (result > 0) {
            out.println("Teacher added successfully!");
        } else {
            out.println("Error adding teacher.");
        }
        con.close();
    } catch (Exception e) {
        out.println("Database connection error: " + e.getMessage());
    }
%>
<a href="admin_dashboard.jsp">Back to Admin Dashboard</a>

