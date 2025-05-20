package com.Project;

import com.Model.*;
import com.DAOImplementation.OrderImplementation;
import com.DAOImplementation.OrderItemImplementation;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.*;

public class ConformOrderServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    try {
	        HttpSession session = request.getSession();
	        User user = (User) session.getAttribute("LoggedInUser");
	        Integer restaurantId = (Integer) session.getAttribute("restaurantId");

	        if (user == null || restaurantId == null) 
	        {
	            response.sendRedirect("Login.jsp");
	            return;
	        }

	        Map<Integer, CartItem> cartMap = (Map<Integer, CartItem>) session.getAttribute("cart");

	        if (cartMap == null || cartMap.isEmpty()) 
	        {
	            response.sendRedirect("CheckOut.jsp?message=Cart+is+empty");
	            return;
	        }

	        List<OrderItem> orderItems = new ArrayList<>();
	        int totalAmount = 0;

	        for (CartItem cartItem : cartMap.values()) 
	        {
	            OrderItem orderItem = new OrderItem();
	            orderItem.setMenuId(cartItem.getMenuId());
	            orderItem.setQuantity(cartItem.getQuantity());
	            orderItem.setTotalPrice((int) cartItem.getPrice());
	            totalAmount += cartItem.getPrice();
	            orderItems.add(orderItem);
	        }

	        String paymentMode = request.getParameter("paymentMode");

	        Order order = new Order();
	        order.setUserId(user.getUserId());
	        order.setRestaurantId(restaurantId);  
	        order.setOrderDate(new Date());
	        order.setTotalAmount(totalAmount);
	        order.setStatus("Placed");
	        order.setPaymentMode(paymentMode);

	        OrderImplementation orderImp = new OrderImplementation();
	        int orderId = orderImp.addOrderAndReturnId(order);

	        if (orderId != -1) 
	        {
	            OrderItemImplementation orderItemImp = new OrderItemImplementation();
	            for (OrderItem item : orderItems) {
	                item.setOrderId(orderId);
	                orderItemImp.addOrderItem(item);
	            }

	            session.removeAttribute("cart");

	            response.sendRedirect("orderSuccess.jsp?message=Your+order+has+been+successfully+placed!");
	        } 
	        else 
	        {
	            response.sendRedirect("CheckOut.jsp?message=Order+failed!+Please+try+again.");
	        }

	    } 
	    catch (Exception e) 
	    {
	        e.printStackTrace();
	        response.sendRedirect("CheckOut.jsp?message=Internal+Error+Occurred!");
	    }
	}

}
