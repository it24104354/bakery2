package Com.Bakery2.servlets;

import Com.Bakery2.models.Order;
import Com.Bakery2.utils.OrderFileManager;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/DeleteOrderServlet")
public class DeleteOrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String customerName = request.getParameter("customerName");
        String filePath = getServletContext().getRealPath("/WEB-INF/orders.txt");

        List<Order> orders = OrderFileManager.readOrders(filePath);
        List<Order> updatedOrders = new ArrayList<>();

        for (Order order : orders) {
            if (!order.getCustomerName().equalsIgnoreCase(customerName)) {
                updatedOrders.add(order);
            }
        }

        // Overwrite file with remaining orders
        OrderFileManager.overwriteOrders(filePath, updatedOrders);
        response.sendRedirect("cakeBooking.jsp?message=Order+Deleted+Successfully");
    }
}
