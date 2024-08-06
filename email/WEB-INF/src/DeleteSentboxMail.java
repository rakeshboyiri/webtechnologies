import javax.servlet.http.*;  
import javax.servlet.*;  
import java.io.*;  
import java.sql.*;
import java.util.*;
public class DeleteSentboxMail extends HttpServlet{  
public void doGet(HttpServletRequest request,HttpServletResponse response)  
throws ServletException,IOException  
{  
response.setContentType("text/html");//setting the content type  
PrintWriter out=response.getWriter();//get the stream to write the data  
  
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
             i=st.executeUpdate("update mail set sentbox=0 where mid="+mid);
           }
          
        if(i>0)
           response.sendRedirect("SentBox.jsp");
           else
        out.println("<center><b>Error deleting User. Try Again!</b></center>");
        }
        catch(Exception e)
        {
        System.out.print(e);
        e.printStackTrace();
        }
  
out.close();//closing the stream  
}}  
