package com.vehicleaval.controller;



import com.vehicleaval.entity.Dealer;
import com.vehicleaval.utility.DealerDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/dealer-login")
public class DealerLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        try {
            Dealer dealer = DealerDao.findByEmail(email);
            
            if (dealer == null) {
                request.setAttribute("errorMessage", "Invalid email or password");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }
            
            if (!dealer.getIsActive()) {
                request.setAttribute("errorMessage", "Your account is inactive. Please contact support.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }
            
            // In production, use password hashing like BCrypt
            if (!password.equals(dealer.getPasswordHash())) {
                request.setAttribute("errorMessage", "Invalid email or password");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }
            
            // Create session and store dealer information
            HttpSession session = request.getSession();
            session.setAttribute("loggedInDealer", dealer);
            
            // Redirect based on role
            switch(dealer.getRole()) {
                // case ADMIN:
                //     response.sendRedirect("admin-dashboard.jsp");
                //     break;
                // case MANAGER:
                //     response.sendRedirect("manager-dashboard.jsp");
                //     break;
                // case SALES_REP:
                //     response.sendRedirect("sales-dashboard.jsp");
                //     break;
                // case INVENTORY_MGR:
                //     response.sendRedirect("inventory-dashboard.jsp");
                //     break;
                default:
                    response.sendRedirect("dashboard.jsp");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred. Please try again.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}