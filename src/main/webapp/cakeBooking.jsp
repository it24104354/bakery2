<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Custom Cake Booking</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #fff8f0;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 500px;
            margin: 50px auto;
            background: #fff;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            color: #d2691e;
        }
        label {
            display: block;
            margin: 15px 0 5px;
            font-weight: bold;
        }
        input[type="text"],
        select {
            width: 100%;
            padding: 8px;
            margin-top: 3px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"] {
            background-color: #d2691e;
            color: white;
            border: none;
            padding: 12px;
            font-size: 16px;
            margin-top: 20px;
            width: 100%;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #a0522d;
        }
        .message {
            color: red;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Custom Cake Booking</h2>

    <% String msg = request.getParameter("message");
       if (msg != null) { %>
       <p class="message"><%= msg %></p>
    <% } %>

    <form method="post" action="CakeOrderServlet">
        <label>Your Name:</label>
        <input type="text" name="customerName" required>

        <label>Choose Cake Type:</label>
        <select name="cakeType" required>
            <option value="Red Velvet">Red Velvet</option>
            <option value="Black Forest">Black Forest</option>
            <option value="Vanilla">Vanilla</option>
            <option value="Strawberry">Strawberry</option>
            <option value="Chocolate">Chocolate</option>
            <option value="Butter">Butter</option>
        </select>

        <label>Choose Flavour:</label>
        <select name="cakeFlavour" required>
            <option value="Vanilla">Vanilla</option>
            <option value="Chocolate">Chocolate</option>
            <option value="Lemon">Lemon</option>
            <option value="Coconut">Coconut</option>
        </select>

        <label>Choose Size:</label>
        <select name="cakeSize" required>
            <option value="Small">Small</option>
            <option value="Medium">Medium</option>
            <option value="Large">Large</option>
        </select>

        <label>Message on Cake:</label>
        <input type="text" name="message" required>

        <label>Payment Method:</label>
        <select name="payment" required>
            <option value="Cash On Delivery">COD</option>
            <option value="Credit Card Payment">CCP</option>
        </select>

        <input type="submit" value="Place Order">
    </form>
</div>
</body>
</html>