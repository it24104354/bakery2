package Com.Bakery2.servlets;

import Com.Bakery2.models.Users;
import Com.Bakery2.utils.FileManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.*;
import java.util.List;

@WebServlet("/DeleteUser")
public class DeleteUserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");

        String filePath = getServletContext().getRealPath("/WEB-INF/users.txt");

        List<Users> users = FileManager.readUsersAsObjects(filePath);
        boolean removed = users.removeIf(u -> u.getEmail().equalsIgnoreCase(email));

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        if (removed) {
            FileManager.writeUsersToFile(filePath, users);
            out.println("<h3>User deleted successfully!</h3>");
        } else {
            out.println("<h3>No user found with email: " + email + "</h3>");
        }

        out.println("<a href='register.jsp'>Back to Registration</a>");
    }
}
