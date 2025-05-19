package Com.Bakery2.servlets;

import Com.Bakery2.models.BakeryOrder;
import Com.Bakery2.utils.BakeryOrderFileManager;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/DeleteBakeryOrderServlet")
public class DeleteBakeryOrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String customerName = request.getParameter("customerName");
        String filePath = getServletContext().getRealPath("/WEB-INF/bakery_orders.txt");

        List<BakeryOrder> orders = BakeryOrderFileManager.readOrders(filePath);
        List<BakeryOrder> updatedOrders = new ArrayList<>();

        for (BakeryOrder order : orders) {
            if (!order.getCustomerName().equalsIgnoreCase(customerName)) {
                updatedOrders.add(order);
            }
        }

        BakeryOrderFileManager.overwriteOrders(filePath, updatedOrders);
        response.sendRedirect("bakeryBooking.jsp?message=Bakery+Order+Deleted+Successfully");
    }
}
