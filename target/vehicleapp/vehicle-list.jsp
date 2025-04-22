<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Vehicles | Dealer Dashboard</title>
    <style>
        :root {
            --primary: #3498db;
            --secondary: #2980b9;
            --success: #2ecc71;
            --danger: #e74c3c;
            --light: #ecf0f1;
            --dark: #2c3e50;
        }
        .vehicle-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }
        .vehicle-card {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px;
            transition: transform 0.3s;
        }
        .vehicle-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        .vehicle-image {
            width: 100%;
            height: 180px;
            object-fit: cover;
            border-radius: 5px;
        }
        .vehicle-actions {
            margin-top: 15px;
            display: flex;
            gap: 10px;
        }
        .btn {
            padding: 8px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            color: white;
        }
        .btn-primary {
            background-color: var(--primary);
        }
        .btn-primary:hover {
            background-color: var(--secondary);
        }
        .btn-success {
            background-color: var(--success);
        }
    </style>
</head>
<body>
    <h1>My Vehicles</h1>
    
    <div class="vehicle-grid">
        <c:forEach items="${vehicles}" var="vehicle">
            <div class="vehicle-card">
                
                <h3>${vehicle.year} ${vehicle.make} ${vehicle.model}</h3>
                <p>Color: ${vehicle.color}</p>
                <p>Price: $${vehicle.price}</p>
                <p>Status: ${vehicle.status}</p>
                
                <div class="vehicle-actions">
                    <a href="add-slot?vehicleId=${vehicle.id}" class="btn btn-primary">Add Slot</a>
                    <a href="view-slots?vehicleId=${vehicle.id}" class="btn btn-success">View Slots</a>
                </div>
            </div>
        </c:forEach>
    </div>
</body>
</html>