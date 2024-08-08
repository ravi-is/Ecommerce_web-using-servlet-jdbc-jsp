<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f8f9fa;
        padding: 20px;
    }
    h2 {
        margin-bottom: 30px;
        color: #dc3545;
    }
    p {
        font-size: 1.2em;
        margin-bottom: 20px;
    }
    a {
        color: #007bff;
        transition: color 0.3s ease-in-out;
    }
    a:hover {
        color: #0056b3;
    }
</style>
</head>
<body>
<%@ include file="top.jsp" %>
<div class="container">
    <h2>Error</h2>
    <p><%= request.getAttribute("errorMessage") %></p>
    <a href="index.jsp"><i class="fas fa-home"></i> Go back to Home</a>
</div>
<%@ include file="bottom.jsp" %>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
