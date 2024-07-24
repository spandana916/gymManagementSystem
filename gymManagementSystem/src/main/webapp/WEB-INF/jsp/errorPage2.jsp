<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Exception</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        margin: 0;
        padding: 0;
    }
    .container {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    .data {
        text-align: center;
        background-color: #fff;
        padding: 30px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    p {
        margin-bottom: 10px;
        color: #333;
    }
    a {
        text-decoration: none;
    }
    button {
        background-color: #007bff;
        color: #fff;
        border: none;
        padding: 10px 20px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin-top: 15px;
        cursor: pointer;
        border-radius: 4px;
    }
    button:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
<div class="container">
    <div class="data">
        <p>Oh! Sorry</p>
        <p>${errorMessage}</p>
        <a href="/index"><button type="button">Return to Home</button></a>
    </div>
</div>
</body>
</html>