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

@WebServlet(name = "controllers.EditServlet", urlPatterns = "/ads/edit")
public class EditServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
        }
        long id = Long.parseLong(request.getParameter("userId"));
        System.out.println(id);
//        New ad variable created using the getOne method with 'id' as an argument in order to identify what ad to create
        Ad ad = DaoFactory.getAdsDao().getOne(id);
//        Sets the request attribute of ad of ad
        request.setAttribute("ad", ad);
        //Send information to editcards.jsp
        request.getRequestDispatcher("/WEB-INF/ads/editcards.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //Gets the current user as a variable
        User user = (User) request.getSession().getAttribute("user");
        // Creates a new ad using ad id, userID, ad title, and ad description
        Ad ad = new Ad(
                Long.parseLong(request.getParameter("adToUpdate")),
                user.getId(),
                request.getParameter("title"),
                request.getParameter("description")
        );
        // Uses update
        DaoFactory.getAdsDao().update(ad);
        response.sendRedirect("/ads");
    }
}
