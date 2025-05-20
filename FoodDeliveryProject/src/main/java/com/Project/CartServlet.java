package com.Project;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import com.DAOImplementation.MenuImplementation;
import com.Model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class CartServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        HttpSession session = req.getSession();

        String menuIdParam = req.getParameter("Menuid");
        if (menuIdParam == null) menuIdParam = req.getParameter("menuId");

        String quantityParam = req.getParameter("quantity");
        
        if (quantityParam == null) 
        {
            for (String key : req.getParameterMap().keySet()) 
            {
                if (key.startsWith("quantity_")) 
                {
                    quantityParam = req.getParameter(key);
                    break;
                }
            }
        }

        if (menuIdParam == null || quantityParam == null || menuIdParam.isEmpty() || quantityParam.isEmpty()) {
            resp.sendRedirect("error.jsp?msg=Missing parameters");
            return;
        }

        int mid, quantity;
        try {
            mid = Integer.parseInt(menuIdParam);
            quantity = Integer.parseInt(quantityParam);
        } 
        catch (NumberFormatException e) 
        {
            resp.sendRedirect("error.jsp?msg=Invalid number format");
            return;
        }

        MenuImplementation menuImple = new MenuImplementation();
        Menu menu = menuImple.getMenu(mid);
        if (menu == null) 
        {
            resp.sendRedirect("error.jsp?msg=Menu item not found");
            return;
        }

        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
        if (cart == null) 
        {
            cart = new HashMap<>();
        }

        CartItem citem = cart.get(mid);
        if (citem == null) 
        {
            citem = new CartItem(mid, menu.getRestaurantId(), menu.getItemName(), quantity, menu.getPrice());
        } 
        else 
        {
            citem.setQuantity(citem.getQuantity() + quantity);
        }
        cart.put(mid, citem);

        session.setAttribute("cart", cart);

        if (session.getAttribute("restaurantId") == null) 
        {
            session.setAttribute("restaurantId", menu.getRestaurantId());
        }
        resp.sendRedirect("Cart.jsp");
    }
}
