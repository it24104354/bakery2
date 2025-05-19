package Com.Bakery2.servlets;

import Com.Bakery2.models.Users;
import Com.Bakery2.utils.UserFileManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/AdminUserServlet")
public class AdminUserServlet extends HttpServlet {

    private String filePath;

    @Override
    public void init() throws ServletException {
        filePath = getServletContext().getRealPath("/WEB-INF/users1.txt");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String phoneStr = request.getParameter("phone");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            switch (action) {
                case "add":
                case "update":
                    int phone;
                    try {
                        phone = Integer.parseInt(phoneStr);
                    } catch (NumberFormatException e) {
                        request.setAttribute("message", "Invalid Phone Number");
                        doGet(request, response);
                        return;
                    }
                    Users user = new Users(name, address, city, phone, email, password);
                    if ("add".equals(action)) {
                        UserFileManager.addUser(filePath, user);
                        request.setAttribute("message", "User Added Successfully");
                    } else {
                        UserFileManager.updateUser(filePath, email, user);
                        request.setAttribute("message", "User Updated Successfully");
                    }
                    break;

                case "delete":
                    if (email != null && !email.isEmpty()) {
                        UserFileManager.deleteUser(filePath, email);
                        request.setAttribute("message", "User Deleted Successfully");
                    } else {
                        request.setAttribute("message", "Missing Email for Deletion");
                    }
                    break;

                default:
                    request.setAttribute("message", "Unknown Action");
            }
        } catch (IOException e) {
            e.printStackTrace();
            request.setAttribute("message", "Error Processing Request");
        }

        doGet(request, response); // Show updated list
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Users> users = UserFileManager.readUsers(filePath);
            request.setAttribute("users", users);
        } catch (IOException e) {
            request.setAttribute("message", "Error Loading Users");
            e.printStackTrace();
        }

        request.getRequestDispatcher("adminDashboard.jsp").forward(request, response);
    }
}
