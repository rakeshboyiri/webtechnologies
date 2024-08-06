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
        .myTextBox {
            font-size: 18px;
            padding: 10px;
            width: calc(100% - 24px); /* Adjusting for padding */
        }
        textarea.myTextBox {
            width: calc(100% - 24px); /* Adjusting for padding */
            height: 200px; /* Specific height for textarea */
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
        .errorMessage {
            font-size: 32px;
            color: red;
            text-align: center;
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
    <br><br><br><br><br><br><br><br>
    <%
    String str = request.getParameter("msg");
    String emailid = "";
    if (session.getAttribute("emailid") != null)
        emailid = session.getAttribute("emailid").toString();
    if (str != null)
        out.println("<div class='errorMessage'>" + str + "</div>");
    %>
    <br>
    <form name="f1" action="InsertMail.jsp">
        <table>
            <tr>
                <td class="myTextBox">From:</td>
                <td><input type="text" class="myTextBox" name="mfrom" id="mfrom" value="<%= emailid %>" readonly></td>
            </tr>
            <tr>
                <td class="myTextBox">To:</td>
                <td><input type="text" class="myTextBox" name="mto" id="mto" required></td>
            </tr>
            <tr>
                <td class="myTextBox">Subject:</td>
                <td><input type="text" class="myTextBox" name="subj" id="subj"></td>
            </tr>
            <tr>
                <td class="myTextBox">Text:</td>
                <td><textarea name="mtext" id="mtext" class="myTextBox"></textarea></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="submit" value="SendMail" class="myButton">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="reset" value="Reset" class="myButton">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="button" value="Back" class="myButton">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

