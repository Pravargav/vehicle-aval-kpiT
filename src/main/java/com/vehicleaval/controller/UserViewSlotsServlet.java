package com.vehicleaval.controller;

import com.vehicleaval.entity.Vehicle;
import com.vehicleaval.entity.Slot;
import com.vehicleaval.utility.VehicleDao;
import com.vehicleaval.utility.SlotDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/user-view-slots")
public class UserViewSlotsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("currentUser") == null) {
            response.sendRedirect("user/login.jsp");
            return;
        }
        
        try {
            Long vehicleId = Long.parseLong(request.getParameter("vehicleId"));
            Vehicle vehicle = VehicleDao.findById(vehicleId);
            List<Slot> slots = SlotDao.findByVehicleId(vehicleId);
            
            request.setAttribute("vehicle", vehicle);
            request.setAttribute("slots", slots);
            request.getRequestDispatcher("user/slot-list.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error loading slots");
            request.getRequestDispatcher("user/slot-list.jsp").forward(request, response);
        }
    }
}
