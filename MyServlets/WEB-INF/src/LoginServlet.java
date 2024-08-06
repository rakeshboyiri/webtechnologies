import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // For demonstration purposes, let's assume the credentials are valid if the email is "user@example.com" and password is "password"
        if ("user@example.com".equals(email) && "password".equals(password)) {
            response.getWriter().println("Login successful!");
        } else {
            response.getWriter().println("Invalid email or password.");
        }
    }
}

