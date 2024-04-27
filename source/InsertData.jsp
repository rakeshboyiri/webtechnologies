<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
int user_id=Integer.parseInt(request.getParameter("uid"));
String user_name=request.getParameter("uname");
try
{
         Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/MyProjectDatabase", "root", "root");
           Statement st=conn.createStatement();
           int i=st.executeUpdate("insert into users(id,name)values("+user_id+",'"+user_name+"')");
        out.println("<center><b>Data is successfully inserted!<br><a href='RetrieveData.jsp'>Check Now</a></b></center>");
        }
        catch(Exception e)
        {
        out.println(e.getMessage());
        e.printStackTrace();
        }
 %>
