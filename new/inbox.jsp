<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inbox</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 900px;
            margin: 20px auto;
            background-color: #fff;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            padding: 20px;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-bottom: 20px;
            border-bottom: 1px solid #ddd;
        }

        .header h1 {
            font-size: 28px;
            color: #764ba2;
        }

        .header a {
            text-decoration: none;
            color: #666;
            font-size: 18px;
            padding: 8px 16px;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }

        .header a:hover {
            background-color: #f0f0f0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px;
            text-align: left;
            font-size: 18px;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #764ba2;
            color: white;
            font-weight: bold;
        }

        td a {
            text-decoration: none;
            color: #333;
            font-weight: bold;
        }

        td a:hover {
            color: #764ba2;
        }

        .delete-button {
            background-color: #764ba2;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .delete-button:hover {
            background-color: #667eea;
        }

        .center {
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>My Inbox</h1>
            <a href="SentBox.jsp">Sentbox</a>
            <a href="ComposeMail.jsp">Compose Mail</a>
            <a href="login.jsp?msg='Logged Out'">Logout</a>
        </div>

        <form action="DeleteInbox.jsp" method="post">
            <table>
                <thead>
                    <tr>
                        <th>From</th>
                        <th>Subject</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        String user_id = session.getAttribute("emailid").toString();
                        String driver = "com.mysql.jdbc.Driver";
                        String connectionUrl = "jdbc:mysql://localhost:3306/";
                        String database = "emailsoftware";
                        String userid = "root";
                        String password = "root";
                        Connection connection = null;
                        Statement statement = null;
                        ResultSet resultSet = null;
                        try {
                            Class.forName(driver);
                            connection = DriverManager.getConnection(connectionUrl + database, userid, password);
                            statement = connection.createStatement();
                            String sql = "select * from mail where mto='" + user_id + "' and inbox=1";
                            resultSet = statement.executeQuery(sql);
                            while (resultSet.next()) {
                                int mid = resultSet.getInt("mid");
                                String from = resultSet.getString("mfrom");
                                String subject = resultSet.getString("subject");
                    %>
                    <tr>
                        <td><%= from %></td>
                        <td><a href="ReadMail1.jsp?mid=<%= mid %>"><%= subject %></a></td>
                        <td class="center">
                            <input type="checkbox" name="deleteList" value="<%= mid %>">
                        </td>
                    </tr>
                    <%
                            }
                        } catch (Exception e) {
                            out.println(e.getMessage());
                        } finally {
                            try {
                                if (resultSet != null) resultSet.close();
                                if (statement != null) statement.close();
                                if (connection != null) connection.close();
                            } catch (SQLException e) {
                                out.println(e.getMessage());
                            }
                        }
                    %>
                </tbody>
            </table>
            <div class="center">
                <input type="submit" class="delete-button" value="Delete">
            </div>
        </form>
    </div>
</body>
</html>

