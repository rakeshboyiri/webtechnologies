import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "GET method is not supported. Please use the form to submit data.");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String driver = "com.mysql.jdbc.Driver";
        String connectionUrl = "jdbc:mysql://localhost:3306/";
        String database = "election";
        String userid = "root";
        String password = "root";

        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet1 = null;
        ResultSet resultSet2 = null;
        ResultSet resultSet3 = null;

        try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        try {
            int flag = 0;
            String uid = request.getParameter("username");
            String uname = request.getParameter("pwd");

            connection = DriverManager.getConnection(connectionUrl + database, userid, password);
            statement = connection.createStatement();

            String sql1 = "select * from status where status=1";
            resultSet1 = statement.executeQuery(sql1);

            if (resultSet1.next()) {
                String sql3 = "select * from citizens where cname='" + uid + "' and pwd='" + uname + "' and vote_status=1";
                resultSet3 = statement.executeQuery(sql3);

                if (resultSet3.next()) {
                    response.sendRedirect("register.jsp?msg='voted already!'");
                    return;
                }

                String sql = "select * from citizens where cname='" + uid + "' and pwd='" + uname + "' and vote_status=0";
                resultSet2 = statement.executeQuery(sql);

                while (resultSet2.next()) {
                    flag = 1;
                }

                if (flag == 1) {
                    statement.executeUpdate("update citizens set vote_status=1 where cname='" + uname + "'");
                    response.sendRedirect("vote.jsp");
                } else {
                    response.sendRedirect("register.jsp?msg='invalid Credentials!'");
                }
            } else {
                response.sendRedirect("register.jsp?msg='voting not scheduled!'");
            }
        } catch (Exception e) {
            response.getWriter().println(e.getMessage());
        } finally {
            try {
                if (resultSet1 != null) resultSet1.close();
                if (resultSet2 != null) resultSet2.close();
                if (resultSet3 != null) resultSet3.close();
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}

