<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
int user_id=Integer.parseInt(request.getParameter("uid"));
String mail=request.getParameter("mto");
try
{
         Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/MyProjectDatabase", "root", "root");
           Statement st=conn.createStatement();
           int i=st.executeUpdate("select * from users where emailid="+mail);
           if(i!=0){
        out.println("<center><b>Mail Sent!<br><a href='inbox.jsp'>Check Now</a></b></center>");
        }else{
        	 out.println("<center><b>User Not Found!<br><a href='inbox.jsp'>Check Now</a></b></center>");
        }
        }
        catch(Exception e)
        {
        out.println(e.getMessage());
        e.printStackTrace();
        }
 %>
