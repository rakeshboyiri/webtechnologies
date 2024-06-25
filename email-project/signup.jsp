<DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,intial-scale">
<title>form Login and register</title>
<link rel="stylesheet" href="style1.css">
</head>
<body style="background-color:gray;">
<div style="width:100%;height:50px;margin:auto">
  <%
                 String str=request.getParameter("msg");
                 if(str!=null)
                   out.println("<h1 style='color:red;text-align:center;'>"+str+"</h1>");
                %>
</div>
<div class="signup">
<h1 class="su">sign up</h1>
<p>
<form name="f1" action="InsertData.jsp" method="post">
  <label>Name</label>  <br/>
<input type="name" name="name"  required> <br/><br/>
<label>Email</label> <br/>
<input type="email" name="email" required> <br/><br/>
  <label>Mobile Number</label>  <br/>
<input type="mobile" name="mobile"  required maxlength=10> <br/><br/>
  <label>Password</label>  <br/>
<input type="password" name="password"  required> <br/><br/>
<input type="submit" name="" value="submit">
</p>
</form>
<p>by clicking the sign up button,you agree to our<br>
<a href=""> Term and condition</a> and <a href="home.jsp">policy
privecy</a></p>
</div>
</body>
</html>
