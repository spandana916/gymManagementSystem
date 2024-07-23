<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Decoders Gym Center</title>
    <style>
        body {
            background-image: url('images/index.jpg'); 
            background-size: cover;
            background-color: #f0f0f0;
            font-family: Arial, sans-serif;
            color: #333;
            margin: 0;
            padding: 0;
        }
        .container{
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            text-align: center;
        }
        h1 {
            color: skyblue;
            font-family: sans-serif-bold-italic;
        }
        h3 {
            margin: 0; 
        }
        h3 a {
            display: inline-block;
            color: red;
            text-decoration: none;
            padding: 14px 20px; 
            text_align:center;
        }
        h3 a:hover {
            color: darkred;
        }
        .navbar {
            overflow: hidden;
            background-color: green;
        }
        
        .navbar a {
            float: left;
            font-size: 16px;
            color: white;
            padding: 14px 20px;
            text-decoration: none;
        }
        
        .navbar a:hover {
            background-color: darkgreen;
        }
        
        .dropdown {
            float: left;
            overflow: hidden;
        }
        
        .dropdown .dropbtn {
            font-size: 16px;    
            border: none;
            outline: none;
            color: white;
            padding: 14px 20px;
            background-color: inherit;
            font-family: inherit;
            margin: 0;
        }
        
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }
        
        .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            text-align: left;
        }
        
        .dropdown-content a:hover {
            background-color: #ddd;
        }
        
        .dropdown:hover .dropdown-content {
            display: block;
        }
        
        .about-content {
            display: none;
            margin-top: 20px;
            text-align: center;
            color: white;
        }
        
        .about-content.active {
            display: block;
        }
        
        .return-button {
            background-color: #333;
            color: white;
            border: none;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s, color 0.3s;
            margin-top: 10px;
        }
        
        .return-button:hover {
            background-color: #555;
        }
    </style>
    
    <script>
        function toggleAboutContent() {
            var aboutContent = document.querySelector('.about-content');
            aboutContent.classList.toggle('active');
        }
        
    </script>
</head>
<body>
    <div class="container">
        <h1>Welcome to Decoders Gym Center</h1>
        <br/><br/>
        <div class="navbar">
            <a href="#">Home</a>
            <a href="#" onclick="toggleAboutContent()">About</a>
            
            
            <div class="dropdown">
                <button class="dropbtn">GymItem
                    <i class="fa fa-caret-down"></i>
                </button>
                <div class="dropdown-content">
                    <a href="/gymitem">Item Addition</a>
                    <br/><br/>
                    <a href="/gymitems">Item Reports</a>
                </div>
            </div>
            
            <div class="dropdown">
                <button class="dropbtn">Slot
                    <i class="fa fa-caret-down"></i>
                </button>
                <div class="dropdown-content">
                    <a href="/slot">Slot Addition</a>
                    <br/><br/>
                    <a href="/slots">Slot Reports</a>
                </div>
            </div>
            
    
            <div class="dropdown">
                <button class="dropbtn">Slot Booking
                    <i class="fa fa-caret-down"></i>
                </button>
                <div class="dropdown-content">
                    <a href="/slots">All Slots</a>
                    <br/><br/>
                    <a href="/bookings">All Bookings</a>
                </div>
            </div>
            
            <a href="/feedback">CustomerFeedback</a>
        </div>
        <br/><br/>
        <h3><a href="/logout">Logout</a></h3>
    </div>
    
    <div class="about-content" id="aboutContent">
        <h2>About Decoders Gym Center</h2>
        <p>Welcome to Decoders Gym Center, where fitness meets technology. We provide state-of-the-art equipment and personalized training programs to help you achieve your fitness goals.</p>
        <button class="return-button" onclick="toggleAboutContent()">Return Back</button>
    </div>
</body>
</html>
