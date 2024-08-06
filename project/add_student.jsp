<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.html");
        return;
    }

    String studentName = request.getParameter("student_name");
    String dob = request.getParameter("dob");
    int classId = Integer.parseInt(request.getParameter("class_id"));

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/school_management", "root", "password");
        
        // Add student to students table
        String addStudentQuery = "INSERT INTO students (name, dob, class_id) VALUES (?, ?, ?)";
        PreparedStatement addStudentStmt = con.prepareStatement(addStudentQuery);
        addStudentStmt.setString(1, studentName);
        addStudentStmt.setDate(2, java.sql.Date.valueOf(dob));
        addStudentStmt.setInt(3, classId);

        int result = addStudentStmt.executeUpdate();

        if (result > 0) {
            out.println("Student added successfully!");
        } else {
            out.println("Error adding student.");
        }
        con.close();
    } catch (Exception e) {
        out.println("Database connection error: " + e.getMessage());
    }
%>
<a href="admin_dashboard.jsp">Back to Admin Dashboard</a>

