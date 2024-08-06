<html>
  <head>
    <title>Register</title>
    <style type="text/css">
    .reg-div{
      margin:50px auto ;
      background-color:gray;
      width:60%;
      height:400px;
    }
    </style>
  </head>
  <body>
  <%
  String str=request.getParameter("msg");
if(str!=null)
    out.println("<p><font size=32 color=red>"+str+"</font></p>");
%>
    <div class="reg-div">
    <form name="register-form" action="login.jsp">
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
