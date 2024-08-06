<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String mfrom=request.getParameter("mfrom");
String mto=request.getParameter("mto");
String subject=request.getParameter("subj");
String mtext=request.getParameter("mtext");
try
{
         Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/emailsoftware", "root", "root");
           Statement st1=conn.createStatement();
           Statement st2=conn.createStatement();
           
           String sql ="select * from users where emailid='"+mto+"'";
          
	ResultSet rs = st2.executeQuery(sql);
	 
	if(rs.next()){
	int i=st1.executeUpdate("insert into mail(mfrom,mto,subject,mtext,inbox,sentbox)values('"+mfrom+"','"+mto+"','"+subject+"','"+mtext+"',1,1)");
		 response.sendRedirect("ComposeMail.jsp?msg='Mails Sent Successfully'");
	}else{
		response.sendRedirect("ComposeMail.jsp?msg='Invalid Mail '");
	}
	
	
           
           
		
           

        }
        catch(Exception e)
        {
        out.print(e.getMessage());
        e.printStackTrace();
        }
 %>
