<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
int user_id=Integer.parseInt(request.getParameter("uid"));
String user_name=request.getParameter("uname");
String user_email=request.getParameter("uemail");
String user_mobile=request.getParameter("umobile");
try
{
         Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/MyProjectDatabase", "root", "root");
           Statement st=conn.createStatement();
           int i=st.executeUpdate("update users set name='"+user_name+"', email='"+user_email+"', mobile= '"+user_mobile+"' where id="+user_id);
        if(i>0)
           response.sendRedirect("viewUser.jsp?uid="+user_id);
           else
        out.println("<center><b>Error editing profile. Try Again!</b></center>");
        }
        catch(Exception e)
        {
        System.out.print(e);
        e.printStackTrace();
        }
 %>
