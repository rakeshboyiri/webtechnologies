<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%

String user_name=request.getParameter("name");
String user_email=request.getParameter("email");
String user_mobile=request.getParameter("mobile");
String user_password=request.getParameter("password");
try
{
         Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/emailsoftware", "root", "root");
           Statement st=conn.createStatement();
           ResultSet rs = st.executeQuery("select * from users where emailid='"+user_email+"'");
           if(rs.next()){
           	 response.sendRedirect("signup.jsp?msg='Email already exsists!'");
				
           }else{
           
int i = st.executeUpdate("INSERT INTO users(emailid, name, mobile, pwd,type) VALUES ('" + user_email + "', '" + user_name + "', '" + user_mobile + "', '" + user_password + "','user')");

 response.sendRedirect("home.jsp?msg='Successfully signed up'&bool=1");
	
}

           
           
        }
        catch(Exception e)
        {
        out.println(e.getMessage());
        e.printStackTrace();
        }
 %>
