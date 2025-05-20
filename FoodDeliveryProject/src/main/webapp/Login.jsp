<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<style>
/* General Page Styling */
body {
	font-family: Arial, sans-serif;
	background-color: #e8f5e9; /* Light Mint Green */
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
}

/* Login Container */
.login-container {
	background: #ffffff; /* White for the card */
	padding: 25px;
	border-radius: 12px;
	box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.2);
	width: 320px;
	text-align: center;
}

/* Heading */
h2 {
	margin-bottom: 20px;
	color: #222; /* Dark Gray Text */
	font-size: 22px;
}

/* Input Fields */
input[type="email"], input[type="password"] {
	width: 90%;
	padding: 12px;
	margin: 10px 0;
	border: 1px solid #ccc; /* Light Gray Border */
	border-radius: 6px;
	font-size: 15px;
	outline: none;
}

/* Submit Button */
input[type="submit"] {
	width: 100%;
	background: #007bff; /* Blue */
	color: white;
	padding: 12px;
	border: none;
	border-radius: 6px;
	cursor: pointer;
	font-size: 16px;
	transition: background 0.3s ease;
}

/* Button Hover Effect */
input[type="submit"]:hover {
	background: #0056b3; /* Dark Blue */
}

/* Responsive Design */
@media ( max-width : 400px) {
	.login-container {
		width: 90%;
	}
}
</style>
</head>
<body>

	<div class="login-container">
		<h2>Login</h2>
		<form action="Login">
			<input type="email" name="email" placeholder="Enter Email" required><br>
			<input type="password" name="password" placeholder="Enter Password" required><br> 
			<input type="submit" value="Login">
		</form>
	</div>

</body>
</html>
