package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.CreateAdServlet", urlPatterns = "/ads/create")
public class CreateAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }
        request.setAttribute("categories", DaoFactory.getCategoriesDao().all());
        request.getRequestDispatcher("/WEB-INF/ads/create.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String title = request.getParameter("title");
        String description = request.getParameter("description");
//        String category = request.getParameter("category");
        String[] categories = request.getParameterValues("category");

        User user = (User) request.getSession().getAttribute("user");

        Ad ad = new Ad(
            user.getId(),
            title,
            description
        );

        try {
            DaoFactory.getAdsDao().insert(ad);
            for (String catId : categories) {
                DaoFactory.getAdsDao().linkAdToCategory(DaoFactory.getAdsDao().all().size(), Long.parseLong(catId));
            }
            response.sendRedirect("/ads");
        } catch (RuntimeException e) {
            request.setAttribute("stickyTitle", title);
            request.setAttribute( "stickyDescription", description);
//            request.setAttribute("stickyCategory", category);
            request.setAttribute("categories", DaoFactory.getCategoriesDao().all());
            request.getRequestDispatcher("/WEB-INF/ads/create.jsp").forward(request, response);
        }
    }
}
