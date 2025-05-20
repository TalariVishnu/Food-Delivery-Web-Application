<%@ page import="com.Model.Restaurant, com.Model.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            margin: 0;
            padding: 0;
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: gray;
            padding: 10px 20px;
            border-radius: 8px;
        }

        .nav-left, .nav-right {
            display: flex;
            gap: 10px;
        }

        .nav-middle {
            flex-grow: 1;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .navbar a, .navbar button {
            color: white;
            text-decoration: none;
            padding: 10px 15px;
            border: none;
            background: none;
            cursor: pointer;
            font-size: 16px;
            transition: background 0.3s ease-in-out;
        }

        .navbar a:hover, .navbar button:hover {
            background-color: #3498db;
            border-radius: 5px;
        }

        .search-bar {
            width: 80%;
            padding: 8px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 16px;
            margin-right: 10px;
        }

        .search-btn {
            background-color: #28a745;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        .search-btn:hover {
            background-color: #218838;
        }

        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            margin: 30px auto;
            max-width: 1200px;
        }

        .card {
            background: white;
            width: 300px;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            text-align: center;
            transition: transform 0.3s ease-in-out;
        }

        .card:hover {
            transform: scale(1.05);
        }

        .card img {
            width: 100%;
            height: 180px;
            border-radius: 10px;
            object-fit: cover;
        }

        .card h2 {
            margin: 10px 0;
            color: #333;
            font-size: 18px;
        }

        .details {
            font-size: 15px;
            color: #666;
            margin: 5px 0;
        }

        .view-menu-btn {
            display: inline-block;
            margin-top: 10px;
            padding: 10px 15px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            font-size: 14px;
            font-weight: bold;
        }

        .view-menu-btn:hover {
            background-color: #218838;
        }

        .no-data {
            color: red;
            font-size: 20px;
            margin-top: 20px;
        }
    </style>
</head>
<body>

<%
    User user = (User) session.getAttribute("LoggedInUser");
    List<Restaurant> restaurantList = (List<Restaurant>) session.getAttribute("restaurantList");
%>

<h1>Welcome <%= (user != null) ? user.getUsername() : "Guest" %></h1>

<div class="navbar">
    <div class="nav-left">
        <a href="Home.jsp">🏠 Home</a>
    </div>

    <div class="nav-middle">
        <input type="text" class="search-bar" placeholder="Search by restaurant name...">
        <button class="search-btn"> 🔍 Search</button>
    </div>

    <div class="nav-right">
        <button onclick="window.location.href='Profile'">👤 Profile</button>
        <button onclick="window.location.href='Cart.jsp'">🛒 Cart</button>
        <button onclick="window.location.href='ShowOrders'">📦 Orders History</button>
    </div>
</div>

<div class="container" id="restaurantContainer">
    <% if (restaurantList != null && !restaurantList.isEmpty()) {
        for (Restaurant restaurant : restaurantList) {
    %>
        <a href="ShowMenu?id=<%= restaurant.getRestaurantId() %>" style="text-decoration: none; color: inherit;">
            <div class="card" data-name="<%= restaurant.getName().toLowerCase() %>">
                <img src="<%= restaurant.getImagePath() %>" 
                     alt="Restaurant Image" 
                     onerror="this.onerror=null; this.src='images/default-restaurant.jpg';">
                <h2><%= restaurant.getName() %></h2>
                <p class="details">📍 <%= restaurant.getAddress() %></p>
                <p class="details">📞 <%= restaurant.getPhone() %></p>
                <p class="details">⭐ Rating: <%= restaurant.getRating() %></p>
                <p class="details">🍽️ Cuisine: <%= restaurant.getCusineType() %></p>
                <p class="details">⏱️ ETA: <%= restaurant.getEta() %> mins</p>
                <div class="view-menu-btn">View Menu</div>
            </div>
        </a>
    <%  }
    } else { %>
        <p class="no-data">No restaurant data available.</p>
    <% } %>
</div>

<script>
    const searchBar = document.querySelector('.search-bar');
    const searchButton = document.querySelector('.search-btn');
    const cards = document.querySelectorAll('.card');

    function filterCards() {
        const searchTerm = searchBar.value.toLowerCase();
        let matchFound = false;

        cards.forEach(card => {
            const name = card.getAttribute('data-name');
            const matches = name.includes(searchTerm);
            card.parentElement.style.display = matches ? 'block' : 'none';
            if (matches) matchFound = true;
        });

        // Handle no matches
        const noDataMsg = document.querySelector('.no-data');
        if (!matchFound && searchTerm.length > 0) {
            if (!noDataMsg) {
                const msg = document.createElement('p');
                msg.className = 'no-data';
                msg.textContent = 'No matching restaurants found.';
                document.querySelector('.container').appendChild(msg);
            }
        } else {
            if (noDataMsg) noDataMsg.remove();
        }
    }

    searchBar.addEventListener('input', filterCards);
    searchButton.addEventListener('click', filterCards);
</script>

</body>
</html>
