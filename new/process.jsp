<%@ page import="java.sql.*" %>
<%
    // Retrieve parameters from the signup form
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String mobile = request.getParameter("mobile");

    // Database connection details
    String driver = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String database = "emailsoftware";
    String userid = "root";
    String dbpassword = "root";

    try {
        // Load and register the JDBC driver
        Class.forName(driver);

        // Establish the database connection
        Connection con = DriverManager.getConnection(connectionUrl + database, userid, dbpassword);

        // Prepare the SQL statement for insertion
        String query = "INSERT INTO users (name, emailid, pwd, mobile, type) VALUES (?, ?, ?, ?, 'user')";
        PreparedStatement pst = con.prepareStatement(query);

        // Set parameters for the prepared statement
        pst.setString(1, name);
        pst.setString(2, email);
        pst.setString(3, password);
        pst.setString(4, mobile);

        // Execute the insert operation
        int rowsAffected = pst.executeUpdate();

        // Check if the insertion was successful
        if (rowsAffected > 0) {
            response.sendRedirect("login.jsp?msg=Signup successful! Please login with your credentials.");
        } else {
            out.println("Signup failed. Please try again.");
        }

        // Close resources
        pst.close();
        con.close();
    } catch (Exception e) {
        out.println(e.getMessage());
    }
%>

