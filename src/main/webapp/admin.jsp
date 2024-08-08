<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f8f9fa;
        padding: 20px;
    }
    h2 {
        margin-bottom: 30px;
    }
</style>
</head>
<body>
<%@ include file="top.jsp" %>
<div class="container">
    <h2>Admin Dashboard</h2>
    <a href="logout" class="btn btn-secondary mb-3">Logout</a>
    <form action="AdminServlet" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="title">Title:</label>
            <input type="text" id="title" name="title" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="price">Price:</label>
            <input type="number" id="price" name="price" class="form-control" step="0.01" required>
        </div>
        <div class="form-group">
            <label for="discount">Discount:</label>
            <input type="number" id="discount" name="discount" class="form-control" step="0.01" required>
        </div>
        <div class="form-group">
            <label for="image">Image:</label>
            <input type="file" id="image" name="image" class="form-control-file" required>
        </div>
        <input type="submit" class="btn btn-primary" value="Add Product">
    </form>
    <c:if test="${not empty successMessage}">
        <div class="alert alert-success mt-3">${successMessage}</div>
    </c:if>
</div>
<%@ include file="bottom.jsp" %>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
