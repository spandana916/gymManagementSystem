<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>New User Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('images/forregister.jpg'); 
            background-size: cover;
            background-color: rgba(0, 0, 0, 0.5);
            color: #333;
            margin: 0;
            padding: 0;
        }

        #container {
    		width: 300%; 
    		max-width: 500px; 
     		height: auto;
    		margin: 50px auto;
    		padding: 20px;
    		background-color: rgba(233, 236, 239, 0.8); /* Transparent gray */
    		border-radius: 5px;
    		box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		}

        h2 {
            text-align: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
            font-weight: bold;
            color: green; 
            margin-bottom: 20px;
        }

        form {
            text-align: left;
        }

        input[type="text"], input[type="password"], select {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }

        button[type="button"], button[type="reset"] {
            background-color: #007bff; 
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 10px;
            transition: background-color 0.3s ease;
        }

        button[type="button"]:hover, button[type="reset"]:hover {
            background-color: #0056b3;
        }

        button[type="reset"] {
            background-color: red; 
        }

        .error {
            color: red;
        }
    </style>
</head>
<body>
    <div id="container">
        <h2>New User Registration</h2>
        <form:form id="registration-form" method="post" action="/register" modelAttribute="userRecord">
            <label for="firstName">Enter First Name:</label><br/>
            <form:input path="firstName"/><br/><br/>
            <label for="lastName">Enter Last Name:</label><br/>
            <form:input path="lastName"/><br/><br/>
            <label for="email">Enter Email:</label><br/>
            <form:input path="email"/><br/><br/>
            <label for="type">Select User Type:</label><br/>
            <form:input list="types" name="type" id="type" path="type"/>
            <datalist id="types">
                <option value="Customer">
                <option value="Admin">
            </datalist><br/><br/>
            <label for="username">Enter User ID:</label><br/>
            <form:input path="username"/><br/><br/>
            <label for="password">Enter Password:</label><br/>
            <input type="password" id="pass1" name="password"/><br/><br/>
            <label for="confirmPassword">Re-type Password:</label><br/>
            <input type="password" id="pass2" name="confirmPassword"/><br/><br/>
            <button type="button" onclick="validatePassword()">Submit</button>
            <button type="reset">Reset</button>
            <div id="password-error" class="error" style="display: none;"></div>
        </form:form>
    </div>

    <script type="text/javascript">
        function validatePassword() {
            var pass1 = document.getElementById("pass1").value;
            var pass2 = document.getElementById("pass2").value;
            var passwordError = document.getElementById("password-error");

            if (pass1 !== pass2) {
                passwordError.innerText = "Passwords do not match";
                passwordError.style.display = "block";
                return;
            }

            var passwordRegex = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,10}$/;
            if (!passwordRegex.test(pass1)) {
                passwordError.innerText = "Password must contain at least one digit, one special character, and be 6-10 characters long";
                passwordError.style.display = "block";
                return;
            }

            document.getElementById("registration-form").submit();
        }
    </script>
</body>
</html>
