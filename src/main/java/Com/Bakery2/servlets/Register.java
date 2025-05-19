package Com.Bakery2.servlets;

import Com.Bakery2.models.Users;
import Com.Bakery2.utils.FileManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.*;
import java.util.List;

@WebServlet("/Register")
public class Register extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        int phone = Integer.parseInt(request.getParameter("phone"));
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // ✅ Now using subclass of Person
        Users user = new Users(name, address, city, phone, email, password);

        String filePath = getServletContext().getRealPath("/WEB-INF/users.txt");
        File file = new File(filePath);
        file.getParentFile().mkdirs(); // Ensure the parent directory exists

        try {
            FileManager.saveUser(filePath, user); // You must ensure saveUser uses user.toCSV()
        } catch (IOException e) {
            e.printStackTrace();
            request.setAttribute("error", "Registration failed. Try again.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // ✅ Redirect to login page after successful registration
        response.sendRedirect("login.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String filePath = getServletContext().getRealPath("/WEB-INF/users.txt");
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        out.println("<h3>Registered Users</h3>");
        out.println("<pre>");

        List<Users> users = FileManager.readUsersAsObjects(filePath); // Ensure returns List<Users>
        if (users == null || users.isEmpty()) {
            out.println("No users have been registered yet.");
        } else {
            for (Users user : users) {
                out.println(user.toString()); // Will use overridden Person.toString()
            }
        }

        out.println("</pre>");
        out.println("<a href='register.jsp'>Back to Registration</a>");
    }
}
