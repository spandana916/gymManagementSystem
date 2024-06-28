<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
	 body {
            background-image:url('images/gymItem.jpg'); 
            background-size: cover;
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        margin: 0;
        padding: 0;
    }
    .container {
        max-width: 500px;
        margin: 20px auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    .form-title {
        text-align: center;
        color: #333;
    }
    .form-group {
        margin-bottom: 15px;
    }
    .form-group label {
        display: block;
        margin-bottom: 5px;
    }
    .form-group input[type="text"], 
    .form-group button {
        width: calc(100% - 10px); /* Adjust for button padding */
        padding: 10px;
        font-size: 16px;
        border: 1px solid #ccc;
        border-radius: 3px;
    }
    .form-group button {
        background-color: #4CAF50;
        color: white;
        border: none;
        cursor: pointer;
        margin-top: 10px;
    }
    .form-group button[type="reset"] {
        background-color: #f44336;
    }
    .form-group button:hover {
        opacity: 0.8;
    }
</style>
</head>
<body>
<div class="container">
    <h3 class="form-title">Gym Item Details</h3>
    <form:form action="/gymitem" method="post" modelAttribute="itemRecord">
        <form:hidden path="itemId"/>
        
        <div class="form-group">
            <label>Enter Item Name:</label>
            <form:input path="itemName" />
        </div>
        
        <div class="form-group">
            <label>Enter Total Seat/Slot:</label>
            <form:input path="totalSeat" />
        </div>
        
        <div class="form-group">
            <button type="submit">Submit</button>
            <button type="reset">Reset</button>
        </div>
    </form:form>
</div>
</body>
</html>
