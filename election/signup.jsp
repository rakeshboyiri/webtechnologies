<!DOCTYPE html>
<html>
<head>
  <title>Sign Up</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: linear-gradient(135deg, #89f7fe 0%, #66a6ff 100%);
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }

    .container {
      background: white;
      border-radius: 15px;
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
      padding: 40px;
      text-align: center;
      width: 300px;
    }

    .container h1 {
      font-size: 24px;
      color: #4caf50;
      margin-bottom: 20px;
    }

    .container p {
      font-size: 16px;
      margin-bottom: 10px;
    }

    .container input[type="text"],
    .container input[type="password"] {
      width: calc(100% - 20px);
      padding: 10px;
      margin: 10px 0;
      border: 1px solid #ccc;
      border-radius: 5px;
      font-size: 14px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1) inset;
    }

    .container input[type="submit"] {
      background: linear-gradient(135deg, #667eea, #764ba2);
      color: white;
      padding: 12px 25px;
      border: none;
      border-radius: 25px;
      cursor: pointer;
      font-size: 16px;
      transition: background 0.3s;
    }

    .container input[type="submit"]:hover {
      background: linear-gradient(135deg, #764ba2, #667eea);
    }
    
    .error-msg {
      font-size: 18px;
      color: red;
      margin-bottom: 20px;
    }
    
    .login-link {
      margin-top: 20px;
      font-size: 14px;
    }
    
    .login-link a {
      color: #2196f3;
      text-decoration: none;
      font-weight: bold;
      transition: color 0.3s;
    }
    
    .login-link a:hover {
      color: #0d47a1;
    }
  </style>
</head>
<body>
  <div class="container">
    <%
      String str = request.getParameter("msg");
      if (str != null) {
        out.println("<p class='error-msg'>" + str + "</p>");
      }
    %>
    <h1>Sign Up</h1>
    <form action="verify.jsp" method="post">
      <p>Username</p>
      <input type="text" name="username" required>
      <p>Password</p>
      <input type="password" name="password" required>
      <br><br>
      <input type="submit" value="Sign Up">
    </form>
    <div class="login-link">
      <p>Already have an account? <a href="login.jsp">Log In</a></p>
    </div>
  </div>
</body>
</html>

