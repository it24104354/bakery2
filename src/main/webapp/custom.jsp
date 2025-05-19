<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bakery & Custom Cake Booking</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
        }
        .hero {
            background: url('images/bakery-banner.jpg') no-repeat center center/cover;
            height: 400px;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            color: white;
            font-size: 2rem;
            font-weight: bold;
            text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.7);
        }
        .section {
            padding: 50px 0;
        }
        .card img {
            height: 200px;
            object-fit: cover;
        }
        .footer {
            background: #343a40;
            color: white;
            padding: 20px;
            text-align: center;
        }
    </style>
</head>
<body>

<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="home.jsp">Bakery Delights</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="home.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="custom.jsp">Custom Cakes</a></li>
                <li class="nav-item"><a class="nav-link" href="BakeryOrder.jsp">Order</a></li>
                <li class="nav-item"><a class="nav-link" href="profile.jsp">Profile</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Hero Section -->
<div class="hero">
    <div>Welcome to Our Bakery - Freshly Baked Happiness!</div>
</div>

<!-- Featured Cakes Section -->
<section class="section container">
    <h2 class="text-center mb-4">Featured Cakes</h2>
    <div class="row">
        <div class="col-md-4">
            <div class="card">
                <img src="images/images1.jpg"  alt="Chocolate Cake">
                <div class="card-body">
                    <h5 class="card-title">Chocolate Delight</h5>
                    <p class="card-text">A rich and moist chocolate cake toped with creamy ganache.</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <img src="images/download.jpg" class="card-img-top" alt="Vanilla Cake">
                <div class="card-body">
                    <h5 class="card-title">Vanilla Bliss</h5>
                    <p class="card-text">A classic vanilla sponge cake with a butter frosting.</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <img src="images/images2.jpg" class="card-img-top" alt="Red Velvet Cake">
                <div class="card-body">
                    <h5 class="card-title">Red Velvet Love</h5>
                    <p class="card-text">Smooth, velvet texture with a hint of cocoa and creamy cheese frosting.</p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Order Custom Cake Section -->
<section class="section bg-light text-center">
    <h2>Order Your Custom Cake</h2>
    <p>Design your dream cake with our expert bakers. Choose flavors,  and decorations to make it special!</p>
    <a href="cakeBooking.jsp" class="btn btn-primary">Customize Your Cake</a>
</section>

<!-- Footer -->
<footer class="footer">
    <p>&copy; 2025 Bakery Delights. All Rights Reserved.</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>