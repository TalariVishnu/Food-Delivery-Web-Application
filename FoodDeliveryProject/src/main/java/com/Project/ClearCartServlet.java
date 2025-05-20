package com.Project;

import java.io.IOException;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class ClearCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false); // Get existing session

        if (session != null) {
            @SuppressWarnings("unchecked")
            Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");

            if (cart != null) {
                cart.clear(); // Clear the map
            }

            // Optionally, remove the cart completely from session
            session.removeAttribute("cart");
        }

        // Redirect back to Cart page after clearing
        response.sendRedirect("Cart.jsp");
    }
}
