package com.Project;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.DAOImplementation.RestaurantImplementation;
import com.Model.Restaurant;


public class GetRestaurant extends HttpServlet 
{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
			RestaurantImplementation resimp =  new RestaurantImplementation();
			List<Restaurant> res = resimp.getAllRestaurants();
			
				HttpSession session = req.getSession();
				session.setAttribute("restaurantList", res);
				resp.sendRedirect("Home.jsp");
	}
}


