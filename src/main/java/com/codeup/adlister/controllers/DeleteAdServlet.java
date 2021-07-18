package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeleteAdServlet", urlPatterns = "/ads/delete")
public class DeleteAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/profile.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //retrieve ad id
        Long id = Long.parseLong(request.getParameter("id"));
        // use getOne method to get an individual ad as a variable
        Ad ad = DaoFactory.getAdsDao().getOne(id);
        // Use delete method to delete ad that we have stored
        DaoFactory.getAdsDao().delete(ad);
        //redirect to /profile page
        response.sendRedirect("/profile");
    }
}