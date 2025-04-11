package com.vehicleaval.controller;

import com.vehicleaval.entity.*;
import com.vehicleaval.utility.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.math.BigDecimal;

@WebServlet("/add-slot")
public class AddSlotServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loggedInDealer") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            Long vehicleId = Long.parseLong(request.getParameter("vehicleId"));
            Vehicle vehicle = VehicleDao.findById(vehicleId);

            if (vehicle == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Vehicle not found");
                return;
            }

            request.setAttribute("vehicle", vehicle);
            request.setAttribute("defaultDuration", 60); // Default 60 minutes
            // In your servlet (AddSlotServlet.java)
            BigDecimal defaultPrice = vehicle.getPrice().multiply(new BigDecimal("0.05")).setScale(2);
            request.setAttribute("defaultSlotPrice", defaultPrice);
            request.getRequestDispatcher("add-slot.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid request");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loggedInDealer") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            Dealer dealer = (Dealer) session.getAttribute("loggedInDealer");
            Long vehicleId = Long.parseLong(request.getParameter("vehicleId"));

            Vehicle vehicle = VehicleDao.findById(vehicleId);
            if (vehicle == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Vehicle not found");
                return;
            }

            // Parse form data
            LocalDateTime startTime = LocalDateTime.parse(
                    request.getParameter("startTime"),
                    DateTimeFormatter.ISO_LOCAL_DATE_TIME);
            int duration = Integer.parseInt(request.getParameter("duration"));
            BigDecimal slotPrice = new BigDecimal(request.getParameter("slotPrice"));
            String notes = request.getParameter("notes");

            // Create new slot
            Slot slot = new Slot();
            slot.setVehicle(vehicle);
            slot.setStartTime(startTime);
            slot.setEndTime(startTime.plusMinutes(duration));
            slot.setDurationMinutes(duration);
            slot.setSlotPrice(slotPrice);
            slot.setNotes(notes);
            slot.setCreatedBy(dealer);
            slot.setSequence(0);
            slot.setStatus(Slot.SlotStatus.AVAILABLE);

            // Save to database
            SlotDao.save(slot);

            response.sendRedirect("view-slots?vehicleId=" + vehicleId);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error creating slot: " + e.getMessage());
            doGet(request, response);
        }
    }
}
