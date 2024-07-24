<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Item List</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: rgba(0, 0, 0, 0.5);
        margin: 0;
        padding: 0;
    }
    .container {
        width: 80%;
        margin: 20px auto;
        background-color: #fff;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        border-radius: 8px;
        padding: 20px;
    }
    h2 {
        text-align: center;
        font-style: italic;
        text-decoration: underline;
        color: #333;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        border-radius: 8px;
        overflow: hidden;
    }
    th, td {
        padding: 12px;
        text-align: center;
    }
    th {
        background-color: #007bff;
        color: white;
    }
    td {
        background-color: #f8f9fa;
        color: #333;
    }
    tr:nth-child(even) td {
        background-color: #e9ecef;
    }
    a {
        display: inline-block;
        text-align: center;
        margin-top: 20px;
        color: #007bff;
        text-decoration: none;
        padding: 10px 20px;
        border: 2px solid #007bff;
        border-radius: 5px;
        transition: background-color 0.3s, color 0.3s, border-color 0.3s;
    }
    a:hover {
        background-color: red;
        color: white;
        border-color: red;
        text-decoration: none;
    }
</style>
</head>
<body>
<div class="container">
    <h2>All Items</h2>
    <table>
        <tr>
            <th>Item Number</th>
            <th>Item Name</th>
            <th>Total Seats</th>
            <th>Edit</th>
        </tr>
        <c:forEach items="${itemList}" var="item">
            <tr>
                <td>${item.itemId}</td>
                <td>${item.itemName}</td>
                <td>${item.totalSeat}</td>
                <td><a href="/gymitem/edit/${item.itemId}">Edit</a></td> 
            </tr>
        </c:forEach>
    </table>
    <br/><br/>
    <a href="/index">Return</a>
</div>
</body>
</html>
