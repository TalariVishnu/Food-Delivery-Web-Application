<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Placed</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f4f4f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .order-success {
            background-color: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 100%;
            max-width: 450px;
        }

        .order-success h2 {
            color: #28a745;
            font-size: 24px;
            margin-bottom: 20px;
        }

        .order-success p {
            color: #555;
            font-size: 16px;
            margin-bottom: 30px;
        }

        .order-success a {
            font-size: 18px;
            color: #fff;
            background-color: #28a745;
            padding: 10px 25px;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .order-success a:hover {
            background-color: #218838;
        }

        .order-success a:active {
            background-color: #1e7e34;
        }
    </style>
</head>
<body>
    <div class="order-success">
        <h2>Your order has been successfully placed!</h2>
        <p>Thank you for your purchase. You will receive a confirmation email shortly.</p>
        <a href="Home.jsp">Go to Home</a>
    </div>
</body>
</html>
