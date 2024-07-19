
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booking Details</title>
<style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('images/forregister.jpg'); 
            background-size: cover;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }

        .blur-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5); 
            z-index: -1; 
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            font-size: 24px;
            margin-bottom: 10px;
        }

        .info {
            color: #007bff; 
            font-weight: bold;
        }

        button {
            padding: 10px 20px;
            background-color: #007bff;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background-color: #0056b3; 
        }
    </style>
</head>
<body>
<div class="blur-overlay"></div>
<div class="container">
	<h1>Your Seat has been Booked Successfully!!</h1>
    <h1>Booking ID: <span class="info">${gymbook.bookingId}</span></h1>
    <h1>Slot ID: <span class="info">${gymbook.slotId}</span></h1>
    <h1>Item ID: <span class="info">${gymbook.itemId}</span></h1>
    <h1>User ID: <span class="info">${gymbook.username}</span></h1>
    <button onclick="window.location.href='/index'">Return</button>
</div>
</body>
</html>
