<html>
<head><style>
.myStyle{
font-size:32px;
}
</style>
<head><body><br><br><br><br><br><br><br><br>
<%
String msg=request.getParameter("msg");
if(msg!=null)
out.println("<center><font size=28 color=red>"+msg+"</font></center>");
%>
<form name="f1" action="valLogin.jsp">
<center><input type="text" name=uname id=uname placeholder="Enter UserID" class="myStyle"><br>
<input type="text" name=pwd id=pwd placeholder="Enter Pwd" class="myStyle"><br><br>
<input type="submit" value="Login" class=myStyle>
<input type="reset" value="Reset" class=myStyle></form>
<a href="change.jsp">Change UserName</a>
</body></html>
