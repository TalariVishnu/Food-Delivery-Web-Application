<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Registration Failed</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f8d7da; /* Light red background */
        text-align: center;
        padding: 50px;
    }
    h1 {
        color: #721c24;
        background-color: #f8d7da;
        border: 1px solid #f5c6cb;
        padding: 15px;
        display: inline-block;
        border-radius: 5px;
    }
    .error-box {
        color: #721c24;
        background-color: #f8d7da;
        border: 1px solid #f5c6cb;
        padding: 15px;
        display: inline-block;
        border-radius: 5px;
        font-size: 18px;
        margin-top: 20px;
    }
    .btn {
        font-size: 16px;
        padding: 10px 20px;
        background-color: #dc3545; /* Bootstrap danger red */
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: 0.3s;
        text-decoration: none;
        display: inline-block;
        margin-top: 20px;
    }
    .btn:hover {
        background-color: #c82333; /* Darker red */
    }
</style>
</head>
<body>

    <h1>Failed to Add New User</h1>

    <% String errorMessage = (String) request.getAttribute("errorMessage"); 
       if (errorMessage != null) { %>
        <div class="error-box">
            <p>Error: <%= errorMessage %></p>
        </div>
    <% } %>

    <!-- Retry Button to Redirect to sign.jsp -->
    <form action="sign.jsp">
        <button type="submit" class="btn">Retry</button>
    </form>

</body>
</html>
