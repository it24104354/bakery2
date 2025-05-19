package Com.Bakery2.servlets;

import Com.Bakery2.models.BakeryOrder;
import Com.Bakery2.utils.BakeryOrderFileManager;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/ViewBakeryOrderServlet")
public class ViewBakeryOrderServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String customerName = request.getParameter("customerName");
        String filePath = getServletContext().getRealPath("/WEB-INF/bakery_orders.txt");

        List<BakeryOrder> orders = BakeryOrderFileManager.readOrders(filePath);

        // Find latest matching order for this customer
        BakeryOrder matchedOrder = null;
        for (int i = orders.size() - 1; i >= 0; i--) {
            if (orders.get(i).getCustomerName().equalsIgnoreCase(customerName)) {
                matchedOrder = orders.get(i);
                break;
            }
        }

        request.setAttribute("order", matchedOrder);
        request.setAttribute("customerName", customerName);
        request.getRequestDispatcher("ViewBakeryOrder1.jsp").forward(request, response);
    }
}
