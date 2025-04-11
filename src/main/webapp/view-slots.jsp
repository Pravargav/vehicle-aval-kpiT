<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <title>Slots for ${vehicle.make} ${vehicle.model}</title>
    <style>
        :root {
            --primary: #3498db;
            --danger: #e74c3c;
            --success: #2ecc71;
            --gray: #95a5a6;
        }
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
            cursor: pointer;
        }
        .btn-primary { background-color: var(--primary); }
        .btn-danger { background-color: var(--danger); }
        .btn-disabled { background-color: var(--gray); }
        .status-available { color: var(--success); font-weight: bold; }
        .status-booked { color: var(--primary); font-weight: bold; }
    </style>
</head>
<body>
    <div class="slot-container">
        <h1>Evaluation Slots for ${vehicle.year} ${vehicle.make} ${vehicle.model}</h1>
        <a href="add-slot?vehicleId=${vehicle.id}" class="btn btn-primary">Add New Slot</a>
        
        <c:choose>
            <c:when test="${empty slots}">
                <p>No slots available. Create your first slot.</p>
            </c:when>
            <c:otherwise>
                <c:forEach items="${slots}" var="slot">
                    <div class="slot-card">
                        <div class="slot-info">
                            <h3>
                                <span class="status-${slot.status.name().toLowerCase()}">
                                    ${slot.status}
                                </span>
                            </h3>
                            <p>${slot.startTime} - ${slot.endTime} (${slot.durationMinutes} mins)</p>
                            <p>Price: $${slot.slotPrice}</p>
                            <c:if test="${not empty slot.notes}">
                                <p>Notes: ${slot.notes}</p>
                            </c:if>
                        </div>
                        
                        <div class="slot-actions">
                            <c:choose>
                                <c:when test="${slot.status == 'AVAILABLE'}">
                                    <a href="edit-slot?slotId=${slot.id}" class="btn btn-primary">Edit</a>
                                    <a href="delete-slot?slotId=${slot.id}" class="btn btn-danger"
                                       onclick="return confirm('Delete this slot?')">Delete</a>
                                </c:when>
                                <c:otherwise>
                                    <span class="btn btn-disabled">Edit</span>
                                    <span class="btn btn-disabled">Delete</span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
        
        <a href="vehicle-list" class="btn">Back to Vehicles</a>
    </div>
</body>
</html>