<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            padding: 30px;
        }
        .form-container {
            background-color: #fff;
            padding: 25px;
            max-width: 400px;
            margin: auto;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            color: #333;
        }
        input[type="text"], input[type="email"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type="submit"] {
            width: 100%;
            background-color: #4CAF50;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .login-link {
            text-align: center;
            margin-top: 15px;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Register</h2>
    <form action="Register" method="post">
        <input type="text" name="name" placeholder="Name" required>
        <input type="text" name="address" placeholder="Address" required>
        <input type="text" name="city" placeholder="City" required>
        <input type="text" name="phone" placeholder="Phone" required>
        <input type="email" name="email" placeholder="Email" required>
        <input type="password" name="password" placeholder="Password" required>
        <input type="submit" value="Register">
    </form>
    <div class="login-link">
        Already have an account? <a href="login.jsp">Login here</a>
    </div>
</div>

</body>
</html>
