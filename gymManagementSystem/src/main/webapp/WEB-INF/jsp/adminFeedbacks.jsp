<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Feedback</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('images/forregister.jpg');
	        background-size: cover;
            background-color: #f0f0f0;
            padding: 20px;
        }
        h2 {
            color: #333;
            text-align: center;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>
    <h2>Customer Feedbacks</h2>
    <table>
        <tr>
        	<th>Id</th>
            <th>Name</th>
            <th>Email</th>
            <th>Message</th>
        </tr>
        <c:forEach var="feedback" items="${feedbackList}">
            <tr>
            	<td>${feedback.id}</td>
                <td>${feedback.name}</td>
                <td>${feedback.email}</td>
                <td>${feedback.message}</td>
            </tr>
            <br/><br/>
        </c:forEach>
    </table>
   <div class="return-button">
        <button onclick="window.location.href='/index';">Return</button>
    </div>
</body>
</html>
