<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Slot Report</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
    }
    .container {
        width: 80%;
        margin: 20px auto;
        background-color: #fff;
        padding: 20px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        border-radius: 5px;
    }
    h1 {
        font-size: 24px;
        color: #333;
        text-align: center;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }
    th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
    }
    th {
        background-color: #f2f2f2;
    }
    tr:nth-child(even) {
        background-color: #f9f9f9;
    }
    .return {
        margin-top: 20px;
        text-align: center;
    }
    .return button {
        padding: 10px 20px;
        background-color: #007bff;
        color: #fff;
        border: none;
        cursor: pointer;
        border-radius: 5px;
    }
    .return button:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
	<div class="container">
		<form action="/slotreport" method="post">
			<table>
				<caption>
					<h1>
						<i>Slots</i>
					</h1>
				</caption>
				<tr>
					<th>Slot Id</th>
					<th>Slot Time</th>
					<th>Slot Price</th>
					<th>Edit</th>
				</tr>
				<c:forEach items="${slotList}" var="slot">
					<tr>
						<td>${slot.slotId}</td>
						<td>${slot.slotTime}</td>
						<td>${slot.pricing}</td>
						<td><a href="/slot/edit/${slot.slotId}">Edit</a></td>
					</tr>
				</c:forEach>
			</table>
			<div class="return">
				<a href="/index"><button type="button">Return</button></a>
			</div>
		</form>
	</div>
</body>
</html>