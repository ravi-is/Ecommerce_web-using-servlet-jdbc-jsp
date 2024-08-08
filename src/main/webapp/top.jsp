<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>E-Commerce Site</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        header {
            background: #8697C4;
            color: #333;
            padding: 10px 0;
            text-align: center;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
        }

        header h1 {
            margin: 0;
            font-size: 2.5em;
        }

        nav {
            margin: 70px 0 20px;
            text-align: center;
            background-color: #ADBBDA;
            padding: 10px 0;
        }

        nav a {
            color: #fff;
            text-decoration: none;
            margin: 0 15px;
            font-size: 1.1em;
        }

        nav a:hover {
            color: #ffd700;
        }

        main {
            padding: 100px 20px;
        }

        .welcome-message {
            font-weight: bold;
            font-size: 1.2em;
            color: #333;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #f9f9f9;
            display: inline-block;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <header>
        <h1>Buy Anything.com</h1>
    </header>
    
    <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
        <a href="login.jsp">Login</a>
        <a href="register.jsp">Register</a>
    </nav>

    <main>
        <!-- Main content goes here -->
    </main>
</body>
</html>
