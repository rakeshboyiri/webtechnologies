<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
int user_id=Integer.parseInt(request.getParameter("mail"));
int type = Integer.parseInt(request.getParameter("type"));

try
{
         Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/emailsoftware", "root", "root");
           Statement st=conn.createStatement();
       if(type==1){
       		int i=st.executeUpdate("update  mail set inbox=0 where mid="+user_id);
       		 out.println("<center><b>Mail Deleted Successfully!<br><a href='inbox.jsp'>Check Now</a></b></center>");
       }else{
       	 	int i=st.executeUpdate("update  mail set sentbox=0 where mid="+user_id);
       	 	out.println("<center><b>Mail Deleted Successfully!<br><a href='SentBox.jsp'>Check Now</a></b></center>");
        }
       }
        
        catch(Exception e)
        {
        out.println(e.getMessage());
        e.printStackTrace();
        }
 %>
