<html>
<head><style>
.myTextbox{
font-size:32px;
}
.myButton{
font-size:32px;
}
</style></head>
<body>
<%
String msg=request.getParameter("msg");
if(msg!=null)
out.println("<center><font size=24 color=red>"+msg+"</font></center>");
%><br><br><br><br>
<form name="f1" action="registerUser.jsp">
<table border=1 width=60% align=center>
<tr><td>User ID</td><td align=center><input type=text name=uid id=uid class=myTextbox></td></tr>
<tr><td>Name</td><td align=center><input type=text name=uname id=uname class=myTextbox></td></tr>
<tr><td>Email</td><td align=center><input type=text name=emailid id=emailid class=myTextbox></td></tr>
<tr><td>Mobile</td><td align=center><input type=text name=mobilenum id=mobilenum class=myTextbox></td></tr>
<tr><td></td><td align=center><input type=submit value="Register" class="myButton">&nbsp;&nbsp;<input type=reset class=myButton></td></tr>
</table>
</form></body></html>
