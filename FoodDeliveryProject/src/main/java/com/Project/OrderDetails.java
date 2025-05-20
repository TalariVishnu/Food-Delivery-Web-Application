package com.Project;

import java.io.IOException;
import java.util.List;

import com.DAOImplementation.OrderItemImplementation;
import com.Model.OrderItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class OrderDetails extends HttpServlet 
{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
	    HttpSession Session = req.getSession();
	    int oid = Integer.parseInt(req.getParameter("orderId"));
	    
	    OrderItemImplementation orditmimp = new OrderItemImplementation();
	    List<OrderItem> ordersdatails = orditmimp.getAllOrderItemsByOrder(oid);
	    
	    Session.setAttribute("orditmimp", ordersdatails); 

	    resp.sendRedirect("OrderDetails.jsp");
	}

}
