<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%
    String username = (String) session.getAttribute("uname");
    if (username == null) {
        response.sendRedirect("login.html");
        return;
    }

    int classId = Integer.parseInt(request.getParameter("class_id"));

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/school_management", "root", "password");

    // Get student ID
    String studentQuery = "SELECT student_id FROM students WHERE student_id = (SELECT user_id FROM users WHERE username = ?)";
    PreparedStatement studentStmt = con.prepareStatement(studentQuery);
    studentStmt.setString(1, username);
    ResultSet studentRs = studentStmt.executeQuery();
    studentRs.next();
    int studentId = studentRs.getInt("student_id");

    // Enroll the student in the selected class
    String enrollQuery = "INSERT INTO enrollments (student_id, class_id) VALUES (?, ?)";
    PreparedStatement enrollStmt = con.prepareStatement(enrollQuery);
    enrollStmt.setInt(1, studentId);
    enrollStmt.setInt(2, classId);

    int result = enrollStmt.executeUpdate();

    if (result > 0) {
        response.sendRedirect("student_dashboard.jsp");
    } else {
        out.println("Error enrolling in class");
    }

    con.close();
%>

