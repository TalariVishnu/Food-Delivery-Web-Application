<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.HashSet, java.util.Set, com.Model.Menu" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Menu Page</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }

    .navbar {
        display: flex;
        align-items: center;
        justify-content: space-between;
        background-color: gray;
        padding: 10px 20px;
        color: white;
    }

    .nav-left, .nav-right {
        display: flex;
        align-items: center;
        gap: 15px;
    }

    .nav-middle {
        flex-grow: 1;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .nav-left a, .nav-right a {
        text-decoration: none;
        color: white;
        background: #28a745;
        padding: 8px 15px;
        border-radius: 5px;
        transition: background 0.3s;
    }

    .nav-left a:hover, .nav-right a:hover {
        background: #218838;
    }

    .search-bar form {
        display: flex;
        align-items: center;
    }

    .search-bar input[type="text"] {
        padding: 6px 10px;
        font-size: 14px;
        border-radius: 5px;
        border: 1px solid #ddd;
        width: 500px; /* Increased width */
        margin-right: 8px;
    }

    .search-bar button {
        padding: 6px 12px;
        background-color: #28a745;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    .search-bar button:hover {
        background-color: #218838;
    }

    h1 {
        text-align: center;
        color: #333;
        padding-top: 20px;
        font-size: 32px;
    }

    .menu-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        gap: 30px;
        padding: 20px;
    }

    .menu-item {
        border: 1px solid #ddd;
        border-radius: 8px;
        padding: 15px;
        width: 300px;
        background: white;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        text-align: center;
        transition: transform 0.3s ease-in-out;
    }

    .menu-item:hover {
        transform: scale(1.05);
    }

    .menu-item img {
        width: 100%;
        height: 200px;
        border-radius: 8px;
        object-fit: cover;
        margin-bottom: 15px;
    }

    .menu-item h3 {
        font-size: 20px;
        color: #333;
        margin-bottom: 10px;
    }

    .menu-item p {
        font-size: 16px;
        color: #666;
        margin-bottom: 10px;
    }

    .price {
        font-size: 18px;
        color: #28a745;
        font-weight: bold;
        margin-bottom: 15px;
    }

    .menu-item form {
        display: flex;
        flex-direction: column;
        gap: 10px;
        align-items: center;
    }

    .menu-item input[type="number"] {
        width: 80%;
        padding: 5px;
        font-size: 14px;
        border: 1px solid #ddd;
        border-radius: 5px;
        text-align: center;
    }

    .menu-item button {
        background-color: #28a745;
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        transition: background 0.3s;
        width: 80%;
    }

    .menu-item button:hover {
        background-color: #218838;
    }

    .no-data {
        color: red;
        font-size: 18px;
        margin-top: 20px;
        text-align: center;
    }
</style>
</head>
<body>

<h1>Menu List</h1>

<!-- Navigation bar -->
<div class="navbar">
    <div class="nav-left">
        <a href="javascript:history.back()">← Back</a>
        <a href="Home.jsp">🏠 Home</a>
    </div>

    <div class="nav-middle">
        <input type="text" class="search-bar" placeholder="Search by Menu name...">
        <button class="search-btn"> 🔍 Search</button>
    </div>

    <div class="nav-right">
        <a href="Cart.jsp">🛒 Cart</a>
    </div>
</div>

<!-- Menu Container -->
<div class="menu-container">
<%
    List<Menu> menuList = (List<Menu>) session.getAttribute("MenuList");

    if (menuList == null || menuList.isEmpty()) {
%>
    <p>No menu data available.</p>
<%
    } else {
        Set<Integer> displayedMenuIds = new HashSet<>();

        for (Menu menu : menuList) {
            if (displayedMenuIds.contains(menu.getMenuId())) continue;
            displayedMenuIds.add(menu.getMenuId());
%>
        <div class="menu-item" data-name="<%= menu.getItemName().toLowerCase() %>">
            <img src="<%= menu.getImagePath() %>" alt="<%= menu.getItemName() %>" />
            <h3><%= menu.getItemName() %></h3>
            <p><strong>Ratings:</strong> <%= menu.getRatings() %> ⭐</p>
            <p><strong>Availability:</strong> <%= menu.getIsAvailable() %></p>
            <p><strong>Description:</strong> <%= menu.getDescription() %></p>
            <div class="price">₹<%= menu.getPrice() %></div>
            <form action="CartServlet" method="post">
                <input type="hidden" name="Menuid" value="<%= menu.getMenuId() %>">
                <label for="quantity<%= menu.getMenuId() %>">Quantity:</label>
                <input type="number" id="quantity<%= menu.getMenuId() %>" name="quantity" value="1" min="1" max="14">
                <button type="submit">Add to Cart</button>
            </form>
        </div>
<%
        }
    }
%>
</div>

<script>
    const searchBar = document.querySelector('.search-bar');
    const searchButton = document.querySelector('.search-btn');
    const menuItems = document.querySelectorAll('.menu-item');

    function filterMenuItems() {
        const searchTerm = searchBar.value.toLowerCase();
        let matchFound = false;

        menuItems.forEach(item => {
            const name = item.getAttribute('data-name');
            const matches = name.includes(searchTerm);
            item.style.display = matches ? 'block' : 'none';
            if (matches) matchFound = true;
        });

        // Handle no matches
        const noDataMsg = document.querySelector('.no-data');
        if (!matchFound && searchTerm.length > 0) {
            if (!noDataMsg) {
                const msg = document.createElement('p');
                msg.className = 'no-data';
                msg.textContent = 'No matching menu items found.';
                document.querySelector('.menu-container').appendChild(msg);
            }
        } else {
            if (noDataMsg) noDataMsg.remove();
        }
    }

    searchBar.addEventListener('input', filterMenuItems);
    searchButton.addEventListener('click', filterMenuItems);
</script>

</body>
</html>
