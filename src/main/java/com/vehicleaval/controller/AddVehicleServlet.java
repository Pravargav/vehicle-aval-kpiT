package com.vehicleaval.controller;


import com.vehicleaval.entity.Dealer;
import com.vehicleaval.entity.Vehicle;
import com.vehicleaval.utility.VehicleDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@WebServlet("/add-vehicle")
@MultipartConfig
public class AddVehicleServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Dealer dealer = (Dealer) session.getAttribute("loggedInDealer");
        
        if (dealer == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        try {
            // Get form parameters
            String make = request.getParameter("make");
            String model = request.getParameter("model");
            int year = Integer.parseInt(request.getParameter("year"));
            String color = request.getParameter("color");
            BigDecimal price = new BigDecimal(request.getParameter("price"));
            BigDecimal mileage = new BigDecimal(request.getParameter("mileage"));
            Vehicle.VehicleStatus status = Vehicle.VehicleStatus.valueOf(request.getParameter("status"));
            String imageUrl = request.getParameter("imageUrl");
            boolean availableForSlots = request.getParameter("availableForSlots") != null;
            
            // Create new vehicle
            Vehicle vehicle = new Vehicle();
            vehicle.setDealer(dealer);
            vehicle.setMake(make);
            vehicle.setModel(model);
            vehicle.setYear(year);
            vehicle.setColor(color);
            vehicle.setPrice(price);
            vehicle.setMileage(mileage);
            vehicle.setStatus(status);
            vehicle.setImageUrl(imageUrl);
            vehicle.setAvailableForSlots(availableForSlots);
            vehicle.setCreatedAt(LocalDateTime.now());
            vehicle.setLastUpdated(LocalDateTime.now());
            
            // Save vehicle to database
            VehicleDao.save(vehicle);
            
            // Add success message
            request.setAttribute("successMessage", "Vehicle added successfully!");
            
            // Forward back to add vehicle page
            request.getRequestDispatcher("add-Vehicle.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error adding vehicle: " + e.getMessage());
            request.getRequestDispatcher("add-Vehicle.jsp").forward(request, response);
        }
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Dealer dealer = (Dealer) session.getAttribute("loggedInDealer");
        
        if (dealer == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        request.getRequestDispatcher("add-Vehicle.jsp").forward(request, response);
    }
}
