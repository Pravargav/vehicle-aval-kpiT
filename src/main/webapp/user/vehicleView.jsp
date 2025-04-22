<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>${vehicle.make} ${vehicle.model} Details</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #4361ee;
            --secondary-color: #3f37c9;
            --accent-color: #4895ef;
            --light-color: #f8f9fa;
            --dark-color: #212529;
            --success-color: #4cc9f0;
            --danger-color: #f72585;
            --border-radius: 8px;
            --box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            --transition: all 0.3s ease;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html, body {
            height: 100%;
            font-family: "Roboto", sans-serif;
            line-height: 1.6;
            color: var(--dark-color);
            background-color: #f5f7fa;
        }

        .page-wrapper {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        .main-content {
            flex: 1;
            padding: 2rem 0;
        }

        .container {
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 1rem;
        }

        .vehicle-card {
            background: white;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            overflow: hidden;
            transition: var(--transition);
            height: 100%;
            display: flex;
            flex-direction: column;
        }

        .vehicle-header {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            padding: 1.5rem;
            text-align: center;
        }

        .vehicle-header h2 {
            font-size: 1.8rem;
            margin-bottom: 0.5rem;
        }

        .vehicle-year {
            font-weight: 300;
            opacity: 0.9;
        }

        .vehicle-image-container {
            width: 100%;
            height: 300px;
            background-color: #e9ecef;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
        }

        .vehicle-image {
            max-width: 100%;
            max-height: 100%;
            object-fit: contain;
        }

        .vehicle-details {
            padding: 2rem;
            flex: 1;
        }

        .details-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .detail-item {
            background-color: var(--light-color);
            padding: 1.5rem;
            border-radius: var(--border-radius);
            border-left: 4px solid var(--accent-color);
        }

        .detail-label {
            font-size: 0.8rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            color: #6c757d;
            margin-bottom: 0.5rem;
            font-weight: 500;
        }

        .detail-value {
            font-size: 1.1rem;
            font-weight: 500;
            color: var(--dark-color);
            word-break: break-word;
        }

        .action-buttons {
            display: flex;
            gap: 1rem;
            flex-wrap: wrap;
            margin-top: 2rem;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 0.7rem 1.5rem;
            border-radius: var(--border-radius);
            text-decoration: none;
            font-weight: 500;
            transition: var(--transition);
            border: none;
            cursor: pointer;
        }

        .btn-primary {
            background-color: var(--primary-color);
            color: white;
        }

        .btn-primary:hover {
            background-color: var(--secondary-color);
            transform: translateY(-2px);
        }

        .btn-secondary {
            background-color: white;
            color: var(--primary-color);
            border: 1px solid var(--primary-color);
        }

        .btn-secondary:hover {
            background-color: var(--light-color);
            transform: translateY(-2px);
        }

        .btn-light {
            background-color: var(--light-color);
            color: var(--dark-color);
        }

        .btn-light:hover {
            background-color: #e2e6ea;
            transform: translateY(-2px);
        }

        .btn i {
            margin-right: 8px;
        }

        .alert {
            padding: 1rem;
            border-radius: var(--border-radius);
            margin-bottom: 1.5rem;
        }

        .alert-danger {
            background-color: #fff0f3;
            color: var(--danger-color);
            border-left: 4px solid var(--danger-color);
        }

        .empty-state {
            text-align: center;
            padding: 3rem;
            color: #6c757d;
        }

        .color-swatch {
            display: inline-block;
            width: 15px;
            height: 15px;
            border: 1px solid #ddd;
            vertical-align: middle;
            margin-right: 5px;
            border-radius: 2px;
        }

        @media (max-width: 768px) {
            .details-grid {
                grid-template-columns: 1fr;
            }

            .action-buttons {
                flex-direction: column;
            }

            .btn {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="page-wrapper">
        <main class="main-content">
            <div class="container">
                <div class="vehicle-card">
                    <div class="vehicle-header">
                        <h2>${vehicle.make} ${vehicle.model}</h2>
                        <div class="vehicle-year">${vehicle.year}</div>
                    </div>

                    <div class="vehicle-image-container">
                        <c:choose>
                            <c:when test="${not empty vehicle.imageUrl}">
                                <img src="${vehicle.imageUrl}" alt="${vehicle.make} ${vehicle.model}" class="vehicle-image">
                            </c:when>
                            <c:otherwise>
                                <i class="fas fa-car-side fa-5x" style="color: #adb5bd;"></i>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <div class="vehicle-details">
                        <c:if test="${not empty errorMessage}">
                            <div class="alert alert-danger">
                                <i class="fas fa-exclamation-circle"></i> ${errorMessage}
                            </div>
                        </c:if>

                        <div class="details-grid">
                            <div class="detail-item">
                                <div class="detail-label">Vehicle ID</div>
                                <div class="detail-value">${vehicle.id}</div>
                            </div>

                            <div class="detail-item">
                                <div class="detail-label">Status</div>
                                <div class="detail-value">${vehicle.status}</div>
                            </div>

                            <div class="detail-item">
                                <div class="detail-label">Price</div>
                                <div class="detail-value">$${vehicle.price}</div>
                            </div>

                            <div class="detail-item">
                                <div class="detail-label">Color</div>
                                <div class="detail-value">
                                    <span class="color-swatch"></span>
                                    ${vehicle.color}
                                </div>
                            </div>

                            <div class="detail-item">
                                <div class="detail-label">Mileage</div>
                                <div class="detail-value">${vehicle.mileage} km</div>
                            </div>

                            <div class="detail-item">
                                <div class="detail-label">Available for Slots</div>
                                <div class="detail-value">
                                    ${vehicle.availableForSlots ? 'Yes' : 'No'}
                                </div>
                            </div>

                            <div class="detail-item">
                                <div class="detail-label">Added On</div>
                                <div class="detail-value">${vehicle.createdAt}</div>
                            </div>

                            <div class="detail-item">
                                <div class="detail-label">Last Updated</div>
                                <div class="detail-value">${vehicle.lastUpdated}</div>
                            </div>

                            <c:if test="${not empty vehicle.boughtBy}">
                                <div class="detail-item">
                                    <div class="detail-label">Purchased By</div>
                                    <div class="detail-value">${vehicle.boughtBy.fullName}</div>
                                </div>
                            </c:if>
                        </div>

                        <div class="action-buttons">
                            <c:if test="${vehicle.availableForSlots}">
                                <a href="user-view-slots?vehicleId=${vehicle.id}" class="btn btn-primary">
                                    <i class="fas fa-calendar-alt"></i> View Slots
                                </a>
                            </c:if>
                            
                            <a href="edit-vehicle?vehicleId=${vehicle.id}" class="btn btn-secondary">
                                <i class="fas fa-edit"></i> Edit Vehicle
                            </a>
                            
                            <a href="user/dashboard.jsp" class="btn btn-light">
                                <i class="fas fa-arrow-left"></i> Back to Dashboard
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</body>
</html>