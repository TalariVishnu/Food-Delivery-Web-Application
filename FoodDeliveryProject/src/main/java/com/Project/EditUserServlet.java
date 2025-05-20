package com.Project;

import com.Model.User;
import com.DAO.UserDAO;
import com.DAOImplementation.UserImplementation;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class EditUserServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Get user details from the session
        User currentUser = (User) req.getSession().getAttribute("userDetails");

        if (currentUser != null) {
            String name = req.getParameter("name");
            String username = req.getParameter("username");
            String email = req.getParameter("email");
            String phone = req.getParameter("phone");
            String address = req.getParameter("address");
            String password = req.getParameter("password");

            // If password is empty, don't update the password
            if (password == null || password.isEmpty()) {
                password = currentUser.getPassword(); // Keep the existing password
            }

            // Create a new User object with the updated information
            User updatedUser = new User(name, username, password, email, phone, address, currentUser.getRole());
            updatedUser.setUserId(currentUser.getUserId());

            // Update the user details in the database
            UserImplementation userDAO = new UserImplementation();
            userDAO.updateUser(updatedUser);

            // Update the user details in the session
            req.getSession().setAttribute("userDetails", updatedUser);

            // Redirect to the Profile page after successful update
            resp.sendRedirect("Profile.jsp");
        } else {
            resp.sendRedirect("LoginPage.jsp");
        }
    }
}

