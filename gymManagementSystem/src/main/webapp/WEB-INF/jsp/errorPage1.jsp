
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error Page-1</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('images/forregister.jpg');
	        background-size: cover;
            background-color: #f2f2f2;
            text-align: center;
            margin: 0;
            padding: 0;
        }
        .error-container {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 400px;
            margin: 50px auto;
        }
        h1 {
            color: #333333;
        }
        p {
            color: #666666;
            margin-bottom: 10px;
        }
        a {
            color: #007bff;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="error-container">
    <h1>Error Page-1</h1>
    <p>${errorPage1}</p>
    <p>Oh Sorry!!</p>
    <p>You have already booked a seat in this slot :(</p>
    <p>Please try to book in another slot :)</p> 
    <a href="/index">Return</a>   
    </div> 
</body>
</html>