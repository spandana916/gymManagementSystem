<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Exercise</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 600px;
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
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin-bottom: 8px;
        }
        input[type="text"], input[type="number"] {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            width: 100%;
            box-sizing: border-box;
            font-size: 16px;
        }
        button[type="submit"], button[type="reset"], button[type="button"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 12px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin-top: 10px;
            cursor: pointer;
            border-radius: 4px;
        }
        button[type="submit"]:hover, button[type="reset"]:hover, button[type="button"]:hover {
            background-color: #0056b3;
        }
    </style>       
</head>
<body>
    <div class="container">
        <h1>Edit Gym Item</h1>
        <form:form id="edit-item-form" action="/gymitem/update" method="post" modelAttribute="itemRecord">
            <div>
                <label for="itemName">New Item Name:</label>
                <form:input path="itemName"/>
            </div>
            <form:hidden path="itemId"/>
            <div>
                <label for="totalSeat">Total Seat:</label>
                <form:input path="totalSeat" required="required"/>
            </div>
            <button type="submit">Update Item</button>
            <br/>
            <button type="reset">Reset</button>
            <br/>
            <a href="/gymitem"><button type="button">Return</button></a>
        </form:form>
    </div>
</body>
</html>