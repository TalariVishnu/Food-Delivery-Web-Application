package com.Project;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.DAOImplementation.UserImplementation;
import com.Model.User;

public class Login extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        UserImplementation userImp = new UserImplementation();
        User user = userImp.getUserByEmailAndPassword(email, password);

        if (user != null) 
        {
            HttpSession session = req.getSession();
            session.setAttribute("LoggedInUser", user);
            session.setAttribute("userId", user.getUserId());

            if (session.getAttribute("restaurantId") == null) 
            {
                session.setAttribute("restaurantId", 1); 
            }
            resp.sendRedirect("GetRestaurant"); 
        } 
        else 
        {
            resp.sendRedirect("invaliduser.jsp");
        }
    }
}
