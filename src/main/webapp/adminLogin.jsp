<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container d-flex justify-content-center align-items-center vh-100">
    <div class="card shadow p-4" style="min-width: 350px;">
        <h3 class="text-center mb-4">Admin Login</h3>

        <form action="AdminLoginServlet" method="post">
            <div class="form-floating mb-3">
                <input type="text" class="form-control" name="username" id="username" placeholder="Admin Username" required>
                <label for="username">Username</label>
            </div>

            <div class="form-floating mb-4">
                <input type="password" class="form-control" name="password" id="password" placeholder="Password" required>
                <label for="password">Password</label>
            </div>

            <button type="submit" class="btn btn-primary w-100">Login</button>

            <% String error = request.getParameter("error");
               if (error != null) { %>
                <div class="mt-3 alert alert-danger text-center">
                    <%= error %>
                </div>
            <% } %>
        </form>
    </div>
</div>

</body>
</html>