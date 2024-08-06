<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.html");
        return;
    }

    String className = request.getParameter("class_name");
    int teacherId = Integer.parseInt(request.getParameter("teacher_id"));

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/school_management", "root", "password");
        
        // Add class to classes table
        String addClassQuery = "INSERT INTO classes (class_name, teacher_id) VALUES (?, ?)";
        PreparedStatement addClassStmt = con.prepareStatement(addClassQuery);
        addClassStmt.setString(1, className);
        addClassStmt.setInt(2, teacherId);

        int result = addClassStmt.executeUpdate();

        if (result > 0) {
            out.println("Class added successfully!");
        } else {
            out.println("Error adding class.");
        }
        con.close();
    } catch (Exception e) {
        out.println("Database connection error: " + e.getMessage());
    }
%>
<a href="admin_dashboard.jsp">Back to Admin Dashboard</a>

