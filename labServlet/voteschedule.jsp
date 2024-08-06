<html>
  <head>
  </head>
  <body>
    <%
String str=request.getParameter("msg");
if(str!=null)
    out.println("<p><font size=32 color=red>"+str+"</font></p>");
%>
  <form action="vald.jsp">
    <input type="submit" value="0" name="val">
     <input type="submit" value="1" name="val">
  </form>
  </body>
</html>
