<%@ page import="Com.Bakery2.models.Users" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Profile</title>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<%
    Users user = (Users) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("Register.jsp?message=Please register first.");
        return;
    }
%>

<div class="container mt-5">
    <div class="card shadow-sm p-4">
        <h3 class="text-center mb-4 text-success">Update Your Profile</h3>
        <form action="UpdateUser" method="post">
            <input type="hidden" name="originalEmail" value="<%= user.getEmail() %>">

            <div class="mb-3">
                <label class="form-label">Name</label>
                <input type="text" class="form-control" name="name" value="<%= user.getName() %>" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Address</label>
                <input type="text" class="form-control" name="address" value="<%= user.getAddress() %>" required>
            </div>

            <div class="mb-3">
                <label class="form-label">City</label>
                <input type="text" class="form-control" name="city" value="<%= user.getCity() %>" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Phone</label>
                <input type="text" class="form-control" name="phone" value="<%= user.getPhone() %>" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Email</label>
                <input type="email" class="form-control" name="email" value="<%= user.getEmail() %>" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Password</label>
                <input type="password" class="form-control" name="password" value="<%= user.getPassword() %>" required>
            </div>

            <button type="submit" class="btn btn-success w-100">Update Profile</button>
        </form>
    </div>
</div>

</body>
</html>