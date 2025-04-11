<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Vehicle | Dealer Dashboard</title>
    <style>
        :root {
            --primary-color: #3498db;
            --secondary-color: #2980b9;
            --error-color: #e74c3c;
            --success-color: #2ecc71;
            --text-color: #333;
            --light-gray: #f5f5f5;
            --white: #ffffff;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--light-gray);
            color: var(--text-color);
            margin: 0;
            padding: 0;
        }
        
        .header {
            background-color: var(--primary-color);
            color: white;
            padding: 1rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        
        .container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 2rem;
        }
        
        .card {
            background-color: var(--white);
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            padding: 2rem;
            margin-bottom: 2rem;
        }
        
        h1 {
            margin-bottom: 1.5rem;
            color: var(--text-color);
        }
        
        .form-group {
            margin-bottom: 1.25rem;
        }
        
        label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
        }
        
        input[type="text"],
        input[type="number"],
        input[type="url"],
        select {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 1rem;
            transition: border-color 0.3s;
        }
        
        input:focus,
        select:focus {
            border-color: var(--primary-color);
            outline: none;
        }
        
        .btn {
            padding: 0.75rem 1.5rem;
            background-color: var(--primary-color);
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        
        .btn:hover {
            background-color: var(--secondary-color);
        }
        
        .btn-back {
            background-color: #95a5a6;
        }
        
        .btn-back:hover {
            background-color: #7f8c8d;
        }
        
        .message {
            padding: 1rem;
            margin-bottom: 1.5rem;
            border-radius: 4px;
        }
        
        .success {
            background-color: #d4edda;
            color: #155724;
        }
        
        .error {
            background-color: #f8d7da;
            color: #721c24;
        }
        
        .form-row {
            display: flex;
            flex-wrap: wrap;
            margin: 0 -0.5rem;
        }
        
        .form-col {
            flex: 1;
            padding: 0 0.5rem;
            min-width: 250px;
        }
        
        @media (max-width: 768px) {
            .form-col {
                flex: 100%;
                margin-bottom: 1rem;
            }
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Vehicle Evaluation System</h1>
        <div>
            <span>Welcome, <strong><c:out value="${loggedInDealer.fullName}" /></strong></span>
            <a href="dealer-logout" style="color: white; margin-left: 1rem;">Logout</a>
        </div>
    </div>
    
    <div class="container">
        <div class="card">
            <h1>Add New Vehicle</h1>
            
            <c:if test="${not empty successMessage}">
                <div class="message success">
                    <c:out value="${successMessage}" />
                </div>
            </c:if>
            
            <c:if test="${not empty errorMessage}">
                <div class="message error">
                    <c:out value="${errorMessage}" />
                </div>
            </c:if>
            
            <form action="add-vehicle" method="post" enctype="multipart/form-data">
                <div class="form-row">
                    <div class="form-col">
                        <div class="form-group">
                            <label for="make">Make*</label>
                            <input type="text" id="make" name="make" required>
                        </div>
                    </div>
                    <div class="form-col">
                        <div class="form-group">
                            <label for="model">Model*</label>
                            <input type="text" id="model" name="model" required>
                        </div>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-col">
                        <div class="form-group">
                            <label for="year">Year*</label>
                            <input type="number" id="year" name="year" min="1900" max="2023" required>
                        </div>
                    </div>
                    <div class="form-col">
                        <div class="form-group">
                            <label for="color">Color*</label>
                            <input type="text" id="color" name="color" required>
                        </div>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-col">
                        <div class="form-group">
                            <label for="price">Price*</label>
                            <input type="number" id="price" name="price" min="0" step="0.01" required>
                        </div>
                    </div>
                    <div class="form-col">
                        <div class="form-group">
                            <label for="mileage">Mileage*</label>
                            <input type="number" id="mileage" name="mileage" min="0" step="0.01" required>
                        </div>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="status">Status*</label>
                    <select id="status" name="status" required>
                        <option value="AVAILABLE">Available</option>
                        <option value="RESERVED">Reserved</option>
                        <option value="SOLD">Sold</option>
                        <option value="MAINTENANCE">Maintenance</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="imageUrl">Image URL</label>
                    <input type="url" id="imageUrl" name="imageUrl" placeholder="https://example.com/image.jpg">
                </div>
                
                <div class="form-group">
                    <input type="checkbox" id="availableForSlots" name="availableForSlots" checked>
                    <label for="availableForSlots" style="display: inline;">Available for evaluation slots</label>
                </div>
                
                <div class="form-group">
                    <button type="submit" class="btn">Add Vehicle</button>
                    <a href="dashboard.jsp" class="btn btn-back" style="margin-left: 1rem;">Back to Dashboard</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>