package com.Project;

import java.io.IOException;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class DeleteCartServlet extends HttpServlet 
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");

        if (cart != null) {
            int menuId = Integer.parseInt(request.getParameter("menuId"));

            // Remove the item from the cart
            if (cart.containsKey(menuId)) {
                cart.remove(menuId); // Remove the cart item based on the menuId
            }

            session.setAttribute("cart", cart); // Save updated cart back to session
        }

        response.sendRedirect("Cart.jsp"); // Redirect back to the cart page
    }
}
