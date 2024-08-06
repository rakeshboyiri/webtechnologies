<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.html");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
   <style type="text/css">
   body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 20px;
    background-color: #f2f2f2;
}

h2, h3 {
    text-align: center;
}

form {
    background-color: #fff;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    margin: 20px auto;
    max-width: 400px;
}

label {
    display: block;
    margin-bottom: 5px;
}

input, select, button {
    width: 100%;
    padding: 10px;
    margin-bottom: 10px;
}

button {
    background-color: #4CAF50;
    color: #fff;
    border: none;
    cursor: pointer;
}

button:hover {
    background-color: #45a049;
}

a {
    display: block;
    text-align: center;
    margin-top: 20px;
    color: #000;
    text-decoration: none;
}

a:hover {
    text-decoration: underline;
}

   </style>
</head>
<body>
    <h2>Admin Dashboard</h2>
    <h3>Manage Students</h3>
    <form action="add_student.jsp" method="post">
        <label for="student_name">Name:</label>
        <input type="text" id="student_name" name="student_name" required>
        <br>
        <label for="dob">Date of Birth:</label>
        <input type="date" id="dob" name="dob" required>
        <br>
        <label for="class_id">Class:</label>
        <select id="class_id" name="class_id" required>
            <%
                // Get available classes
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/school_management", "root", "password");
                String classQuery = "SELECT * FROM classes";
                Statement classStmt = con.createStatement();
                ResultSet classRs = classStmt.executeQuery(classQuery);

                while (classRs.next()) {
                    int classId = classRs.getInt("class_id");
                    String className = classRs.getString("class_name");
            %>
            <option value="<%= classId %>"><%= className %></option>
            <%
                }
                con.close();
            %>
        </select>
        <br>
        <button type="submit">Add Student</button>
    </form>

    <h3>Manage Teachers</h3>
    <form action="add_teacher.jsp" method="post">
        <label for="teacher_name">Name:</label>
        <input type="text" id="teacher_name" name="teacher_name" required>
        <br>
        <label for="subject">Subject:</label>
        <input type="text" id="subject" name="subject" required>
        <br>
        <button type="submit">Add Teacher</button>
    </form>

    <h3>Manage Classes</h3>
    <form action="add_class.jsp" method="post">
        <label for="class_name">Class Name:</label>
        <input type="text" id="class_name" name="class_name" required>
        <br>
        <label for="teacher_id">Teacher:</label>
        <select id="teacher_id" name="teacher_id" required>
            <%
                // Get available teachers
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/school_management", "root", "password");
                String teacherQuery = "SELECT * FROM teachers";
                Statement teacherStmt = con.createStatement();
                ResultSet teacherRs = teacherStmt.executeQuery(teacherQuery);

                while (teacherRs.next()) {
                    int teacherId = teacherRs.getInt("teacher_id");
                    String teacherName = teacherRs.getString("name");
            %>
            <option value="<%= teacherId %>"><%= teacherName %></option>
            <%
                }
                con.close();
            %>
        </select>
        <br>
        <button type="submit">Add Class</button>
    </form>

    <a href="logout.jsp">Logout</a>
</body>
</html>

