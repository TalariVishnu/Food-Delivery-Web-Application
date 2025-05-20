<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Invalid Email</title>
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
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            text-align: center;
            border-left: 6px solid #dc3545;
            max-width: 400px;
        }
        h1 {
            color: #dc3545;
            font-size: 24px;
            margin-bottom: 10px;
        }
        p {
            color: #6c757d;
            font-size: 16px;
            margin-bottom: 20px;
        }
        .btn {
            padding: 10px 20px;
            background-color: #dc3545;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s, transform 0.2s;
        }
        .btn:hover {
            background-color: #c82333;
            transform: scale(1.05);
        }
        .icon {
            font-size: 50px;
            color: #dc3545;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <div class="icon">⚠️</div>
        <h1>Invalid Email</h1>
        <p>The email you entered does not exist. Please sign up.</p>
        <form action="sign.jsp">
            <button type="submit" class="btn">Sign-Up</button>
        </form>
    </div>
</body>
</html>
