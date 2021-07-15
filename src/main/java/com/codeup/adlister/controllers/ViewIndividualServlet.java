package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Password;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ads/view")
public class ViewIndividualServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        Variable with the ad.id as it's value
        long id = Long.parseLong(req.getParameter("id"));
        System.out.println(id);
//        New ad variable created using the getOne method with 'id' as an argument in order to identify what ad to create
        Ad ad = DaoFactory.getAdsDao().getOne(id);
//        Sets the request attribute of ad of ad
        req.setAttribute("ad", ad);
//        Forwards new ad to view
        req.getRequestDispatcher("/WEB-INF/ads/view.jsp").forward(req, resp);
    }
}