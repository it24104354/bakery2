<%@ page import="Com.Bakery2.models.Users" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Profile</title>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <%
        Users user = (Users) session.getAttribute("currentUser");
        if (user == null) {
            response.sendRedirect("Register.jsp?message=Please register first.");
            return;
        }
    %>

    <div class="card p-4 shadow-sm">
        <h3 class="mb-3 text-primary">Welcome, <%= user.getName() %>!</h3>
        <ul class="list-group mb-3">
            <li class="list-group-item"><strong>Address:</strong> <%= user.getAddress() %></li>
            <li class="list-group-item"><strong>City:</strong> <%= user.getCity() %></li>
            <li class="list-group-item"><strong>Phone:</strong> <%= user.getPhone() %></li>
            <li class="list-group-item"><strong>Email:</strong> <%= user.getEmail() %></li>
        </ul>

        <div class="d-flex justify-content-between">
            <form action="update.jsp" method="get">
                <button class="btn btn-warning">Update</button>
            </form>
            <form action="DeleteUser" method="post">
                <input type="hidden" name="email" value="<%= user.getEmail() %>">
                <button class="btn btn-danger"
                        onclick="return confirm('Are you sure you want to delete your profile?')">Delete</button>
            </form>
        </div>
    </div>
</div>

</body>
</html>