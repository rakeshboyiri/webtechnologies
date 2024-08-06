import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class InsertData extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String userName = request.getParameter("username");
        String password = request.getParameter("pwd");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/election", "root", "root");
            Statement st = conn.createStatement();
            int i = st.executeUpdate("INSERT INTO citizens (cname, pwd) VALUES ('" + userName + "', '" + password + "')");
            
            if (i > 0) {
                out.println("<center><b>Successfully Signed-in!<br><a href='register.jsp'>Login</a></b></center>");
            } else {
                out.println("<center><b>Sign-in Failed!</b></center>");
            }
            
            conn.close();
        } catch (Exception e) {
            out.println(e.getMessage());
            e.printStackTrace();
        } finally {
            out.close();
        }
    }
}

