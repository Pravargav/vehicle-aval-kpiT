package com.vehicleaval.controller;


import com.vehicleaval.utility.VehicleDao;
import com.vehicleaval.entity.User;
import com.vehicleaval.entity.Vehicle;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet("/user-buy-vehicle")
public class UserBuyVehicleServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("currentUser") == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        try {
            Long vehicleId = Long.parseLong(request.getParameter("vehicleId"));
            User user = (User) session.getAttribute("currentUser");
            
            // Find vehicle
            Vehicle vehicle = VehicleDao.findById(vehicleId);
            if (vehicle == null || vehicle.getStatus() == Vehicle.VehicleStatus.SOLD) {
                request.setAttribute("errorMessage", "Vehicle not available for purchase");
                request.getRequestDispatcher("user/vehicle-list.jsp").forward(request, response);
                return;
            }
            
            // Update vehicle status
            vehicle.setStatus(Vehicle.VehicleStatus.SOLD);
            vehicle.setBoughtBy(user);
            vehicle.setAvailableForSlots(false);
            vehicle.setLastUpdated(LocalDateTime.now());
            
            // Save changes
            VehicleDao.update(vehicle);
            
            // Redirect to confirmation
            response.sendRedirect("user/purchase-confirm.jsp");
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error purchasing vehicle");
            request.getRequestDispatcher("user/vehicle-list.jsp").forward(request, response);
        }
    }
}
