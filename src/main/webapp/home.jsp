<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bakery Delights</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #fffaf0;
        }
        .navbar {
            background-color: #ffcc99;
        }
        .hero {
            background: url('bakery-background.jpg') center/cover no-repeat;
            height: 400px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            text-shadow: 2px 2px 5px #000;
        }
        .section {
            padding: 60px 20px;
            text-align: center;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container">
            <a class="navbar-brand fw-bold" href="#">Bakery Delights</a>
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

    <div id="home" class="hero">
        <h1>Delicious Cakes & Pastries Just for You</h1>
    </div>

    <section id="about" class="section">
        <div class="container">
            <h2>About Us</h2>
            <p>We bake the finest cakes and pastries with love and quality ingredients.</p>
        </div>
    </section>

    <section id="customization" class="section bg-light">
        <div class="container">
            <h2>Customize Your Cake</h2>
            <p>Choose your flavor, size, and design to make your special occasion even sweeter.</p>
        </div>
    </section>

    <section id="order" class="section">
        <div class="container">
            <h2>Place Your Order</h2>
            <p>Order now and get your cake delivered fresh and delicious!</p>
        </div>
    </section>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
