<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>The Sweet Tooth</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        /* Navbar Enhancements */
        .navbar-brand {
            font-weight: bold;
            color: #FFD700 !important; /* Gold */
        }

        .navbar-nav .nav-link {
            color: #ffcccb !important; /* Soft Pink */
            font-weight: 600;
            transition: color 0.3s ease-in-out;
        }

        .navbar-nav .nav-link:hover {
            color: #ff4d4d !important; /* Reddish effect on hover */
        }

        /* Hero Section Enhancements */
        .hero {
            padding: 100px 0;
            text-align: center;
        }

        .hero h1 {
            color: #ff4d4d; /* Elegant Red */
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);
            font-size: 3rem;
        }

        .hero p {
            color: #f8f9fa;
            font-size: 1.2rem;
            letter-spacing: 1px;
        }

        /* Button Enhancements */
        .btn-primary {
            background: linear-gradient(to right, #ff416c, #ff4b2b); /* Stylish Gradient */
            border: none;
            padding: 10px 20px;
            font-weight: bold;
            transition: transform 0.2s;
        }

        .btn-primary:hover {
            transform: scale(1.05);
        }
    </style>
</head>
<body style="background-color:powderblue; background-size: cover; background-position: center;">



<!-- Hero Section -->
<header class="hero">
    <div class="container text-center">
        <h1><b>Love At First Bite</b></h1>
        <br><br>
        <h1 style="color:pink;"><b>Welcome To Our SweetTooth Bakery</b></h1>
        <br>
        <p style="background-color:yellow;"><b>Freshly baked with love and care, just for you.</b></p>
        <a href="login.jsp" class="btn btn-primary">Log in</a>


    </div>
</header>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>