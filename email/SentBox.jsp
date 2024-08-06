<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #eef2f5;
            margin: 0;
            padding: 0;
        }
        table {
            border-collapse: separate;
            border-spacing: 0 10px;
            margin: 20px auto;
            width: 90%;
            background-color: #fff;
        }
        th, td {
            font-size: 18px;
            padding: 15px;
            text-align: left;
        }
        th {
            background-color: #007BFF;
            color: white;
            border: none;
        }
        td {
            border: none;
            border-bottom: 1px solid #ddd;
        }
        tr:hover td {
            background-color: #f9f9f9;
        }
        .myCheckBox {
            font-size: 18px;
            width: 20px;
            margin: 0;
        }
        .myButton {
            font-size: 18px;
            padding: 10px 20px;
            background-color: #FF0000;
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .myButton:hover {
            background-color: #cc0000;
        }
        .navbar {
            display: flex;
            justify-content: center;
            background-color: #343a40;
            padding: 10px 0;
        }
        .navbar a {
            color: white;
            padding: 14px 20px;
            text-decoration: none;
            text-align: center;
            transition: background-color 0.3s ease;
        }
        .navbar a:hover {
            background-color: #495057;
        }
        h1 {
            text-align: center;
            color: #343a40;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <a href="inbox.jsp">Inbox</a>
        <a href="SentBox.jsp">Sentbox</a>
        <a href="ComposeMail.jsp">ComposeMail</a>
        <a href="logout.jsp">Logout</a>
    </div>
    <br>
    <center><h1>My Sentbox</h1></center><br>
    <form action="delsent" method="get">
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
                String sql = "select * from mail where mfrom='" + user_id + "' and sentbox=1";
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

