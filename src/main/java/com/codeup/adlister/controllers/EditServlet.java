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
        long id = Long.parseLong(request.getParameter("id"));
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
        long id = Long.parseLong(request.getParameter("id"));
        System.out.println(id);
        Ad ad = DaoFactory.getAdsDao().getOne(id);
        String title = request.getParameter("title");
        System.out.println(title);
        ad.setTitle(title);
        String desc = request.getParameter("description");
        System.out.println(desc);
        ad.setDescription(desc);


        DaoFactory.getAdsDao().update(ad);


        response.sendRedirect("/ads");
    }
}
