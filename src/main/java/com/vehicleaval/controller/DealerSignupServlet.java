package com.vehicleaval.controller;


import com.vehicleaval.entity.Dealer;
import com.vehicleaval.entity.Dealer.DealerRole;
import com.vehicleaval.FactoryProvider;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/dealersign")
public class DealerSignupServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Pass enum values to JSP for role dropdown
        request.setAttribute("dealerRoles", Dealer.DealerRole.values());
        request.getRequestDispatcher("/signup.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        EntityManager entityManager = null;
        EntityTransaction transaction = null;
        
        try {
            // Get form parameters
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String fullName = request.getParameter("fullName");
            DealerRole role = DealerRole.valueOf(request.getParameter("userRole"));
            String phone = request.getParameter("phone");
            String dealershipName = request.getParameter("dealershipName");
            int defaultSlotDuration = Integer.parseInt(request.getParameter("defaultSlotDuration"));
            int maxDailySlots = Integer.parseInt(request.getParameter("maxDailySlots"));
            String workingHoursStart = request.getParameter("workingHoursStart");
            String workingHoursEnd = request.getParameter("workingHoursEnd");
            

            // Create dealer entity
            Dealer dealer = new Dealer();
            dealer.setEmail(email);
            dealer.setPasswordHash(password); // In production, hash this!
            dealer.setFullName(fullName);
            dealer.setRole(role);
            dealer.setPhone(phone);
            dealer.setDealershipName(dealershipName);
            dealer.setDefaultSlotDuration(defaultSlotDuration);
            dealer.setMaxDailySlots(maxDailySlots);
            dealer.setWorkingHoursStart(workingHoursStart);
            dealer.setWorkingHoursEnd(workingHoursEnd);
            dealer.setIsActive(true);

            // Get EntityManager and begin transaction
            entityManager = FactoryProvider.getFactory().createEntityManager();
            transaction = entityManager.getTransaction();
            transaction.begin();
            
            // Persist the dealer
            entityManager.persist(dealer);
            
            // Commit transaction
            transaction.commit();
            
            // Set success message and redirect
            request.getSession().setAttribute("successMessage", "Registration successful!");
            // response.sendRedirect(request.getContextPath() + "/dealer/dashboard");
            
        } catch (Exception e) {
            // Rollback transaction if active
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
            
            // Set error message and forward back to form
            request.setAttribute("errorMessage", "Registration failed: " + e.getMessage());
            doGet(request, response);
            
        } finally {
            // Close EntityManager if open
            if (entityManager != null && entityManager.isOpen()) {
                entityManager.close();
            }
        }
    }

    @Override
    public void destroy() {
        FactoryProvider.closeFactory();
        super.destroy();
    }
}
