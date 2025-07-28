<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thống Kê Video</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f7fa;
            font-family: 'Segoe UI', sans-serif;
        }

        .container {
            margin-top: 30px;
        }

        h2 {
            font-weight: 600;
            color: #343a40;
        }

        h3 {
            font-weight: 500;
            color: #0d6efd;
        }

        .card {
            border: none;
            border-radius: 1rem;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .card-body {
            background-color: #ffffff;
            padding: 1.5rem;
        }

        .card h4 {
            color: #198754;
            font-weight: 600;
        }

        .table {
            border-radius: 0.5rem;
            overflow: hidden;
        }

        .table th {
            background-color: #0d6efd;
            color: white;
            vertical-align: middle;
        }

        .table td, .table th {
            vertical-align: middle;
        }

        .table tbody tr:hover {
            background-color: #f1f1f1;
        }

        .table td {
            font-weight: 500;
        }

        .table td, .table th {
            padding: 12px;
            text-align: center;
        }

        .table th {
            text-align: center;
        }

        .btn {
            border-radius: 0.5rem;
        }

        .btn-primary {
            background-color: #0d6efd;
            border-color: #0d6efd;
        }

        .btn-primary:hover {
            background-color: #0a58ca;
            border-color: #0a58ca;
        }
    </style>
</head>
<body>
    <div class="container">
    <jsp:include page="/views/admin/header.jsp"></jsp:include>
    <jsp:include page="/views/admin/menu.jsp"></jsp:include>
        <div class="row">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h4>Tổng số video: ${totalVideos}</h4>
                        <h4>Tổng lượt xem: ${totalViews}</h4>
                    </div>
                </div>
            </div>
        </div>

        <h3 class="mt-4">Danh sách Video</h3>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Tiêu đề</th>
                    <th scope="col">Lượt xem</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="video" items="${videoList}">
                    <tr>
                        <td>${video.id}</td>
                        <td>${video.title}</td>
                        <td>${video.views}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
