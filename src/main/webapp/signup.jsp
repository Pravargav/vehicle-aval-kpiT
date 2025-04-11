<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib
prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Dealer Registration</title>
    <style>
      .container {
        max-width: 800px;
        margin: 30px auto;
        padding: 20px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      }
      .form-group {
        margin-bottom: 15px;
      }
      label {
        display: inline-block;
        width: 200px;
        font-weight: bold;
      }
      input,
      select {
        width: 300px;
        padding: 8px;
        border: 1px solid #ddd;
        border-radius: 4px;
      }
      .btn-submit {
        background-color: #4caf50;
        color: white;
        padding: 10px 15px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
      }
      .error {
        color: red;
        margin-bottom: 15px;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <h1>Dealer Registration</h1>

      <c:if test="${not empty errorMessage}">
        <div class="error">${errorMessage}</div>
      </c:if>

      <form action="dealersign" method="post">
        <div class="form-group">
          <label for="email">Email:</label>
          <input type="email" id="email" name="email" required />
        </div>

        <div class="form-group">
          <label for="password">Password:</label>
          <input type="password" id="password" name="password" required />
        </div>

        <div class="form-group">
          <label for="fullName">Full Name:</label>
          <input type="text" id="fullName" name="fullName" required />
        </div>

        <div class="form-group">
          <label for="role">Role:</label>
          <select name="userRole" id="userRole">
            <c:forEach items="${dealerRoles}" var="role">
                <option value="${role}">${role.displayName}</option>
            </c:forEach>
        </select>
        </div>

        <div class="form-group">
          <label for="phone">Phone:</label>
          <input type="tel" id="phone" name="phone" />
        </div>

        <div class="form-group">
          <label for="dealershipName">Dealership Name:</label>
          <input type="text" id="dealershipName" name="dealershipName" />
        </div>

        <div class="form-group">
          <label for="defaultSlotDuration">Default Slot Duration (mins):</label>
          <input
            type="number"
            id="defaultSlotDuration"
            name="defaultSlotDuration"
            value="60"
          />
        </div>

        <div class="form-group">
          <label for="maxDailySlots">Max Daily Slots:</label>
          <input
            type="number"
            id="maxDailySlots"
            name="maxDailySlots"
            value="8"
          />
        </div>

        <div class="form-group">
          <label for="workingHoursStart">Working Hours Start:</label>
          <input
            type="time"
            id="workingHoursStart"
            name="workingHoursStart"
            value="09:00"
          />
        </div>

        <div class="form-group">
          <label for="workingHoursEnd">Working Hours End:</label>
          <input
            type="time"
            id="workingHoursEnd"
            name="workingHoursEnd"
            value="17:00"
          />
        </div>

        <div class="form-group">
          <input type="hidden" name="isActive" value="true" />
        </div>

        <button type="submit" class="btn-submit">Register</button>
      </form>
    </div>
  </body>
</html>
