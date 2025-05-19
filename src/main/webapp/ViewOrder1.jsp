<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Com.Bakery2.models.Order" %>
<html>
<head>
    <title>Your Order Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            padding: 30px;
        }
        h2 {
            color: #2c3e50;
        }
        .order-box {
            background-color: #fff;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            max-width: 400px;
            margin: auto;
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
        li {
            padding: 8px 0;
        }
        .btn {
            padding: 10px 15px;
            background-color: #e74c3c;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #c0392b;
        }
        a {
            display: inline-block;
            margin-top: 15px;
            text-decoration: none;
            color: #3498db;
        }
        .not-found {
            color: red;
            text-align: center;
        }
    </style>
</head>
<body>

<div class="order-box">
    <h2>Your Order Details</h2>

    <%
        Order order = (Order) request.getAttribute("order");
        String customerName = (String) request.getAttribute("customerName");

        if (order != null) {
    %>
        <ul>
            <li><strong>Name:</strong> <%= order.getCustomerName() %></li>
            <li><strong>Type:</strong> <%= order.getCakeType() %></li>
            <li><strong>Flavour:</strong> <%= order.getCakeFlavour() %></li>
            <li><strong>Size:</strong> <%= order.getCakeSize() %></li>
            <li><strong>Message:</strong> <%= order.getMessage() %></li>
            <li><strong>Payment:</strong> <%= order.getPayment() %></li>
        </ul>

           <a href="feedback.jsp" class="btn btn-primary">Enter Your Feedback</a>
            <br><br>

        <form action="DeleteOrderServlet" method="post">
            <input type="hidden" name="customerName" value="<%= customerName %>" />
            <input type="submit" class="btn" value="Delete My Order" />
        </form>

    <%
        } else {
    %>
        <p class="not-found">No order found for: <%= customerName %></p>
    <%
        }
    %>

    <a href="cakeBooking.jsp">← Back to Cake Order</a>
</div>

</body>
</html>