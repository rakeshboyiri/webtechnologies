
<html>
<head>
  <title>GET using URL</title>
</head>
 
<body>
  <h2>GET Method to Read Form Data Using URL</h2>
  <ul>
               <li><p><b>First Name:</b>
                              <%= request.getParameter("firstName")%>
               </p></li>
               <li><p><b>Last  Name:</b>
                              <%= request.getParameter("lastName")%>
               </p></li>
  </ul>
  <%
  String uname=request.getParameter("firstName");
  String pwd=request.getParameter("lastName");
  if(uname.equals("admin"))
  {
  String redirectURL = "adminHome.html";
    response.sendRedirect(redirectURL);
    }
    else
    {
    String redirectURL = "userHome.html";
    response.sendRedirect(redirectURL);
    }
 %>
</body>
</html>
