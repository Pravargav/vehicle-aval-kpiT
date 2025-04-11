<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dealer Dashboard | Vehicle Evaluation System</title>
    <style>
        :root {
            --primary-color: #3498db;
            --secondary-color: #2980b9;
            --dark-color: #2c3e50;
            --light-color: #ecf0f1;
            --success-color: #27ae60;
            --danger-color: #e74c3c;
        }
        
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: #f5f7fa;
            color: #333;
            line-height: 1.6;
        }
        
        header {
            background-color: var(--dark-color);
            color: white;
            padding: 1.5rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        
        header h1 {
            font-size: 1.5rem;
            font-weight: 500;
        }
        
        header p {
            margin: 0.3rem 0;
            font-size: 0.9rem;
            opacity: 0.9;
        }
        
        .logout-btn {
            color: white;
            text-decoration: none;
            padding: 0.5rem 1rem;
            border-radius: 4px;
            background-color: var(--danger-color);
            transition: background-color 0.3s;
        }
        
        .logout-btn:hover {
            background-color: #c0392b;
        }
        
        main {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 2rem;
        }
        
        .dashboard-actions {
            display: flex;
            gap: 1rem;
            margin-bottom: 2rem;
        }
        
        .btn {
            display: inline-block;
            padding: 0.8rem 1.5rem;
            background-color: var(--primary-color);
            color: white;
            text-decoration: none;
            border-radius: 4px;
            font-weight: 500;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
            font-size: 1rem;
        }
        
        .btn:hover {
            background-color: var(--secondary-color);
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        
        .btn-success {
            background-color: var(--success-color);
        }
        
        .btn-success:hover {
            background-color: #219653;
        }
        
        section {
            background-color: white;
            border-radius: 8px;
            padding: 1.5rem;
            margin-bottom: 2rem;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        }
        
        section h2 {
            margin-bottom: 1rem;
            color: var(--dark-color);
            font-weight: 500;
            border-bottom: 2px solid var(--light-color);
            padding-bottom: 0.5rem;
        }
        
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
        }
        
        .stat-card {
            background-color: var(--light-color);
            padding: 1.2rem;
            border-radius: 6px;
        }
        
        .stat-card h3 {
            font-size: 1rem;
            color: #7f8c8d;
            margin-bottom: 0.5rem;
        }
        
        .stat-card p {
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--dark-color);
        }
        
        @media (max-width: 768px) {
            header {
                flex-direction: column;
                align-items: flex-start;
                gap: 1rem;
            }
            
            .dashboard-actions {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <header>
        <div>
            <h1>Welcome, <c:out value="${loggedInDealer.fullName}" /></h1>
            <p>Role: <c:out value="${loggedInDealer.role.displayName}" /></p>
            <c:if test="${not empty loggedInDealer.dealershipName}">
                <p>Dealership: <c:out value="${loggedInDealer.dealershipName}" /></p>
            </c:if>
        </div>
        <a href="dealer-logout" class="logout-btn">Logout</a>
    </header>
    
    <main>
        <div class="dashboard-actions">
            <a href="add-Vehicle.jsp" class="btn btn-success">add new vehicle</a>
            <a href="vehicle-list" class="btn btn-success">view my vehicles</a>
        </div>
        
                
        <section>
            <h2>Working Hours</h2>
            <div class="stats-grid">
                <div class="stat-card">
                    <h3>Start Time</h3>
                    <p><c:out value="${loggedInDealer.workingHoursStart}" /></p>
                </div>
                <div class="stat-card">
                    <h3>End Time</h3>
                    <p><c:out value="${loggedInDealer.workingHoursEnd}" /></p>
                </div>
                <div class="stat-card">
                    <h3>Slot Duration</h3>
                    <p><c:out value="${loggedInDealer.defaultSlotDuration}" /> mins</p>
                </div>
            </div>
        </section>
    </main>
</body>
</html>