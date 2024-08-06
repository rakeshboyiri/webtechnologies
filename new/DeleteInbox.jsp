
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%

int mid;
int i=0;
String deleteList[]=request.getParameterValues("deleteList");
try
{
         Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/emailsoftware", "root", "root");
           Statement st=conn.createStatement();
           for(int n=0;n<deleteList.length;n++){
            mid=Integer.parseInt(deleteList[n]);
             i=st.executeUpdate("update mail set inbox='0' where mid="+mid);
           }
          
        if(i>0)
           response.sendRedirect("inbox.jsp");
           else
        out.println("<center><b>Error deleting User. Try Again!</b></center>");
        }
        catch(Exception e)
        {
        System.out.print(e);
        e.printStackTrace();
        }
 %>
