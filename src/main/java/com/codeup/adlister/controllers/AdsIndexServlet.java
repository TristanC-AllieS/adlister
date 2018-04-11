package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.font.NumericShaper;
import java.io.IOException;

@WebServlet(name = "controllers.AdsIndexServlet", urlPatterns = "/ads/*")
public class AdsIndexServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String selectedAd = request.getPathInfo();

        if (selectedAd == null) {
            request.setAttribute("ads", DaoFactory.getAdsDao().all());
            request.getRequestDispatcher("/WEB-INF/ads/index.jsp").forward(request, response);
        } else {
            try {
                int adId = Integer.parseInt(selectedAd.substring(1));
                request.setAttribute("ad", DaoFactory.getAdsDao().all().get(adId - 1));
                request.getRequestDispatcher("/WEB-INF/ads/info.jsp").forward(request, response);
            } catch (NumberFormatException | IndexOutOfBoundsException e) {
                request.setAttribute("ads", DaoFactory.getAdsDao().all());
                request.setAttribute("error", "Requested invalid ad listing!");
                request.getRequestDispatcher("/WEB-INF/ads/index.jsp").forward(request, response);
            }
        }
    }
}
