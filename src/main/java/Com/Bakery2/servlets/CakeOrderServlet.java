package Com.Bakery2.servlets;

import Com.Bakery2.models.Order;
import Com.Bakery2.utils.OrderFileManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/CakeOrderServlet")
public class CakeOrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String customerName = request.getParameter("customerName");
        String cakeType = request.getParameter("cakeType");
        String cakeFlavour = request.getParameter("cakeFlavour");
        String cakeSize = request.getParameter("cakeSize");
        String message = request.getParameter("message");
        String payment = request.getParameter("payment");

        Order order = new Order(customerName, cakeType, cakeFlavour, cakeSize, message, payment);

        String filePath = getServletContext().getRealPath("/WEB-INF/orders.txt");

        try {
            OrderFileManager.saveOrder(filePath, order);
            response.sendRedirect("success.jsp?message=Order+Placed+Successfully!");
        } catch (IOException e) {
            e.printStackTrace();
            response.sendRedirect("cakeBooking.jsp?message=Error+Saving+Order");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String filePath = getServletContext().getRealPath("/WEB-INF/orders.txt");
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        out.println("<h3>Placed Orders</h3>");
        out.println("<pre>");

        List<Order> orders = OrderFileManager.readOrders(filePath);
        if (orders.isEmpty()) {
            out.println("No orders have been placed yet.");
        } else {
            for (Order o : orders) {
                out.println(o.toString()); // Make sure Order class has a clear toString()
            }
        }

        out.println("</pre>");
        out.println("<a href='cakeBooking.jsp'>Back to Order Page</a>");
    }
}
