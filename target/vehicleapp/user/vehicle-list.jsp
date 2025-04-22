<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@page isELIgnored="false" %>
            <!DOCTYPE html>
            <html>

            <head>
                <title>Available Vehicles</title>
                <style>
                    :root {
                        --primary: #3498db;
                        --secondary: #2980b9;
                        --success: #2ecc71;
                        --dark: #2c3e50;
                        --light: #ecf0f1;
                    }

                    body {
                        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                        margin: 0;
                        padding: 0;
                        background-color: #f5f7fa;
                    }

                    .container {
                        max-width: 1200px;
                        margin: 0 auto;
                        padding: 20px;
                    }

                    h1 {
                        color: var(--dark);
                        margin-bottom: 30px;
                    }

                    /* Navbar Styles */
                    .company-nav {
                        background: white;
                        padding: 15px 0;
                        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                        margin-bottom: 30px;
                        position: sticky;
                        top: 0;
                        z-index: 100;
                    }

                    .company-list {
                        display: flex;
                        list-style: none;
                        padding: 0;
                        margin: 0;
                        overflow-x: auto;
                        white-space: nowrap;
                        scrollbar-width: none;
                        /* Firefox */
                    }

                    .company-list::-webkit-scrollbar {
                        display: none;
                        /* Chrome, Safari */
                    }

                    .company-item {
                        margin-right: 10px;
                    }

                    .company-btn {
                        padding: 8px 15px;
                        border: none;
                        border-radius: 20px;
                        background-color: var(--light);
                        color: var(--dark);
                        cursor: pointer;
                        font-size: 0.9rem;
                        transition: all 0.3s;
                    }

                    .company-btn:hover {
                        background-color: var(--primary);
                        color: white;
                    }

                    .company-btn.active {
                        background-color: var(--primary);
                        color: white;
                        font-weight: bold;
                    }

                    /* Vehicle Grid Styles */
                    .vehicle-grid {
                        display: grid;
                        grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
                        gap: 20px;
                    }

                    .vehicle-card {
                        background: white;
                        border-radius: 8px;
                        padding: 20px;
                        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                        transition: transform 0.3s;
                    }

                    .vehicle-card:hover {
                        transform: translateY(-5px);
                        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
                    }

                    .vehicle-image {
                        width: 100%;
                        height: 200px;
                        object-fit: cover;
                        border-radius: 5px;
                        margin-bottom: 15px;
                    }

                    .vehicle-title {
                        font-size: 1.2rem;
                        margin: 0 0 10px;
                        color: var(--dark);
                    }

                    .vehicle-detail {
                        margin: 5px 0;
                        color: #555;
                    }

                    .price {
                        font-weight: bold;
                        color: var(--success);
                        font-size: 1.1rem;
                    }

                    .action-buttons {
                        margin-top: 20px;
                        display: flex;
                        gap: 10px;
                    }

                    .btn {
                        padding: 8px 15px;
                        border: none;
                        border-radius: 4px;
                        color: white;
                        text-decoration: none;
                        font-size: 0.9rem;
                        cursor: pointer;
                        flex: 1;
                        text-align: center;
                    }

                    .btn-view {
                        background-color: var(--primary);
                    }

                    .btn-view:hover {
                        background-color: var(--secondary);
                    }

                    .btn-book {
                        background-color: var(--success);
                    }

                    .btn-book:hover {
                        background-color: #27ae60;
                    }

                    .back-btn {
                        display: inline-block;
                        margin-top: 20px;
                        padding: 10px 20px;
                        background-color: #95a5a6;
                        color: white;
                        text-decoration: none;
                        border-radius: 4px;
                    }

                    /* Status badges */
                    .status-badge {
                        display: inline-block;
                        padding: 3px 8px;
                        border-radius: 12px;
                        font-size: 0.75rem;
                        font-weight: bold;
                        margin-left: 10px;
                    }

                    .status-available {
                        background-color: #d4edda;
                        color: #155724;
                    }

                    .status-reserved {
                        background-color: #fff3cd;
                        color: #856404;
                    }

                    .status-sold {
                        background-color: #f8d7da;
                        color: #721c24;
                    }

                    /* No results message */
                    .no-results {
                        text-align: center;
                        grid-column: 1 / -1;
                        padding: 40px;
                        color: #7f8c8d;
                        font-size: 1.2rem;
                    }
                </style>
            </head>

            <body>
                <div class="company-nav">
                    <div class="container">
                        <ul class="company-list" id="companyFilter">
                            <li class="company-item">
                                <button class="company-btn active" data-company="all">All Brands</button>
                            </li>
                            <li class="company-item">
                                <button class="company-btn" data-company="Maruti">Maruti</button>
                            </li>
                            <li class="company-item">
                                <button class="company-btn" data-company="Hyundai">Hyundai</button>
                            </li>
                            <li class="company-item">
                                <button class="company-btn" data-company="Tata">Tata</button>
                            </li>
                            <li class="company-item">
                                <button class="company-btn" data-company="Honda">Honda</button>
                            </li>
                            <li class="company-item">
                                <button class="company-btn" data-company="Toyota">Toyota</button>
                            </li>
                            <li class="company-item">
                                <button class="company-btn" data-company="Kia">Kia</button>
                            </li>
                            <li class="company-item">
                                <button class="company-btn" data-company="Mahindra">Mahindra</button>
                            </li>
                            <li class="company-item">
                                <button class="company-btn" data-company="Volkswagen">Volkswagen</button>
                            </li>
                            <li class="company-item">
                                <button class="company-btn" data-company="Skoda">Skoda</button>
                            </li>
                            <li class="company-item">
                                <button class="company-btn" data-company="Nissan">Nissan</button>
                            </li>
                            <li class="company-item">
                                <button class="company-btn" data-company="Renault">Renault</button>
                            </li>
                            <li class="company-item">
                                <button class="company-btn" data-company="Mercedes-Benz">Mercedes</button>
                            </li>
                            <li class="company-item">
                                <button class="company-btn" data-company="BMW">BMW</button>
                            </li>
                            <li class="company-item">
                                <button class="company-btn" data-company="Audi">Audi</button>
                            </li>
                            <li class="company-item">
                                <button class="company-btn" data-company="Jaguar">Jaguar</button>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="container">
                    <h1>Available Vehicles</h1>

                    <c:if test="${not empty errorMessage}">
                        <div style="color: #e74c3c; margin-bottom: 20px;">
                            ${errorMessage}
                        </div>
                    </c:if>

                    <div class="vehicle-grid" id="vehicleContainer">
                        <c:forEach items="${vehicles}" var="vehicle">
                            <div class="vehicle-card" data-company="${vehicle.make}">
                                

                                <h3 class="vehicle-title">
                                    ${vehicle.year} ${vehicle.make} ${vehicle.model}
                                    <span class="status-badge 
                            <c:choose>
                                <c:when test=" ${vehicle.status.name()=='AVAILABLE' }">status-available</c:when>
                                        <c:when test="${vehicle.status.name() == 'RESERVED'}">status-reserved</c:when>
                                        <c:when test="${vehicle.status.name() == 'SOLD'}">status-sold</c:when>
                                        </c:choose>">
                                        ${vehicle.status.name()}
                                    </span>
                                </h3>

                                <p class="vehicle-detail">Color: ${vehicle.color}</p>
                                <p class="vehicle-detail">Mileage: ${vehicle.mileage} miles</p>
                                <p class="price">$${vehicle.price}</p>

                                <div class="action-buttons">

                                    <a href="user-view-vehicle?vehicleId=${vehicle.id}" class="btn btn-view">View
                                        Vehicle</a>

                                    <a href="user-view-slots?vehicleId=${vehicle.id}" class="btn btn-view">View
                                        Slots</a>
                                    <c:choose>
                                        <c:when test="${vehicle.status.name() != 'SOLD'}">
                                            <form action="../vehicleapp/user-buy-vehicle" method="post"
                                                style="flex: 1;">
                                                <input type="hidden" name="vehicleId" value="${vehicle.id}">
                                                <button type="submit" class="btn btn-book">Buy Now</button>
                                            </form>
                                        </c:when>
                                        <c:otherwise>
                                            <button class="btn" style="background-color: #95a5a6;" disabled>Sold
                                                Out</button>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                    <div id="noResults" class="no-results" style="display: none;">
                        No vehicles found for this brand.
                    </div>

                    <a href="dashboard" class="back-btn">Back to Dashboard</a>
                </div>

                <script>
                    document.addEventListener('DOMContentLoaded', function () {
                        const companyButtons = document.querySelectorAll('.company-btn');
                        const vehicleCards = document.querySelectorAll('.vehicle-card');
                        const noResultsMessage = document.getElementById('noResults');
                        const vehicleContainer = document.getElementById('vehicleContainer');

                        // Get company from URL if present
                        const urlParams = new URLSearchParams(window.location.search);
                        const companyFromUrl = urlParams.get('company');

                        // Filter vehicles by company
                        function filterVehicles(company) {
                            let hasResults = false;

                            vehicleCards.forEach(card => {
                                // Normalize case for comparison
                                const cardCompany = card.dataset.company.toLowerCase();
                                const filterCompany = company.toLowerCase();

                                if (filterCompany === 'all' || cardCompany === filterCompany) {
                                    card.style.display = 'block';
                                    hasResults = true;
                                } else {
                                    card.style.display = 'none';
                                }
                            });

                            // Show/hide no results message
                            if (!hasResults && company.toLowerCase() !== 'all') {
                                noResultsMessage.style.display = 'block';
                                // Keep the grid display but hide individual items
                                vehicleContainer.style.display = 'grid';
                            } else {
                                noResultsMessage.style.display = 'none';
                                vehicleContainer.style.display = 'grid';
                            }

                            // Update active button
                            companyButtons.forEach(button => {
                                if (button.dataset.company.toLowerCase() === company.toLowerCase()) {
                                    button.classList.add('active');
                                } else {
                                    button.classList.remove('active');
                                }
                            });

                            // Update URL without reloading page
                            if (company.toLowerCase() === 'all') {
                                window.history.pushState({}, '', window.location.pathname);
                            } else {
                                // Manually encode the company name to avoid JSP processing issues
                                let encodedCompany = company.replace(/\s+/g, '%20').replace(/[&<>"']/g, function (c) {
                                    return '%' + c.charCodeAt(0).toString(16);
                                });
                                window.history.pushState({}, '', window.location.pathname + '?company=' + encodedCompany);
                            }
                        }

                        // Set initial filter from URL
                        if (companyFromUrl) {
                            filterVehicles(companyFromUrl);
                        } else {
                            // Ensure "All Brands" is active by default
                            filterVehicles('all');
                        }

                        // Add click event listeners to company buttons
                        companyButtons.forEach(button => {
                            button.addEventListener('click', function () {
                                filterVehicles(this.dataset.company);
                            });
                        });

                        // Handle browser back/forward buttons
                        window.addEventListener('popstate', function () {
                            const urlParams = new URLSearchParams(window.location.search);
                            const company = urlParams.get('company') || 'all';
                            filterVehicles(company);
                        });
                    });
                </script>
            </body>

            </html>