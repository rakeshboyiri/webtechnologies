<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
    
          
</head>
<body>

    <br>
    <form action="delinbox" method="get">
        <table>
            <tr>
                <th>From</th>
                <th>Subject</th>
                <th><input type="submit" class="myButton" value="Delete"></th>
            </tr>
            <%
            String id = request.getParameter("uname");
            String driver = "com.mysql.jdbc.Driver";
            String connectionUrl = "jdbc:mysql://localhost:3306/";
            String database = "emailsoftware";
            String userid = "root";
            String password = "root";
            try {
                Class.forName(driver);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            Connection connection = null;
            Statement statement = null;
            ResultSet resultSet = null;
            String user_id = session.getAttribute("uname").toString();
            String user_pwd = request.getParameter("pwd");
            int flag = 0;
            try {
                connection = DriverManager.getConnection(connectionUrl + database, userid, password);
                statement = connection.createStatement();
                String sql = "select * from mail where mto='" + user_id + "' and inbox=1";
                resultSet = statement.executeQuery(sql);
                int mid;
                while (resultSet.next()) {
                    mid = Integer.parseInt(resultSet.getString("mid"));
            %>
            <tr>
                <td><%= resultSet.getString("mfrom") %></td>
                <td><a href="ReadMail1.jsp?mid=<%= mid %>"><%= resultSet.getString("subject") %></a></td>
                <td align="center"><input type="checkbox" class="myCheckBox" name="deleteList" value="<%= mid %>"></td>
            </tr>
            <%
                }
            %>
        </table>
    </form>
    <%
        connection.close();
    } catch (Exception e) {
        out.println(e.getMessage());
    }
    %>
</body>
</html>

