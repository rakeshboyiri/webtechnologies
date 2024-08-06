<html>
  <head>
    <title>Register</title>
  </head>
  <body>
  <%
  String str=request.getParameter("msg");
if(str!=null)
    out.println("<p><font size=32 color=red>"+str+"</font></p>");
%>
    <div class="reg-div">
    <form name="register-form" action="RegisterServlet" method="POST">
      <p>
        Username
      </p>
      <input type="text" name="username" id="username" > <br/>
      <p>
        Password
      </p>
      <input type="password" name="pwd" id="pwd" > <br/>
      <input type="submit" value="SUBMIT">
    </div>
  </body>
</html>
