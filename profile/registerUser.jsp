<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
int user_id=Integer.parseInt(request.getParameter("uid"));
String user_name=request.getParameter("uname");
String user_email=request.getParameter("emailid");
String user_mobile=request.getParameter("mobilenum");
try
{
         Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/MyProjectDatabase", "root", "root");
           Statement st=conn.createStatement();
           int i=st.executeUpdate("insert into users(id,name,email,mobile)values("+user_id+",'"+user_name+"','"+user_email+"','"+user_mobile+"')");
        if(i>0)
           response.sendRedirect("Re.jsp");
           else
        out.println("<center><b>Error registering User. Try Again!</b></center>");
        }
        catch(Exception e)
        {
        System.out.print(e);
        e.printStackTrace();
        }
 %>
