package com.Project;

import java.io.IOException;
import java.util.List;

import com.DAOImplementation.OrderImplementation;
import com.Model.Order;
import com.Model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class ShowOrders extends HttpServlet 
{	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		HttpSession session = req.getSession();
        User user = (User) session.getAttribute("LoggedInUser");
        int uid = user.getUserId();
		
		OrderImplementation orderimp = new OrderImplementation();
		List<Order> orderslist = orderimp.getAllOrdersByUser(uid);
		
		session.setAttribute("orderslist", orderslist);
		
		resp.sendRedirect("OrdersHistory.jsp");
	}
}
