package com.vehicleaval.controller;


import com.vehicleaval.entity.User;
import com.vehicleaval.utility.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        User user = UserDao.getUserByEmail(email);
        
        if (user != null) {
            // Compare plain text passwords
            if (password.equals(user.getPasswordHash())) {
                if (user.getIsActive()) {
                    HttpSession session = request.getSession();
                    session.setAttribute("currentUser", user);
                    response.sendRedirect("user/dashboard.jsp");
                } else {
                    request.setAttribute("errorMessage", "Your account is inactive. Please contact support.");
                    request.getRequestDispatcher("user/login.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("errorMessage", "Invalid email or password");
                request.getRequestDispatcher("user/login.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("errorMessage", "Invalid email or password");
            request.getRequestDispatcher("user/login.jsp").forward(request, response);
        }
    }
}
