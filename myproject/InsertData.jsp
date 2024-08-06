<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
int user_id=Integer.parseInt(request.getParameter("uid"));
String user_name=request.getParameter("name");
String user_email=request.getParameter("email");
String user_mobile=request.getParameter("mobile");
String user_password=request.getParameter("password");
try
{
         Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/emailsoftware", "root", "root");
           Statement st=conn.createStatement();
           /*
           String sql ="insert into users (emailid,name,pwd,mobile) values('"+user_email+"','"+user_name+"','"+user_password+"',"+user_mobile+")";
	int i  = statement.executeUpdate(sql);
	if(resultSet.next()){
		out.println("<h1>Valid </h1>");
	}else{
		out.println("<center><b>Data is successfully inserted!<br><a href='userHome.html'>Check Now</a></b></center>");
	}
           
           
           int i=st.executeUpdate("insert into users(id,name)values("+user_id+",'"+user_name+"')");
        out.println("<center><b>Data is successfully inserted!<br><a href='userHome.html'>Check Now</a></b></center>");
        
        */
        }
        catch(Exception e)
        {
        out.println(e.getMessage());
        e.printStackTrace();
        }
 %>
