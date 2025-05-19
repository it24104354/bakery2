package Com.Bakery2.servlets;

import Com.Bakery2.models.BakeryOrder;
import Com.Bakery2.utils.BakeryOrderFileManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/BakeryOrderServlet")
public class BakeryOrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String customerName = request.getParameter("customerName");
        String itemType = request.getParameter("itemType");
        String sauceFlavour = request.getParameter("sauceFlavour");
        String itemCountStr = request.getParameter("itemCount");
        String payment = request.getParameter("payment");

        int itemCount = 0;
        try {
            itemCount = Integer.parseInt(itemCountStr);
        } catch (NumberFormatException e) {
            response.sendRedirect("bakeryBooking.jsp?message=Invalid+Item+Count");
            return;
        }

        BakeryOrder order = new BakeryOrder(customerName, itemType, sauceFlavour, itemCount, payment);

        String filePath = getServletContext().getRealPath("/WEB-INF/bakery_orders.txt");

        try {
            BakeryOrderFileManager.saveOrder(filePath, order);
            response.sendRedirect("success1.jsp?message=Bakery+Order+Placed+Successfully!");
        } catch (IOException e) {
            e.printStackTrace();
            response.sendRedirect("bakeryBooking.jsp?message=Error+Saving+Order");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String filePath = getServletContext().getRealPath("/WEB-INF/bakery_orders.txt");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        out.println("<h3>Bakery Orders</h3>");
        List<BakeryOrder> orders = BakeryOrderFileManager.readOrders(filePath);

        if (orders.isEmpty()) {
            out.println("<p>No bakery orders found.</p>");
        } else {
            out.println("<table border='1'>");
            out.println("<tr><th>Customer Name</th><th>Item Type</th><th>Sauce Flavour</th><th>Item Count</th><th>Payment</th></tr>");
            for (BakeryOrder o : orders) {
                out.printf("<tr><td>%s</td><td>%s</td><td>%s</td><td>%d</td><td>%s</td></tr>",
                        o.getCustomerName(), o.getItemType(), o.getSauceFlavour(), o.getItemCount(), o.getPayment());
            }
            out.println("</table>");
        }

        out.println("<br><a href='bakeryBooking.jsp'>Back to Order Page</a>");
    }
}
