<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Compose Mail</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            margin: 50px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        h1 {
            font-size: 40px;
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }

        .myTextBox {
            width: 100px;
            padding: 15px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 24px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1) inset;
            transition: border-color 0.3s;
        }

        .myTextBox:focus {
            border-color: #764ba2;
        }

        .myButton {
            background-color: #764ba2;
            color: #fff;
            padding: 15px 25px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 24px;
            transition: background-color 0.3s;
            margin-top: 10px;
        }

        .myButton:hover {
            background-color: #667eea;
        }

        table.navTable {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            text-align: center;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        table.navTable td, table.navTable th {
            border: 1px solid #ccc;
            padding: 20px;
            font-size: 24px;
        }

        table.navTable a {
            text-decoration: none;
            color: #333;
        }

        table.navTable a:hover {
            color: #764ba2;
        }
        .myTextBoxd{
        width: 300px;
            padding: 15px;
            margin: 10px 0px 0px 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 24px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1) inset;
            transition: border-color 0.3s;
        }
        .myTextBoxt{
          width: 400px;
            padding: 15px;
            margin: 10px 0px 0px 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 24px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1) inset;
            transition: border-color 0.3s;
        }
    </style>
</head>
<body>
    <%
        String str = request.getParameter("msg");
        String emailid = "";
        if (session.getAttribute("emailid") != null)
            emailid = session.getAttribute("emailid").toString();
        if (str != null)
            out.println("<font size=32 color=red>" + str + "</font>");
    %>
    <table class="navTable" border="1">
        <tr>
            <td><a href="inbox.jsp">Inbox</a></td>
            <td><a href="SentBox.jsp">Sentbox</a></td>
            <td><a href="ComposeMail.jsp">ComposeMail</a></td>
            <td><a href="login.jsp?msg='logged out'">Logout</a></td>
        </tr>
    </table>
    <div class="container">
        <h1>Compose Mail</h1>
        <form name="f1" action="InsertMail.jsp">
            <table align="center" width="100%" border="0">
                <tr>
                    <td class="myTextBox" style="border:none;">From:</td>
                    <td><input type="text" class="myTextBoxd" name="mfrom" id="mfrom" value="<%= emailid %>" readonly></td>
                </tr>
                <tr>
                    <td class="myTextBox" style="border:none;">To:</td>
                    <td><input type="text" class="myTextBoxd" name="mto" id="mto"></td>
                </tr>
                <tr>
                    <td class="myTextBox" style="border:none;">Subject:</td>
                    <td><input type="text" class="myTextBoxd" name="subj" id="subj"></td>
                </tr>
                <tr>
                    <td class="myTextBox" style="border:none;">Text:</td>
                    <td><textarea name="mtext" id="mtext" class="myTextBoxt" rows="10"></textarea></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input type="submit" value="Send Mail" class="myButton">&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="reset" value="Reset" class="myButton">&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="button" value="Back" class="myButton">
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>

