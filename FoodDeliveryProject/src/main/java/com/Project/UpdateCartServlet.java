package com.Project;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Map;

public class UpdateCartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the current session
        HttpSession session = request.getSession();

        // Retrieve the cart from the session
        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");

        // Check if the cart exists
        if (cart != null) {
            // Get the menuId and the updated quantity from the request
            int menuId = Integer.parseInt(request.getParameter("menuId"));
            int newQuantity = Integer.parseInt(request.getParameter("quantity"));

            // If the cart contains the item, update its quantity
            if (cart.containsKey(menuId)) {
                CartItem item = cart.get(menuId);
                item.setQuantity(newQuantity); // Update the quantity
                cart.put(menuId, item); // Save the updated item back to the cart
            }

            // Save the updated cart back to the session
            session.setAttribute("cart", cart);
        }

        // Redirect back to the Cart page after the update
        response.sendRedirect("Cart.jsp");
    }
}
