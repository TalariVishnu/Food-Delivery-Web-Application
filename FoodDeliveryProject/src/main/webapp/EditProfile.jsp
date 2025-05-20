<%@ page import="com.Model.User" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f4f4f4;
            color: #1f2937;
            margin: 0;
            padding: 0;
        }

        h2 {
            text-align: center;
            margin: 2rem 0;
            color: Black;
            font-size: 2rem;
        }

        form {
            background-color: #ffffff;
            max-width: 500px;
            margin: auto;
            padding: 2rem;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }

        div {
            margin-bottom: 1.5rem;
        }

        label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 600;
        }

        input[type="text"],
        input[type="email"],
        input[type="tel"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            font-size: 1rem;
            border: 1px solid #d1d5db;
            border-radius: 8px;
            outline: none;
            transition: border-color 0.3s ease;
        }

        input:focus {
            border-color: #2563eb;
        }

        button {
            width: 100%;
            padding: 12px;
            font-size: 1rem;
            color: #fff;
            background-color: #2563eb;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-top: 1rem;
        }

        button:hover {
            background-color: #1e40af;
        }

        .button-links {
            max-width: 500px;
            margin: 1.5rem auto 2rem;
            display: flex;
            justify-content: space-between;
        }

        .btn-link {
            padding: 10px 20px;
            font-size: 1rem;
            color: #fff;
            background-color: #10b981;
            text-decoration: none;
            border-radius: 8px;
            transition: background-color 0.3s ease;
        }

        .btn-link:hover {
            background-color: #059669;
        }

        @media (max-width: 600px) {
            form {
                padding: 1.5rem;
            }

            .button-links {
                flex-direction: column;
                gap: 1rem;
                align-items: center;
            }

            .btn-link {
                width: 100%;
                text-align: center;
            }
        }
    </style>
</head>
<body>
    <h2>Edit Profile</h2>

    <%
        User userDetails = (User) session.getAttribute("userDetails");
        if (userDetails != null) {
    %>
        <form action="EditUserServlet" method="POST">
            <div>
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" value="<%= userDetails.getName() %>" required>
            </div>

            <div>
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" value="<%= userDetails.getUsername() %>" required>
            </div>

            <div>
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="<%= userDetails.getEmail() %>" required>
            </div>

            <div>
                <label for="phone">Phone:</label>
                <input type="tel" id="phone" name="phone" value="<%= userDetails.getPhone() %>" required>
            </div>

            <div>
                <label for="address">Address:</label>
                <input type="text" id="address" name="address" value="<%= userDetails.getAddress() %>" required>
            </div>

            <div>
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" placeholder="Leave blank to keep current password">
            </div>

            <button type="submit">Update Profile</button>
        </form>

     <div class="button-container">
        <a href="Home.jsp" class="btn-link">Home</a>
        <a href="javascript:history.back()" class="btn-link">Back</a>
    </div>
    <%
        } else {
    %>
        <p style="text-align: center; color: #fff;">No user details found. Please log in.</p>
    <%
        }
    %>
</body>
</html>
