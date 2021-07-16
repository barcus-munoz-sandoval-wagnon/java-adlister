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

@WebServlet(name = "EditProfileServlet", urlPatterns = "/profile/edit")
public class EditProfileServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }
        // Store username parameter as a variable
        String username = request.getParameter("username");
        //use findByUsername with argument of stored username variable to create a new user
        User user = DaoFactory.getUsersDao().findByUsername(username);
        //Set created user as user
        request.setAttribute("user", user);
        //forwards information to editProfile.jsp
        request.getRequestDispatcher("/WEB-INF/profile/editProfile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Create a new user using userId, Username, and Email
        User user = new User(
                Long.parseLong(request.getParameter("userId")),
                request.getParameter("username"),
                request.getParameter("email")
        );
        // Use update method to update current user with new user
        DaoFactory.getUsersDao().update(user);
        //Variable holding Username parameter
        String username = request.getParameter("username");
        //Variable holding email parameter
        String email = request.getParameter("email");
        //Create new user using findByUsername method with username as an argument
        User updatedUser = DaoFactory.getUsersDao().findByUsername(username);
        //Set email as email
        request.setAttribute("email", email);
        //Set username as username
        request.setAttribute("username", username);
        // set user to created user
        request.setAttribute("user", updatedUser);
        //Send new information to profile jsp
        request.getRequestDispatcher("/WEB-INF/profile.jsp").forward(request, response);
        //Redirect to profile page
        response.sendRedirect("/profile");
    }
}
