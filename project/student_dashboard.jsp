<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%
    String uname = request.getParameter("uname");
    if (uname == null) {
        response.sendRedirect("login.html");
        return;
    }
    session.setAttribute("uname",uname);

    Connection con = null;
    PreparedStatement studentStmt = null;
    ResultSet studentRs = null;
    PreparedStatement enrollmentStmt = null;
    ResultSet enrollmentRs = null;
    Statement classStmt = null; // Changed from PreparedStatement to Statement
    ResultSet classRs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/school_management", "root", "root");

        // Get student details
        String studentQuery = "SELECT * FROM students WHERE student_id = (SELECT user_id FROM users WHERE username = ? LIMIT 1)";
        studentStmt = con.prepareStatement(studentQuery);
        studentStmt.setString(1, uname);
        studentRs = studentStmt.executeQuery();

        if (!studentRs.next()) {
            out.println("No student found with the given username.");
            return; // Exit the script
        }

        String studentName = studentRs.getString("name");
        int studentId = studentRs.getInt("student_id");
        

        // Get enrolled classes
        String enrollmentQuery = "SELECT classes.class_name, grades.grade FROM enrollments " +
                                 "JOIN classes ON enrollments.class_id = classes.class_id " +
                                 "LEFT JOIN grades ON enrollments.student_id = grades.student_id AND enrollments.class_id = grades.class_id " +
                                 "WHERE enrollments.student_id = ?";
        enrollmentStmt = con.prepareStatement(enrollmentQuery);
        enrollmentStmt.setInt(1, studentId);
        enrollmentRs = enrollmentStmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Student Dashboard</title>
</head>
<body>
    <h2>Welcome, <%= studentName %></h2>
    <h3>Enrolled Classes</h3>
    <table>
        <tr>
            <th>Class Name</th>
            <th>Grade</th>
        </tr>
        <%
            while (enrollmentRs.next()) {
                String className = enrollmentRs.getString("class_name");
                String grade = enrollmentRs.getString("grade");
        %>
        <tr>
            <td><%= className %></td>
            <td><%= grade != null ? grade : "Not Graded" %></td>
        </tr>
        <%
            }
        %>
    </table>

    <h3>Enroll in a New Class</h3>
    <form action="enroll.jsp" method="post">
        <label for="class_id">Class:</label>
        <select id="class_id" name="class_id" required>
            <%
                // Get available classes
                String classQuery = "SELECT * FROM classes";
                classStmt = con.createStatement(); // Create a Statement object
                classRs = classStmt.executeQuery(classQuery);

                while (classRs.next()) {
                    int classId = classRs.getInt("class_id");
                     session.setAttribute("classId",classId);
                    String className = classRs.getString("class_name");
            %>
            <option value="<%= classId %>"><%= className %></option>
           
            <%
                }
            %>
        </select>
        <button type="submit">Enroll</button>
    </form>
</body>
</html>
<%
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        try { if (studentRs != null) studentRs.close(); } catch (Exception e) { }
        try { if (studentStmt != null) studentStmt.close(); } catch (Exception e) { }
        try { if (enrollmentRs != null) enrollmentRs.close(); } catch (Exception e) { }
        try { if (enrollmentStmt != null) enrollmentStmt.close(); } catch (Exception e) { }
        try { if (classRs != null) classRs.close(); } catch (Exception e) { }
        try { if (classStmt != null) classStmt.close(); } catch (Exception e) { }
        try { if (con != null) con.close(); } catch (Exception e) { }
    }
%>

