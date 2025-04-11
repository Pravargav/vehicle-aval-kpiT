<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <title>Purchase Confirmation</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f7fa;
            margin: 0;
            padding: 0;
            color: #333;
        }
        
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }
        
        .confirmation-card {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin: 30px 0;
            text-align: center;
        }
        
        .success-icon {
            width: 70px;
            height: 70px;
            background-color: #4CAF50;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px;
        }
        
        .success-icon svg {
            width: 40px;
            height: 40px;
            fill: none;
            stroke: white;
            stroke-width: 2;
        }
        
        h1 {
            color: #2c3e50;
            margin-bottom: 10px;
        }
        
        .message {
            color: #7f8c8d;
            margin-bottom: 30px;
            font-size: 16px;
            line-height: 1.5;
        }
        
        .reference {
            background-color: #f8f9fa;
            padding: 15px;
            border-radius: 4px;
            margin: 20px 0;
            font-size: 14px;
        }
        
        .reference span {
            font-weight: bold;
        }
        
        .buttons {
            margin-top: 30px;
        }
        
        .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #3498db;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            margin: 0 10px;
        }
        
        .btn:hover {
            background-color: #2980b9;
        }
        
        .btn-secondary {
            background-color: #95a5a6;
        }
        
        .btn-secondary:hover {
            background-color: #7f8c8d;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="confirmation-card">
            <div class="success-icon">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7" />
                </svg>
            </div>
            
            <h1>Purchase Successful!</h1>
            
            <div class="message">
                <p>Thank you for your purchase. Your transaction has been completed successfully.</p>
                <p>Our team will contact you shortly to coordinate the next steps.</p>
            </div>
            
            <div class="reference">
                Reference Number: <span>ORD-${System.currentTimeMillis()}</span>
            </div>
            
            <div class="buttons">
                <a href="dashboard" class="btn">Go to Dashboard</a>
                <a href="user-vehicle-list" class="btn btn-secondary">Browse More</a>
            </div>
        </div>
    </div>
</body>
</html>