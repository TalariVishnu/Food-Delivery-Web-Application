<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.Model.Order" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Orders History</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
            text-align: center;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 30px;
        }

        .home-btn, .back-btn {
            background-color: #2c3e50;
            color: white;
            padding: 10px 18px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            font-size: 16px;
            transition: background-color 0.3s ease-in-out;
        }

        .home-btn:hover, .back-btn:hover {
            background-color: #3498db;
        }

        h1 {
            color: #2c3e50;
            margin-bottom: 30px;
            flex-grow: 1;
            text-align: center;
        }

        table {
            width: 80%;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            overflow: hidden;
        }

        th, td {
            padding: 12px 15px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #2c3e50;
            color: white;
            font-size: 16px;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        td {
            font-size: 15px;
            color: #333;
        }

        .no-orders {
            color: red;
            font-size: 18px;
            margin-top: 40px;
        }

        .order-details-btn {
            display: inline-block;
            padding: 6px 10px;
            background-color: #3498db;
            color: white;
            text-decoration: none;
            border: none;
            border-radius: 4px;
            font-size: 14px;
            transition: background-color 0.3s ease-in-out;
        }

        .order-details-btn:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>

<div class="header">
    <a href="javascript:history.back()" class="back-btn">← Back</a>
    <h1>Orders History</h1>
    <a href="Home.jsp" class="home-btn">🏠 Home</a>
</div>

<%
    List<Order> orderslist = (List<Order>) session.getAttribute("orderslist");

    if (orderslist == null || orderslist.isEmpty()) {
%>
    <p class="no-orders">No orders found.</p>
<%
    } else {
%>
    <table>
        <tr>
            <th>Order ID</th>
            <th>Status</th>
            <th>Date</th>
            <th>Action</th>
        </tr>
<%
        for (Order order : orderslist) {
%>
        <tr>
            <td><%= order.getOrderId() %></td>
            <td><%= order.getStatus() %></td>
            <td><%= order.getOrderDate() %></td>
            <td>
                <a href="OrderDetails?orderId=<%= order.getOrderId() %>" class="order-details-btn">View Details</a>
            </td>
        </tr>
<%
        }
    }
%>
    </table>

</body>
</html>
