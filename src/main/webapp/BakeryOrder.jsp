<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bakery Order</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background: #ffffff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            width: 400px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }
        input[type="text"],
        input[type="number"],
        select {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"] {
            margin-top: 20px;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            width: 100%;
            border-radius: 5px;
            font-weight: bold;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .message {
            color: red;
            text-align: center;
            font-weight: bold;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Place a Bakery Order</h2>

    <%-- Show error message if redirected with a message parameter --%>
    <%
        String message = request.getParameter("message");
        if (message != null && !message.trim().isEmpty()) {
    %>
        <div class="message"><%= message %></div>
    <%
        }
    %>

    <form method="post" action="BakeryOrderServlet">
        <label>Your Name:
            <input type="text" name="customerName" required>
        </label>

        <label>Choose the item:
            <select name="itemType" required>
                <option value="">-- Select Item --</option>
                <option value="Buns">Buns</option>
                <option value="Rolls">Rolls</option>
                <option value="Pastry">Pastry</option>
                <option value="Doughnuts">Doughnuts</option>
                <option value="Pizza">Pizza</option>
            </select>
        </label>

        <label>Sauce Flavour:
            <select name="sauceFlavour" required>
                <option value="">-- Select Flavour --</option>
                <option value="Tomato">Tomato</option>
                <option value="Cream">Cream</option>
                <option value="Mustard">Mustard</option>
                <option value="Sweet">Sweet</option>
            </select>
        </label>

        <label>Number of Items:
            <input type="number" name="itemCount" min="1" required>
        </label>

        <label>Payment Method:
            <select name="payment" required>
                <option value="">-- Select Payment Method --</option>
                <option value="Cash">Cash</option>
                <option value="Card">Card</option>
                <option value="Online">Online</option>
            </select>
        </label>

        <input type="submit" value="Place Order">
    </form>
</div>
</body>
</html>