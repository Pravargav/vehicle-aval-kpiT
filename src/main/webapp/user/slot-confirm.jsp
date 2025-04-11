<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Booking Confirmation</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        
        .confirmation-card {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 40px;
            text-align: center;
            max-width: 400px;
            width: 100%;
        }
        
        .success-icon {
            width: 60px;
            height: 60px;
            background-color: #4CAF50;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0 auto 20px;
        }
        
        .success-icon::after {
            content: "✓";
            color: white;
            font-size: 32px;
        }
        
        h1 {
            color: #333;
            font-size: 24px;
            margin-bottom: 15px;
        }
        
        p {
            color: #666;
            margin-bottom: 30px;
        }
        
        .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #4285F4;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            font-weight: 500;
            transition: background-color 0.3s;
        }
        
        .btn:hover {
            background-color: #3367D6;
        }
    </style>
</head>
<body>
    <div class="confirmation-card">
        <div class="success-icon"></div>
        <h1>Booking Confirmed</h1>
        <p>Your slot has been successfully booked. Thank you!</p>
        <a href="user-dashboard" class="btn">Return to Dashboard</a>
    </div>
</body>
</html>