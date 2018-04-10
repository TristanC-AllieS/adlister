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

@WebServlet (name = "controllers.UpdateProfileServlet", urlPatterns = "/profile/update")
public class UpdateProfileServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/update_profile.jsp")
                .forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String username_update = request.getParameter("username");
        String email_update = request.getParameter("email");
        String password_update = request.getParameter("password");
        String password_update_confirm = request.getParameter("password-confirm");

        boolean errors = username_update.isEmpty()
                || email_update.isEmpty()
                || (! password_update.equals(password_update_confirm));

        if (errors) {
            response.sendRedirect("/profile/update");
            return;
        }

        User sessionUser = (User) request.getSession().getAttribute("user");
        User updateUser = new User(username_update, email_update, password_update);

        if(!username_update.equals(sessionUser.getUsername()))
            DaoFactory.getUsersDao().updateUsername(updateUser.getUsername(), sessionUser.getId());

        if(!email_update.equals(sessionUser.getEmail()))
            DaoFactory.getUsersDao().updateEmail(updateUser.getEmail(), sessionUser.getId());

        if(!password_update.isEmpty())
            DaoFactory.getUsersDao().updatePassword(updateUser.getPassword(), sessionUser.getId());

        request.getSession().setAttribute("user", updateUser);
        response.sendRedirect("/profile");
    }
}