
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booked Slots</title>
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
            background-color: rgba(0, 0, 0, 0.5); /* semi-transparent black */
            z-index: -1; /* push it below other content */
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .table-container {
            margin-top: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        th {
            background-color: #f2f2f2;
        }

        .return {
            display: block;
            width: 100px;
            padding: 10px;
            text-align: center;
            margin: 20px auto;
            background-color: #007bff;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .return:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="blur-overlay"></div>
<div class="container">
    <div class="table-container">
     
        <table>
            <tr>
                <th>Booking Id</th>
                <th>Slot Id</th>
                <th>Item Id</th>
                <th>User Name</th>
            </tr>
            <c:forEach items="${bookList}" var="item">
                <tr>
                    <td>${item.bookingId}</td>
                    <td>${item.slotId}</td>
                    <td>${item.itemId}</td>
                    <td>${item.username}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <button class="return" onclick="window.location.href='/index'">Return</button>
</div>
</body>
</html>
