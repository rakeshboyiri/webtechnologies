import javax.servlet.http.*;  
import javax.servlet.*;  
import java.io.*; 
import java.sql.*;
import java.util.*; 
public class delete extends HttpServlet{  
public void doGet(HttpServletRequest req,HttpServletResponse res)  
throws ServletException,IOException  
{  
res.setContentType("text/html");//setting the content type  
PrintWriter pw=res.getWriter();//get the stream to write the data  
  
//writing html in the stream  
//int uid=Integer.parseInt(req.getParameter("uid"));
int uid = 1;

try
{
         Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/MyProjectDatabase", "root", "root");
           Statement st=conn.createStatement();
           int i=st.executeUpdate("delete from users where id="+uid); 
        pw.println("<center><b>User Deleted Successfully!<br><a href='RetrieveData.jsp'>Check Now</a></b></center>");
        }
        catch(Exception e)
        {
        System.out.print(e);
        e.printStackTrace();
        }
  
pw.close();//closing the stream  
}}  
