<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <title>Available Slots for ${vehicle.make} ${vehicle.model}</title>
    <style>
        .slot-container {
            max-width: 800px;
            margin: 20px auto;
        }
        .slot-card {
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 15px;
            margin-bottom: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .slot-info {
            flex: 1;
        }
        .slot-actions {
            display: flex;
            gap: 10px;
        }
        .btn {
            padding: 8px 12px;
            border: none;
            border-radius: 4px;
            color: white;
            text-decoration: none;
        }
        .btn-book {
            background-color: #2ecc71;
        }
        .btn-book:hover {
            background-color: #27ae60;
        }
        .status-available {
            color: #2ecc71;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="slot-container">
        <h1>Available Slots for ${vehicle.year} ${vehicle.make} ${vehicle.model}</h1>
        
        <c:forEach items="${slots}" var="slot">
            <div class="slot-card">
                <div class="slot-info">
                    <h3>
                        <span class="status-available">${slot.status}</span>
                    </h3>
                    <p>${slot.startTime} - ${slot.endTime} (${slot.durationMinutes} mins)</p>
                    <p>Price: $${slot.slotPrice}</p>
                </div>
                
                <div class="slot-actions">
                    <a href="../vehicleapp/user-book-slot?slotId=${slot.id}" class="btn btn-book">Book This Slot</a>
                </div>
            </div>
        </c:forEach>
        
        <a href="vehicle-list">Back to Vehicles</a>
    </div>
</body>
</html>