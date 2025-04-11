package com.vehicleaval.controller;


import com.vehicleaval.entity.Dealer;
import com.vehicleaval.entity.Vehicle;
import com.vehicleaval.utility.VehicleDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/vehicle-list")
public class VehicleListServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loggedInDealer") == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        Dealer dealer = (Dealer) session.getAttribute("loggedInDealer");
        List<Vehicle> vehicles = VehicleDao.findByDealerId(dealer.getId());
        
        request.setAttribute("vehicles", vehicles);
        request.getRequestDispatcher("vehicle-list.jsp").forward(request, response);
    }
}
