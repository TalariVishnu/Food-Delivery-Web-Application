<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map, com.Project.CartItem" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
        text-align: center;
    }

    .navbar {
        display: flex;
        justify-content: space-between;
        align-items: center;
        background-color: gray;
        padding: 10px 20px;
    }

    .nav-left {
        display: flex;
        gap: 15px;
    }

    .nav-left a {
        text-decoration: none;
        color: white;
        background: #28a745;
        padding: 8px 15px;
        border-radius: 5px;
        transition: background 0.3s;
    }

    .nav-left a:hover {
        background: #218838;
    }

    .navbar h1 {
        color: white;
        margin: 0;
        flex-grow: 1;
        text-align: center;
    }

    .clear-cart-btn {
        background-color: #dc3545;
        color: white;
        padding: 10px 20px;
        font-size: 14px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        margin-left: 20px;
    }

    .clear-cart-btn:hover {
        background-color: #c82333;
    }

    .container {
        width: 90%;
        max-width: 800px;
        margin: 50px auto;
        background: white;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
    }

    h2 {
        color: #333;
        margin-bottom: 20px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        background: white;
        border-radius: 5px;
        overflow: hidden;
    }

    table, th, td {
        border: 1px solid #ddd;
    }

    th, td {
        padding: 12px;
        text-align: center;
    }

    th {
        background: #007BFF;
        color: white;
        font-weight: bold;
    }

    tr:nth-child(even) {
        background: #f8f9fa;
    }

    .total {
        margin-top: 20px;
        font-size: 18px;
        font-weight: bold;
        color: #333;
    }

    .btn {
        text-decoration: none;
        color: white;
        background: #007bff;
        padding: 8px 15px;
        border-radius: 5px;
        cursor: pointer;
        transition: background 0.3s;
        border: none;
    }

    .btn:hover {
        background: #0056b3;
    }

    .update-btn {
        background: #ffc107;
        color: black;
    }

    .update-btn:hover {
        background: #e0a800;
    }

    .delete-btn {
        background: #dc3545;
    }

    .delete-btn:hover {
        background: #c82333;
    }

    .Check-Out {
        background-color: #28a745;
        font-size: 16px;
    }

    .Check-Out:hover {
        background-color: #218838;
    }

    select {
        padding: 5px;
        border-radius: 5px;
        font-size: 14px;
    }
</style>
</head>
<body>

<h1>Your Cart</h1>

<!-- Navigation bar -->
<div class="navbar">
    <div class="nav-left">
        <a href="javascript:history.back()" class="btn">← Back</a>
        <a href="Home.jsp">🏠 Home</a>
        <a href="Cart.jsp">🛒 Cart</a>
    </div>
    <form action="ClearCartServlet" method="post" style="display:inline;">
        <button type="submit" class="clear-cart-btn">Clear Cart</button>
    </form>
</div>

<!-- Cart Container -->
<div class="container">
<%
    Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
    double grandTotal = 0;

    if (cart == null || cart.isEmpty()) {
%>
    <h2>Your cart is empty.</h2>
<%
    } else {
%>
    <h2>Your Cart</h2>
    <table>
        <thead>
            <tr>
                <th>Menu ID</th>
                <th>Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Total Price</th>
                <th>Restaurant ID</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
<%
        for (Map.Entry<Integer, CartItem> ct : cart.entrySet()) {
            CartItem carts = ct.getValue();
            double totalPrice = carts.getPrice() * carts.getQuantity();
            grandTotal += totalPrice;
%>
            <tr>
                <td><%= carts.getMenuId() %></td>
                <td><%= carts.getName() %></td>
                <td>₹<%= carts.getPrice() %></td>
                <td>
                    <form action="UpdateCartServlet" method="post" style="display:inline;">
                        <input type="hidden" name="menuId" value="<%= carts.getMenuId() %>">
                        <select name="quantity">
                            <% for (int i = 1; i <= 14; i++) { %>
                                <option value="<%= i %>" <%= (carts.getQuantity() == i) ? "selected" : "" %>><%= i %></option>
                            <% } %>
                        </select>
                        <button type="submit" class="btn update-btn">Update</button>
                    </form>
                </td>
                <td>₹<%= totalPrice %></td>
                <td><%= carts.getRestaurantId() %></td>
                <td>
                    <form action="DeleteCartServlet" method="post" style="display:inline;">
                        <input type="hidden" name="menuId" value="<%= carts.getMenuId() %>">
                        <button type="submit" class="btn delete-btn">Delete</button>
                    </form>
                </td>
            </tr>
<%
        }
%>
        </tbody>
    </table>

    <div class="total">
        Grand Total: ₹<%= grandTotal %>
    </div>

    <div>
        <form action="CheckOut.jsp" method="get">
            <button type="submit" class="btn Check-Out">Check-Out</button>
        </form>
    </div>
<%
    }
%>
</div>

</body>
</html>
