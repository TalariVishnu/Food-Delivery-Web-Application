<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.Model.User" %>
<%
    HttpSession sessionObj = request.getSession(false);

    if (sessionObj == null) {
        response.sendRedirect("Login.jsp");
        return;
    }

    User user = (User) sessionObj.getAttribute("LoggedInUser");
    if (user == null) {
        response.sendRedirect("Login.jsp");
        return;
    }

    Integer restaurantId = (Integer) sessionObj.getAttribute("restaurantId");
    if (restaurantId == null) {
        response.sendRedirect("Login.jsp");
        return;
    }

    int userId = user.getUserId();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Check Out</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 30px;
            background-color: gray;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        .nav-btn, .back-btn {
            background-color: #2c3e50;
            color: white;
            padding: 10px 18px;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            font-size: 16px;
            transition: background-color 0.3s ease-in-out;
        }

        .nav-btn:hover, .back-btn:hover {
            background-color: #3498db;
        }

        .container {
            background-color: #fff;
            max-width: 500px;
            margin: 40px auto;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 12px rgba(0,0,0,0.1);
        }

        h2 {
            color: #2c3e50;
            margin-bottom: 25px;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
            text-align: left;
            color: #333;
        }

        textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
            resize: none;
        }

        .payment-options {
            display: flex;
            justify-content: space-between;
            margin-top: 10px;
            flex-wrap: wrap;
        }

        .payment-options label {
            display: flex;
            align-items: center;
            gap: 6px;
            font-weight: normal;
            font-size: 15px;
        }

        input[type="radio"] {
            accent-color: #28a745;
        }

        button {
            width: 100%;
            background-color: #28a745;
            color: white;
            font-size: 16px;
            font-weight: bold;
            border: none;
            padding: 12px;
            margin-top: 25px;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out;
        }

        button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

    <div class="header">
        <a href="javascript:history.back()" class="back-btn">← Back</a>
        <a href="Home.jsp" class="nav-btn">🏠 Home</a>
    </div>

    <div class="container">
        <h2>Confirm Address & Payment</h2>
        <form action="ConformOrderServlet" method="post">
            <input type="hidden" name="userId" value="<%= userId %>">
            <input type="hidden" name="restaurantId" value="<%= restaurantId %>">

            <label for="address">Enter Address:</label>
            <textarea id="address" name="address" rows="4" required></textarea>

            <label>Select Payment Mode:</label>
            <div class="payment-options">
                <label><input type="radio" name="paymentMode" value="PhonePe" required> PhonePe</label>
                <label><input type="radio" name="paymentMode" value="Paytm"> Paytm</label>
                <label><input type="radio" name="paymentMode" value="GPay"> GPay</label>
                <label><input type="radio" name="paymentMode" value="COD"> COD</label>
            </div>

            <button type="submit">Place Order</button>
        </form>
    </div>

</body>
</html>
