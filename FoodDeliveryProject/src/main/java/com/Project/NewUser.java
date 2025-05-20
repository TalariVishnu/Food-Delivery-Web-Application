package com.Project;

import java.io.IOException;

import com.DAOImplementation.UserImplementation;
import com.Model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class NewUser extends HttpServlet 
{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		User user = new User(req.getParameter("name"), 
				req.getParameter("username"), req.getParameter("email"), 
				req.getParameter("password"), req.getParameter("phone"), null, null);
		
		UserImplementation userimp = new UserImplementation();
		int x = userimp.addUser(user);
		
		if(x==1)
		{
			resp.sendRedirect("Success.jsp");
		}
		else
		{
			resp.sendRedirect("Failure.jsp");
		}
	}
}

