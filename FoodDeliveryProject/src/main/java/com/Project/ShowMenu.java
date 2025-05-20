package com.Project;

import java.io.IOException;
import java.util.List;

import com.DAOImplementation.MenuImplementation;
import com.Model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class ShowMenu extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int rid = Integer.parseInt(req.getParameter("id"));

            HttpSession session = req.getSession();
            session.setAttribute("restaurantId", rid);  

            MenuImplementation menuimp = new MenuImplementation();
            List<Menu> menuList = menuimp.getMenus(rid);

            session.removeAttribute("MenuList"); 
            session.setAttribute("MenuList", menuList);

            resp.sendRedirect("Menu.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
