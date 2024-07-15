<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Login Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('images/LOGIN.avif'); 
            background-size: cover;
            background-color:rgba(0, 0, 0, 0.5); 
            color: #333;
            margin: 0;
            padding: 0;
        }

       .container {
   		   width: 50%;
           max-width: 400px;
           margin: 100px auto;
           padding: 20px;
           background-color: rgba(233, 236, 239, 0.8); 
           border-radius: 5px;
           box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
         
        }

        .main-heading {
            text-align: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
            font-style: bold; 
            color: green; 
            font-size: 24px;
            margin-bottom: 20px;
        }

        form {
            text-align: left;
        }

        input[type="text"], input[type="password"], input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            box-sizing: border-box;
            border: 1px solid #ccc; 
            border: 1px solid rgba(204, 204, 204, 0.8); 
            border-radius: 4px;
            font-size: 16px;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
            border: none;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #0056b3; 
        }

        h2 {
            text-align: center;
            margin-top: 20px;
        }

        a {
            color: red; 
            font-size: 20px;
            text-decoration: none;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
            font-style: italic; 
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <c:url value="/login" var="login" />
    <div class="container">
        <h2 class="main-heading">Login to Decoders Gym Center</h2>
        <form:form action="${login}" method="post">
        	<br/><br/>
            Enter User Id: <input name="username" type="text" />
            <br /><br />
            Enter Password: <input type="password" name="password" />
            <br /><br />
            <input type="submit" value="Submit" />
        </form:form>
        <h2>
            <a href="/register">New User? Click here to register</a>
        </h2>
    </div>
</body>
</html>
