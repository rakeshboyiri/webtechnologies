<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String facultyname=request.getParameter("fname");
String dept_name=request.getParameter("deptname");

try
{
         Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/faculty", "root", "root");
           Statement st=conn.createStatement();
        
           String sql ="insert into faculty (name,dept) values('"+facultyname+"','"+dept_name+"')";
           st.executeUpdate(sql);
	
        }
        catch(Exception e)
        {
        out.println(e.getMessage());
        e.printStackTrace();
        }
 %>
