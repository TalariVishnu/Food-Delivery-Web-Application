<%@ page import="com.Model.User" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
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

        .profile-container {
            background-color: #ffffff;
            padding: 2rem 2.5rem;
            border-radius: 12px;
            max-width: 500px;
            margin: auto;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }

        .profile-container p {
            margin: 1rem 0;
            font-size: 1rem;
            color: #374151;
        }

        .profile-container p strong {
            display: inline-block;
            width: 100px;
            color: #111827;
        }

        .button-container {
            margin: 2rem auto;
            display: flex;
            justify-content: center;
            gap: 1rem;
        }

        .btn {
            padding: 10px 22px;
            font-size: 16px;
            font-weight: 500;
            text-decoration: none;
            color: white;
            background-color: #2563eb;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn:hover {
            background-color: #1e40af;
        }

        .edit-btn {
            background-color: #10b981;
            margin-top: 1.5rem;
            display: inline-block;
        }

        .edit-btn:hover {
            background-color: #047857;
        }

        @media (max-width: 600px) {
            .profile-container {
                padding: 1.5rem;
            }

            .btn {
                width: 100%;
                text-align: center;
            }

            .button-container {
                flex-direction: column;
                gap: 0.75rem;
            }
        }
    </style>
</head>
<body>
    <h2>User Profile</h2>

    <%
        User userDetails = (User) session.getAttribute("userDetails");
        if (userDetails != null) {
    %>
        <div class="profile-container">
            <p><strong>Name:</strong> <%= userDetails.getName() %></p>
            <p><strong>Username:</strong> <%= userDetails.getUsername() %></p>
            <p><strong>Email:</strong> <%= userDetails.getEmail() %></p>
            <p><strong>Phone:</strong> <%= userDetails.getPhone() %></p>
            <p><strong>Address:</strong> <%= userDetails.getAddress() %></p>

            <a href="EditProfile.jsp" class="btn edit-btn">Edit Profile</a>
        </div>
    <% 
        } else { 
    %>
        <p style="text-align: center; color: #ffffff;">No user details found. Please log in.</p>
    <%
        }
    %>

    <div class="button-container">
        <a href="Home.jsp" class="btn">Home</a>
        <a href="javascript:history.back()" class="btn">Back</a>
    </div>
</body>
</html>
