<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AutoRent - Vehicle Availability System</title>
<link rel="stylesheet" type="text/css" href="css/vehicle-styles.css">
<style>
    .auth-buttons {
        display: flex;
        justify-content: center;
        gap: 15px;
        margin: 20px 0;
        flex-wrap: wrap;
    }
    
    .auth-btn {
        padding: 12px 25px;
        border-radius: 5px;
        text-decoration: none;
        font-weight: 500;
        transition: all 0.3s;
        text-align: center;
        min-width: 150px;
    }
    
    .user-login {
        background-color: #2a5885;
        color: white;
        border: 2px solid #2a5885;
    }
    
    .user-register {
        background-color: white;
        color: #2a5885;
        border: 2px solid #2a5885;
    }
    
    .admin-login {
        background-color: #d32f2f;
        color: white;
        border: 2px solid #d32f2f;
    }
    
    .admin-register {
        background-color: white;
        color: #d32f2f;
        border: 2px solid #d32f2f;
    }
    
    .auth-btn:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    }
</style>
</head>
<body>
    
    <div class="content-wrapper">
        <div class="welcome-message">
            <h1>Welcome to AutoRent</h1>
            <p>Find your perfect vehicle for any journey</p>
            
            <!-- Authentication Buttons -->
            <div class="auth-buttons">
                <a href="user/signup.jsp" class="auth-btn user-register">User Sign Up</a>
                <a href="user/login.jsp" class="auth-btn user-register">user login</a>
                <a href="signup.jsp" class="auth-btn user-register">Dealer Sign Up</a>
                <a href="login.jsp" class="auth-btn user-register">Dealer login</a>
            </div>
        </div>
        
        <div class="search-section">
            <form action="search" method="get">
                <div class="search-fields">
                    <select name="vehicleType" required>
                        <option value="">Select Vehicle Type</option>
                        <option value="sedan">Sedan</option>
                        <option value="suv">SUV</option>
                        <option value="truck">Truck</option>
                        <option value="van">Van</option>
                    </select>
                    
                    <input type="date" name="pickupDate" required>
                    
                    <input type="date" name="returnDate" required>
                    
                    <button type="submit" class="search-button">Check Availability</button>
                </div>
            </form>
        </div>
        
        <div class="vehicle-section">
            <h2 class="section-title">Available Now</h2>
            <div class="vehicle-container">
                <c:forEach items="${availableVehicles}" var="vehicle">
                   
                </c:forEach>
            </div>
        </div>
        
        <div class="vehicle-section">
            <h2 class="section-title">Popular Choices</h2>
            <div class="vehicle-container">
                <c:forEach items="${popularVehicles}" var="vehicle">
                    
                </c:forEach>
            </div>
        </div>
        
        <div class="vehicle-section">
            <h2 class="section-title">Special Offers</h2>
            <div class="vehicle-container">
                <c:forEach items="${specialOfferVehicles}" var="vehicle">
                    
                </c:forEach>
            </div>
        </div>
    </div>
    
</body>
</html>