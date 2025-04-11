package com.vehicleaval.controller;


import com.vehicleaval.entity.*;
import com.vehicleaval.utility.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/view-slots")
public class ViewSlotsServlet extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loggedInDealer") == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        try {
            // 1. Get vehicle ID from request
            Long vehicleId = Long.parseLong(request.getParameter("vehicleId"));
            
            // 2. Verify vehicle exists and belongs to dealer
            Dealer dealer = (Dealer) session.getAttribute("loggedInDealer");
            Vehicle vehicle = VehicleDao.findById(vehicleId);
            
            if (vehicle == null || !vehicle.getDealer().getId().equals(dealer.getId())) {
                response.sendError(HttpServletResponse.SC_FORBIDDEN);
                return;
            }
            
            // 3. Get all slots for this vehicle
            List<Slot> slots = SlotDao.findByVehicleId(vehicleId);
            
            // 4. Set attributes for JSP
            request.setAttribute("vehicle", vehicle);
            request.setAttribute("slots", slots);
            
            // 5. Forward to view
            request.getRequestDispatcher("/view-slots.jsp").forward(request, response);
            
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid vehicle ID");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}
