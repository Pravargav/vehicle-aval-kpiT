<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Slot | Vehicle Evaluation</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: #333;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
        }
        
        h1 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 10px;
        }
        
        h2 {
            color: #3498db;
            text-align: center;
            margin-top: 0;
            font-weight: normal;
            margin-bottom: 30px;
        }
        
        .slot-form {
            max-width: 600px;
            margin: 20px auto;
            padding: 30px;
            border: 1px solid #ddd;
            border-radius: 10px;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #2c3e50;
        }
        
        input, select {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 16px;
            transition: border-color 0.3s;
        }
        
        input:focus, select:focus {
            border-color: #3498db;
            outline: none;
            box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
        }
        
        .btn-submit {
            background-color: #3498db;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 600;
            width: 100%;
            transition: background-color 0.3s;
        }
        
        .btn-submit:hover {
            background-color: #2980b9;
        }
        
        /* Responsive adjustments */
        @media (max-width: 768px) {
            .slot-form {
                padding: 20px;
                margin: 20px 15px;
            }
            
            h1 {
                font-size: 24px;
            }
            
            h2 {
                font-size: 18px;
            }
        }
    </style>
</head>
<body>
    <h1>Add Evaluation Slot</h1>
    <h2>For: ${vehicle.year} ${vehicle.make} ${vehicle.model}</h2>
    
    <div class="slot-form">
        <form action="add-slot" method="post">
            <input type="hidden" name="vehicleId" value="${vehicle.id}">
            
            <div class="form-group">
                <label for="startTime">Start Time:</label>
                <input type="datetime-local" id="startTime" name="startTime" required>
            </div>
            
            <div class="form-group">
                <label for="duration">Duration (minutes):</label>
                <input type="number" id="duration" name="duration" min="15" max="240" 
                       value="${defaultDuration}" required>
            </div>
            
            <div class="form-group">
                <label for="slotPrice">Slot Price ($):</label>
                <input type="number" id="slotPrice" name="slotPrice" min="0" step="0.01" 
                       value="${defaultSlotPrice}">
            </div>
            
            <div class="form-group">
                <label for="notes">Notes:</label>
                <input type="text" id="notes" name="notes">
            </div>
            
            <button type="submit" class="btn-submit">Create Slot</button>
        </form>
    </div>
</body>
</html>