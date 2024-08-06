<%@page import="java.sql.*,java.util.*"%>
<%
String SelectList[]=request.getParameterValues("SelectList");
String dept=request.getParameter("dept");
String mnext=request.getParameter("mnext");
if(SelectList!=null)
{
int fid,n;
try
{
  Class.forName("com.mysql.jdbc.Driver");
  Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/emailsoftware", "root", "root");
  Statement st=conn.createStatement();
           int i;
           if((dept!=null)&&(dept!="")){
           
           if(mnext.equals("0"))
          i=st.executeUpdate("update faculty set sel=0 where dept!='"+dept+"'");
          else
          i=st.executeUpdate("update faculty set sel=0 where dept='"+dept+"'");
           }
          for(n=0;n<SelectList.length;n++){
            fid=Integer.parseInt(SelectList[n]);
            i=st.executeUpdate("update faculty set sel=1 where fid="+fid);}
            if(mnext.equals("0"))
        response.sendRedirect("SelectFaculty.jsp?dept="+dept);
        else
        response.sendRedirect("DisplayPanel.jsp?dept="+dept);
          }
        catch(Exception e)
        {
        out.print(e.getMessage());
        e.printStackTrace();
        }
    }
    else{
        if(mnext.equals("0"))
        response.sendRedirect("SelectFaculty.jsp?dept="+dept);
        else
        response.sendRedirect("DisplayPanel.jsp?dept="+dept); 
    }
 %>
