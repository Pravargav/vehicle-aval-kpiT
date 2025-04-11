<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Dashboard | Vehicle Evaluation System</title>
    <style>
        :root {
            --primary: #3498db;
            --secondary: #2980b9;
            --dark: #2c3e50;
            --light: #ecf0f1;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f5f7fa;
        }
        .dashboard-container {
            max-width: 800px;
            margin: 0 auto;
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: var(--dark);
            margin-bottom: 20px;
        }
        .user-info {
            margin-bottom: 30px;
        }
        .action-buttons {
            margin-top: 30px;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: var(--primary);
            color: white;
            text-decoration: none;
            border-radius: 4px;
            margin-right: 10px;
            transition: background-color 0.3s;
        }
        .btn:hover {
            background-color: var(--secondary);
        }
        .btn-logout {
            background-color: #e74c3c;
        }
        .btn-logout:hover {
            background-color: #c0392b;
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <h1>Welcome, <c:out value="${currentUser.fullName}" />!</h1>
        
        <div class="user-info">
            <p><strong>Email:</strong> <c:out value="${currentUser.email}" /></p>
            <c:if test="${not empty currentUser.phone}">
                <p><strong>Phone:</strong> <c:out value="${currentUser.phone}" /></p>
            </c:if>
            <c:if test="${not empty currentUser.driverLicense}">
                <p><strong>Driver License:</strong> <c:out value="${currentUser.driverLicense}" /></p>
            </c:if>
        </div>
        
        <div class="action-buttons">
            <a href="../user-vehicle-list" class="btn">View Available Vehicles</a>
            <a href="../logout" class="btn btn-logout">Logout</a>
        </div>
    </div>
</body>
</html>