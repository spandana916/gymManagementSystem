<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Slot Booking</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: rgba(242, 242, 242, 0.8);
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .heading {
            text-align: center;
            color: #333;
        }
        .slot-details {
            margin-bottom: 20px;
            padding: 10px;
            border: 1px solid rgba(0, 0, 0, 0.1);
            border-radius: 4px;
            background-color: rgba(255, 165, 0, 0.5); /* Transparent orange */
        }
        .slot-details h2 {
            background-color: transparent;
            padding: 5px;
            border-radius: 4px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 8px;
            text-align: center;
            border: 1px solid rgba(0, 0, 0, 0.1);
        }
        th {
            background-color: rgba(200, 200, 200, 0.5);
        }
        button {
            padding: 10px 20px;
            background-color: rgba(76, 175, 80, 0.8);
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 4px;
        }
        button:hover {
            background-color: rgba(76, 175, 80, 1);
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="heading">
            <h1>Slot Details</h1>
            <div class="slot-details">
                <h3>${slot.slotId}</h3>
                <h2>${slot.slotTime}</h2>
                <h1>${slot.pricing}</h1>
            </div>
        </div>
        <hr/>
        <div align="center">
            <form:form>
                <input type="hidden" value="${slot.slotId}" name="slot_id"/>
                <table>
                    <thead>
                        <tr>
                            <th>Item No</th>
                            <th>Item Name</th>
                            <th>Total Seat</th>
                            <th>Available Seat</th>
                            <th>Select</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${itemList}" var="item">
                            <tr>
                                <td>${item.itemId}</td>
                                <td>${item.itemName}</td>
                                <td>${item.totalSeat}</td>
                                <td>0</td>
                                <td><input name="selectedItem" type="radio" value="${item.itemId}"/></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <br/>
                <div align="center">
                    <button type="submit">Book</button>
                </div>
            </form:form>
        </div>
    </div>
</body>
</html>
