<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Registration</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f8f9fa;
        color: #333;
        line-height: 1.6;
        margin: 0;
        padding: 0;
    }
    
    .container {
        width: 100%;
        padding-right: 15px;
        padding-left: 15px;
        margin-right: auto;
        margin-left: auto;
    }
    
    .signup-container {
        max-width: 600px;
        margin: 50px auto;
        padding: 40px;
        background: #fff;
        box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        border-radius: 10px;
        transition: all 0.3s ease;
    }
    
    .signup-container:hover {
        box-shadow: 0 10px 25px rgba(0,0,0,0.15);
    }
    
    h2.text-center {
        color: #2c3e50;
        margin-bottom: 30px;
        font-weight: 600;
        text-align: center;
        position: relative;
        padding-bottom: 15px;
    }
    
    h2.text-center:after {
        content: '';
        position: absolute;
        bottom: 0;
        left: 50%;
        transform: translateX(-50%);
        width: 80px;
        height: 3px;
        background: #3498db;
    }
    
    .form-group {
        margin-bottom: 25px;
    }
    
    .form-row {
        display: flex;
        flex-wrap: wrap;
        margin-right: -10px;
        margin-left: -10px;
    }
    
    .form-col {
        padding-right: 10px;
        padding-left: 10px;
        flex: 1 0 0%;
    }
    
    label {
        display: inline-block;
        margin-bottom: 8px;
        font-weight: 500;
        color: #495057;
    }
    
    .form-control {
        display: block;
        width: 100%;
        padding: 12px 15px;
        font-size: 16px;
        line-height: 1.5;
        color: #495057;
        background-color: #fff;
        background-clip: padding-box;
        border: 1px solid #ced4da;
        border-radius: 6px;
        transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
    }
    
    .form-control:focus {
        border-color: #80bdff;
        outline: 0;
        box-shadow: 0 0 0 0.2rem rgba(0,123,255,0.25);
    }
    
    .btn {
        display: inline-block;
        font-weight: 400;
        text-align: center;
        white-space: nowrap;
        vertical-align: middle;
        user-select: none;
        border: 1px solid transparent;
        padding: 12px 24px;
        font-size: 16px;
        line-height: 1.5;
        border-radius: 6px;
        transition: all 0.3s ease;
        cursor: pointer;
    }
    
    .btn-primary {
        color: #fff;
        background-color: #3498db;
        border-color: #3498db;
    }
    
    .btn-primary:hover {
        background-color: #2980b9;
        border-color: #2980b9;
        transform: translateY(-2px);
    }
    
    .btn-lg {
        padding: 12px 30px;
        font-size: 18px;
    }
    
    .text-center {
        text-align: center;
    }
    
    /* Responsive adjustments */
    @media (max-width: 768px) {
        .signup-container {
            padding: 30px 20px;
            margin: 30px auto;
        }
        
        .form-row {
            flex-direction: column;
        }
        
        .form-col {
            padding-right: 0;
            padding-left: 0;
        }
    }
    
    /* Animation for form elements */
    .form-group {
        animation: fadeIn 0.5s ease forwards;
    }
    
    @keyframes fadeIn {
        from {
            opacity: 0;
            transform: translateY(20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }
    
    /* Add delay to each form group */
    .form-group:nth-child(1) { animation-delay: 0.1s; }
    .form-group:nth-child(2) { animation-delay: 0.2s; }
    .form-group:nth-child(3) { animation-delay: 0.3s; }
    .form-group:nth-child(4) { animation-delay: 0.4s; }
    .form-group:nth-child(5) { animation-delay: 0.5s; }
</style>
</head>
<body>

    <div class="container">
        <div class="signup-container">
            <h2 class="text-center mb-4">Create Your Account</h2>
            
            <form action="../signup" method="post">
                <div class="form-row">
                    <div class="form-col">
                        <div class="form-group">
                            <label for="fullName">Full Name</label>
                            <input 
                                type="text" 
                                class="form-control" 
                                id="fullName" 
                                name="fullName"
                                required
                                placeholder="Enter your full name">
                        </div>
                    </div>
                    <div class="form-col">
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input 
                                type="email" 
                                class="form-control" 
                                id="email" 
                                name="email"
                                required
                                placeholder="Enter your email">
                        </div>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-col">
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input 
                                type="password" 
                                class="form-control" 
                                id="password" 
                                name="password"
                                required
                                placeholder="Create a password">
                        </div>
                    </div>
                    <div class="form-col">
                        <div class="form-group">
                            <label for="confirmPassword">Confirm Password</label>
                            <input 
                                type="password" 
                                class="form-control" 
                                id="confirmPassword" 
                                name="confirmPassword"
                                required
                                placeholder="Confirm your password">
                        </div>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-col">
                        <div class="form-group">
                            <label for="phone">Phone Number</label>
                            <input 
                                type="tel" 
                                class="form-control" 
                                id="phone" 
                                name="phone"
                                placeholder="Enter phone number">
                        </div>
                    </div>
                    <div class="form-col">
                        <div class="form-group">
                            <label for="driverLicense">Driver License</label>
                            <input 
                                type="text" 
                                class="form-control" 
                                id="driverLicense" 
                                name="driverLicense"
                                placeholder="Enter driver license">
                        </div>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="dateOfBirth">Date of Birth</label>
                    <input 
                        type="date" 
                        class="form-control" 
                        id="dateOfBirth" 
                        name="dateOfBirth">
                </div>
                
                <div class="container text-center">
                    <button type="submit" class="btn btn-primary btn-lg">Create Account</button>
                </div>
            </form>
        </div>
    </div>

</body>
</html>