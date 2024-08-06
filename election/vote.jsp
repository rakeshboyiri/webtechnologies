<!DOCTYPE html>
<html>
  <head>
    <title>Vote</title>
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

      .container h4 {
        font-size: 18px;
        margin-top: 20px;
      }

      .container a {
        text-decoration: none;
        color: #2196f3;
        font-weight: bold;
        transition: color 0.3s;
      }

      .container a:hover {
        color: #0d47a1;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <h1>Vote Casted Successfully</h1>
      <h4><a href="login.jsp">Logout</a></h4>
    </div>
  </body>
</html>

