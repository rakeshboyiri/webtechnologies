<!DOCTYPE html>
<html>
<head>
<style>


</style>
</head>
<body>

<h1></h1>
<div class="container">
   
<%@page import="java.sql.*,java.util.*"%>
<%
String user_name=request.getParameter("username");
String password=request.getParameter("pwd");
try
{
         Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/election", "root", "root");
           Statement st=conn.createStatement();
             int i=st.executeUpdate("insert into citizens(cname,pwd)values('"+user_name+"','"+password+"')");
        out.println("<center><b>Successfully Signed-in!<br><a href='register.jsp'>Login</a></b></center>");
        }
        catch(Exception e)
        {
        out.println(e.getMessage());
        e.printStackTrace();
        }
 %>
</div> 

</body>
</html>
