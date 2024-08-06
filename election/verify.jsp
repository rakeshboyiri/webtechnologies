<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "election";
String userid = "root";
String password = "root";

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;

try {
    Class.forName(driver);
    connection = DriverManager.getConnection(connectionUrl + database, userid, password);
    statement = connection.createStatement();

    String username = request.getParameter("username");
    String pwd= request.getParameter("password");

    // Check if the user already exists
    String checkUserQuery = "SELECT * FROM citizens WHERE cname='" + username + "'";
    resultSet = statement.executeQuery(checkUserQuery);

    if (resultSet.next()) {
        // User already exists
        response.sendRedirect("signup.jsp?msg=User already exists");
    } else {
        // Insert new user into database
        String insertQuery = "INSERT INTO citizens (cname, pwd, vote_status) VALUES ('" + username + "', '" + pwd + "', 0)";
        int rowsAffected = statement.executeUpdate(insertQuery);

        if (rowsAffected > 0) {
            // Redirect to success page or login page
            response.sendRedirect("login.jsp?msg=Signup successful. Please login");
        } else {
            // Error occurred while inserting
            response.sendRedirect("signup.jsp?msg=Error signing up. Please try again");
        }
    }

} catch (Exception e) {
    out.println(e.getMessage());
} finally {
    try { resultSet.close(); } catch (Exception e) { /* ignored */ }
    try { statement.close(); } catch (Exception e) { /* ignored */ }
    try { connection.close(); } catch (Exception e) { /* ignored */ }
}
%>

