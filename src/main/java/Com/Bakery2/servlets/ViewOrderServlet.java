package Com.Bakery2.servlets;

import Com.Bakery2.models.Order;
import Com.Bakery2.utils.OrderFileManager;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/ViewOrderServlet")
public class ViewOrderServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String customerName = request.getParameter("customerName");
        String filePath = getServletContext().getRealPath("/WEB-INF/orders.txt");

        List<Order> orders = OrderFileManager.readOrders(filePath);

        // Find the latest matching order for this customer name
        Order matchedOrder = null;
        for (int i = orders.size() - 1; i >= 0; i--) {
            if (orders.get(i).getCustomerName().equalsIgnoreCase(customerName)) {
                matchedOrder = orders.get(i);
                break;
            }
        }

        // Set attributes to send to the JSP
        request.setAttribute("order", matchedOrder);
        request.setAttribute("customerName", customerName);

        // Forward to the JSP
        request.getRequestDispatcher("ViewOrder1.jsp").forward(request, response);
    }
}