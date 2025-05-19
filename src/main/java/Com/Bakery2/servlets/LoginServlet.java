package Com.Bakery2.servlets;

import Com.Bakery2.models.Users;
import Com.Bakery2.utils.FileManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("username");
        String password = request.getParameter("password");

        String filePath = getServletContext().getRealPath("/WEB-INF/users.txt");
        List<Users> users = FileManager.readUsersAsObjects(filePath);

        for (Users user : users) {
            if (user.getEmail().equals(email) && user.getPassword().equals(password)) {
                HttpSession session = request.getSession();
                session.setAttribute("currentUser", user);
                response.sendRedirect("home.jsp");
                return;
            }
        }

        response.sendRedirect("login.jsp?error=Invalid email or password");
    }
}