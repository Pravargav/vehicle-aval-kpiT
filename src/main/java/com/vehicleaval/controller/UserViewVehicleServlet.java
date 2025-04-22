package com.vehicleaval.controller;


import com.vehicleaval.entity.Vehicle;
import com.vehicleaval.utility.VehicleDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/user-view-vehicle")
public class UserViewVehicleServlet extends HttpServlet {
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
            
            request.setAttribute("vehicle", vehicle);
            
            
            request.getRequestDispatcher("user/vehicleView.jsp").forward(request, response);
            
        } catch (NumberFormatException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Invalid vehicle ID");
            request.getRequestDispatcher("user/vehicleView.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error loading vehicle details");
            request.getRequestDispatcher("user/vehicleView.jsp").forward(request, response);
        }
    }
}

