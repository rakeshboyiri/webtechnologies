<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Form</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea, #764ba2);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            padding: 40px;
            width: 400px;
            text-align: center;
        }

        .container h1 {
            font-size: 24px;
            color: #764ba2;
            margin-bottom: 20px;
        }

        .container p {
            font-size: 16px;
            color: #555;
            margin-bottom: 10px;
        }

        .myTextbox {
            width: calc(100% - 20px);
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 25px;
            font-size: 18px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1) inset;
            transition: border-color 0.3s;
        }

        .myTextbox:focus {
            border-color: #764ba2;
        }

        .container input[type="submit"],
        .container input[type="reset"] {
            background: linear-gradient(135deg, #764ba2, #667eea);
            color: white;
            padding: 12px 25px;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            font-size: 18px;
            transition: background 0.3s;
            margin-top: 10px;
        }

        .container input[type="submit"]:hover,
        .container input[type="reset"]:hover {
            background: linear-gradient(135deg, #667eea, #764ba2);
        }

        .error-msg {
            font-size: 18px;
            color: #f44336;
            margin-top: 10px;
        }
        
        .signup-link {
            margin-top: 15px;
            display: block;
            font-size: 16px;
            color: #764ba2;
            text-decoration: none;
        }

        .signup-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <%
            String str = request.getParameter("msg");
            if(str != null) {
                out.println("<p class='error-msg'>" + str + "</p>");
            }
        %>
        <h1>Login</h1>
        <form name="f1" action="validateLogin.jsp">
            <p>Email ID</p>
            <input type="email" name="uname" id="uname" class="myTextbox" required>
            <p>Password</p>
            <input type="password" name="pwd" id="pwd" class="myTextbox" required>
            <br><br>
            <input type="submit" value="Submit">
            <input type="reset" value="Reset">
        </form>
        <a href="signup.jsp" class="signup-link">Don't have an account? Sign up here</a>
    </div>
</body>
</html>

