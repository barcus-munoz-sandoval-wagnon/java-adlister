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

@WebServlet(name = "controllers.EditServlet", urlPatterns = "/ads/delete")
public class DeleteServlet extends HttpServlet {
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
        request.getRequestDispatcher("/WEB-INF/ads/editcards.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User user = (User) request.getSession().getAttribute("user");
        Ad ad = new Ad(
                Long.parseLong(request.getParameter("adToUpdate")),
                user.getId(),
                request.getParameter("title"),
                request.getParameter("description")
        );
        DaoFactory.getAdsDao().update(ad);
        response.sendRedirect("/ads");
    }
}
