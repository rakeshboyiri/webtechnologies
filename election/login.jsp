<!DOCTYPE html>
<html>
  <head>
    <title>Login</title>
    <style>
      body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(135deg, #ff9a9e 0%, #fad0c4 99%, #fad0c4 100%);
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
      }

      .login-container {
        background: white;
        border-radius: 15px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        padding: 40px;
        width: 300px;
        text-align: center;
      }

      .login-container p {
        font-size: 16px;
        color: #555;
        margin: 10px 0;
      }

      .login-container input[type="text"],
      .login-container input[type="password"] {
        width: calc(100% - 22px);
        padding: 12px;
        margin: 10px 0;
        border: 1px solid #ccc;
        border-radius: 25px;
        font-size: 14px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1) inset;
      }

      .login-container input[type="submit"] {
        background: linear-gradient(135deg, #667eea, #764ba2);
        color: white;
        padding: 12px 25px;
        border: none;
        border-radius: 25px;
        cursor: pointer;
        font-size: 16px;
        transition: background 0.3s;
      }

      .login-container input[type="submit"]:hover {
        background: linear-gradient(135deg, #764ba2, #667eea);
      }

      .error-msg {
        font-size: 18px;
        color: red;
        margin-bottom: 20px;
      }

      .signup-link {
        font-size: 14px;
        margin-top: 10px;
      }

      .signup-link a {
        color: #2196f3;
        text-decoration: none;
        font-weight: bold;
        transition: color 0.3s;
      }

      .signup-link a:hover {
        color: #0d47a1;
      }
    </style>
  </head>
  <body>
    <div class="login-container">
      <%
        String str = request.getParameter("msg");
        if (str != null) {
          out.println("<p class='error-msg'>" + str + "</p>");
        }
      %>
      <form action="validate.jsp">
        <p>Username</p>
        <input type="text" name="username" id="username" required>
        <p>Password</p>
        <input type="password" name="pwd" id="pwd" required>
        <br/><br/>
        <input type="submit" value="Submit">
      </form>
      <div class="signup-link">
        <p>Don't have an account? <a href="signup.jsp">Sign Up</a></p>
      </div>
    </div>
  </body>
</html>

