<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Customer</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-image: url('images/forregister.jpg');
	    background-size: cover;
        background-color: #f2f2f2;
        margin: 0;
        padding: 0;
    }
    .container {
        max-width: 800px;
        margin: 20px auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    h1 {
        text-align: center;
        color: #333;
        margin-bottom: 20px;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }
    th, td {
        border: 1px solid #ddd;
        padding: 10px;
        text-align: left;
    }
    th {
        background-color: #f2f2f2;
    }
    .delete-link {
        text-decoration: none;
    }
    .delete-btn {
        background-color: #dc3545;
        color: #fff;
        border: none;
        padding: 8px 12px;
        cursor: pointer;
        border-radius: 4px;
    }
    .delete-btn:hover {
        background-color: #c82333;
    }
    .return-btn {
        background-color: #007bff;
        color: #fff;
        border: none;
        padding: 10px 20px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin-top: 20px;
        cursor: pointer;
        border-radius: 4px;
    }
    .return-btn:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
<div class="container">
    <h1>Delete Customer</h1>
    <div class="customer-table">
        <table>
            <thead>
                <tr>
                    <th>Username</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${list}" var="list">
                <tr>
                    <td>${list}</td>
                    <td>
                        <a href="/delete-customer/${list}" class="delete-link">
                            <button type="button" class="delete-btn">Delete</button>
                        </a>
                    </td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="return-container">
        <a href="/index"><button type="button" class="return-btn">Return</button></a>
    </div>
</div>
</body>
</html>