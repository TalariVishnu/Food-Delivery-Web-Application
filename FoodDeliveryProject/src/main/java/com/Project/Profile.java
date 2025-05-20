package com.Project;

import java.io.IOException;

import com.DAOImplementation.UserImplementation;
import com.Model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class Profile extends HttpServlet 
{
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        HttpSession session = req.getSession();
        
        Integer uid = (Integer) session.getAttribute("userId");

        if (uid != null) 
        {
            UserImplementation userimp = new UserImplementation();
            User user = userimp.getUser(uid);
            
            session.setAttribute("userDetails", user);
            
            resp.sendRedirect("Profile.jsp");
        }
        else
        {
        	System.out.println("userId not found in session.");
            resp.sendRedirect("error.jsp");
        }
    }
}
