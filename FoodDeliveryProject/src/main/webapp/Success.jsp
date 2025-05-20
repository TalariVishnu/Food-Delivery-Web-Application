<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Success</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #d4edda; /* Light green background */
        text-align: center;
        padding: 50px;
    }
    h1 {
        color: #155724;
        background-color: #c3e6cb; /* Light green box */
        border: 1px solid #155724;
        padding: 15px;
        display: inline-block;
        border-radius: 5px;
        margin-bottom: 20px;
    }
    .btn {
        font-size: 16px;
        padding: 10px 20px;
        background-color: #28a745; /* Bootstrap success green */
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
        background-color: #218838; /* Darker green on hover */
    }
</style>
</head>
<body>

    <h1>Successfully Added New User</h1>  

    <!-- Sign-In Button to Redirect to Login Page -->
    <form action="Login.jsp">
        <button type="submit" class="btn">Sign-In</button>
    </form>

</body>
</html>
