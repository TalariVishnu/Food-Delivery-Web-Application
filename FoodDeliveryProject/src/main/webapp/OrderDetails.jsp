<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.Model.OrderItem" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Item Details</title>
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

        .nav-btn {
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

        .nav-btn:hover {
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

        .no-data {
            color: red;
            font-size: 18px;
            margin-top: 40px;
        }

        /* Styling for the Back button */
        .btn {
            background-color: #2c3e50; 
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            text-decoration: none;
            transition: background-color 0.3s ease-in-out;
        }

        .btn:hover {
            background-color: #3498db; 
        }
    </style>
</head>
<body>

<div class="header">
    <a href="javascript:history.back()" class="btn">← Back</a>
    <h1>Order Item Details</h1>
    <a href="Home.jsp" class="nav-btn">🏠 Home</a>
</div>

<%
    List<OrderItem> ordDetails = (List<OrderItem>) session.getAttribute("orditmimp");

    if (ordDetails == null || ordDetails.isEmpty()) {
%>
    <p class="no-data">No order item details available.</p>
<%
    } else {
%>
    <table>
        <tr>
            <th>Order Item ID</th>
            <th>Menu ID</th>
            <th>Order ID</th>
            <th>Quantity</th>
            <th>Total Price</th>
        </tr>
<%
        for (OrderItem orderdetails : ordDetails) {
%>
        <tr>
            <td><%= orderdetails.getOrderItemId() %></td>
            <td><%= orderdetails.getMenuId() %></td>
            <td><%= orderdetails.getOrderId() %></td>
            <td><%= orderdetails.getQuantity() %></td>
            <td><%= orderdetails.getTotalPrice() %></td>
        </tr>
<%
        }
    }
%>
    </table>

</body>
</html>
