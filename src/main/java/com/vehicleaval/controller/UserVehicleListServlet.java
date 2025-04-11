package com.vehicleaval.controller;


import com.vehicleaval.entity.Vehicle;
import com.vehicleaval.utility.VehicleDao;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/user-vehicle-list")
public class UserVehicleListServlet extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("currentUser") == null) {
            response.sendRedirect("user/login.jsp");
            return;
        }
        
        try {
            // Get all available vehicles
            List<Vehicle> vehicles = VehicleDao.findAvailableForSlots();
            request.setAttribute("vehicles", vehicles);
            
            request.getRequestDispatcher("/user/vehicle-list.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error loading vehicles");
            request.getRequestDispatcher("/user/vehicle-list.jsp").forward(request, response);
        }
    }
}
