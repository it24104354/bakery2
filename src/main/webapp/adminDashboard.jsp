<%@ page import="java.util.*, Com.Bakery2.models.Users" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
</head>
<body>
<h1>Bakery User Management</h1>

<h2>User List</h2>
<table border="1">
    <tr>
        <th>Name</th>
        <th>Address</th>
        <th>City</th>
        <th>Phone</th>
        <th>Email</th>
        <th>Password</th>
        <th>Action</th>
    </tr>
    <%
        List<Users> users = (List<Users>) request.getAttribute("users");
        if (users != null && !users.isEmpty()) {
            for (Users user : users) {
    %>
        <tr>
            <td><%= user.getName() %></td>
            <td><%= user.getAddress() %></td>
            <td><%= user.getCity() %></td>
            <td><%= user.getPhone() %></td>
            <td><%= user.getEmail() %></td>
            <td><%= user.getPassword() %></td>
            <td>
                <!-- Delete Form -->
                <form action="AdminUserServlet" method="post" style="display:inline;">
                    <input type="hidden" name="email" value="<%= user.getEmail() %>">
                    <input type="hidden" name="action" value="delete">
                    <button type="submit">Delete</button>
                </form>
            </td>
        </tr>
    <%
            }
        } else {
    %>
        <tr>
            <td colspan="7">No users found.</td>
        </tr>
    <%
        }
    %>
</table>

<h2>Add User</h2>
<form action="AdminUserServlet" method="post">
    <input type="hidden" name="action" value="add">
    <input type="text" name="name" placeholder="Name" required><br>
    <input type="text" name="address" placeholder="Address" required><br>
    <input type="text" name="city" placeholder="City" required><br>
    <input type="text" name="phone" placeholder="Phone" required><br>
    <input type="email" name="email" placeholder="Email" required><br>
    <input type="password" name="password" placeholder="Password" required><br>
    <button type="submit">Add User</button>
</form>

<h2>Edit User</h2>
<form action="AdminUserServlet" method="post">
    <input type="hidden" name="action" value="update">
    <input type="text" name="name" placeholder="Name" required><br>
    <input type="text" name="address" placeholder="Address" required><br>
    <input type="text" name="city" placeholder="City" required><br>
    <input type="text" name="phone" placeholder="Phone" required><br>
    <input type="email" name="email" placeholder="Email" required><br>
    <input type="password" name="password" placeholder="Password" required><br>
    <button type="submit">Update User</button>
</form>

<%-- Show messages --%>
<%
    String message = (String) request.getAttribute("message");
    if (message != null) {
%>
    <p style="color: green;"><%= message %></p>
<%
    }
%>

</body>
</html>