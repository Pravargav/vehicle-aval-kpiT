package com.vehicleaval.controller;



import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

import com.vehicleaval.entity.User;
import com.vehicleaval.*;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public SignupServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        EntityManager entityManager = null;
        try {
            // Fetch all parameters from request
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String fullName = request.getParameter("fullName");
            String phone = request.getParameter("phone");
            String driverLicense = request.getParameter("driverLicense");
            String dateOfBirthStr = request.getParameter("dateOfBirth");
            
            // Convert date string to LocalDate
            LocalDate dateOfBirth = dateOfBirthStr != null && !dateOfBirthStr.isEmpty() 
                ? LocalDate.parse(dateOfBirthStr) 
                : null;

            // Create new User entity
            User user = new User(email, password, fullName, phone, driverLicense, dateOfBirth);
            
            // Get EntityManager and begin transaction
            entityManager = FactoryProvider.getFactory().createEntityManager();
            EntityTransaction transaction = entityManager.getTransaction();
            
            transaction.begin();
            // Persist the user
            entityManager.persist(user);
            transaction.commit();
            
            // Send success response
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<h1 style='text-align:center;'>Registration successful!</h1>");
            
        } catch (Exception e) {
            e.printStackTrace();
            // Send error response
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<h1 style='text-align:center;color:red;'>Registration failed: " + 
                        e.getMessage() + "</h1>");
        } finally {
            if (entityManager != null && entityManager.isOpen()) {
                entityManager.close();
            }
        }
    }

   
}
