package Com.Bakery2.servlets;

import Com.Bakery2.models.Users;
import Com.Bakery2.utils.FileManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.*;
import java.util.List;

@WebServlet("/UpdateUser")
public class UpdateUserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email"); // Unique identifier

        String updatedName = request.getParameter("name");
        String updatedAddress = request.getParameter("address");
        String updatedCity = request.getParameter("city");
        int updatedPhone = Integer.parseInt(request.getParameter("phone"));
        String updatedPassword = request.getParameter("password");

        String filePath = getServletContext().getRealPath("/WEB-INF/users.txt");

        List<Users> users = FileManager.readUsersAsObjects(filePath);
        boolean found = false;

        for (int i = 0; i < users.size(); i++) {
            if (users.get(i).getEmail().equalsIgnoreCase(email)) {
                users.set(i, new Users(updatedName, updatedAddress, updatedCity, updatedPhone, email, updatedPassword));
                found = true;
                break;
            }
        }

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        if (found) {
            FileManager.writeUsersToFile(filePath, users);
            out.println("<h3>User updated successfully!</h3>");
        } else {
            out.println("<h3>User with email " + email + " not found.</h3>");
        }

        out.println("<a href='register.jsp'>Back to Registration</a>");
    }
}
