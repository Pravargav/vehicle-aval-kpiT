package com.vehicleaval.controller;


import com.vehicleaval.entity.Slot;
import com.vehicleaval.entity.User;
import com.vehicleaval.utility.SlotDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet("/user-book-slot")
public class UserBookSlotServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("currentUser") == null) {
            response.sendRedirect("user/login.jsp");
            return;
        }
        
        try {
            Long slotId = Long.parseLong(request.getParameter("slotId"));
            User user = (User) session.getAttribute("currentUser");
            
            Slot slot = SlotDao.findById(slotId);
            if (slot == null || slot.getStatus() != Slot.SlotStatus.AVAILABLE) {
                request.setAttribute("errorMessage", "Slot not available");
                request.getRequestDispatcher("user/slot-list.jsp").forward(request, response);
                return;
            }
            
            // Update slot status
            slot.setStatus(Slot.SlotStatus.BOOKED);
            slot.setBookedBy(user);
            slot.setBookedAt(LocalDateTime.now());
            SlotDao.update(slot);
            
            response.sendRedirect("user/slot-confirm.jsp");
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error booking slot");
            request.getRequestDispatcher("user/slot-list.jsp").forward(request, response);
        }
    }
}
