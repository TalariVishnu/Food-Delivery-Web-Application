<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Error</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8d7da;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .error-container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            border: 2px solid #dc3545;
        }

        h1 {
            color: #dc3545;
            margin-bottom: 10px;
        }

        p {
            color: #6c757d;
        }

        .btn {
            margin-top: 15px;
            padding: 10px 20px;
            background-color: #dc3545;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: 0.3s;
        }

        .btn:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <h1>Incorrect Password</h1>
        <p>The password you entered is incorrect. Please try again.</p>
        <form action="Login.jsp">
            <button type="submit" class="btn">Try Again</button>
        </form>
    </div>
</body>
</html>
