%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Successful</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f9fff5;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background: #ffffff;
            padding: 30px 40px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }
        h2 {
            color: green;
        }
        .btn {
            display: inline-block;
            margin: 15px 10px 0;
            padding: 10px 20px;
            background-color: #28a745;
            color: white;
            text-decoration: none;
            font-weight: bold;
            border-radius: 5px;
        }
        .btn:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Your Order Details Were Saved Successfully!</h2>

    <a href="Register.jsp" class="btn">Go Back</a>
    <a href="ViewBakeryOrder.jsp" class="btn">View Orders</a>
</div>

</body>
</html>