<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
<style>
    body {
        background-color: #f5f7fa;
        font-family: 'Segoe UI', sans-serif;
    }

    .container {
        padding-top: 2rem;
    }

    .card {
        border: none;
        border-radius: 1rem;
        box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
        overflow: hidden;
    }

    .card-header {
        background-color: #ffffff;
        border-bottom: 1px solid #dee2e6;
        padding: 1.5rem;
    }

    .card-header h3 {
        margin: 0;
        font-weight: 600;
        color: #198754;
    }

    .card-body {
        padding: 2rem;
        background-color: #fff;
    }

    .btn-primary {
        margin-bottom: 1rem;
        font-weight: 500;
        border-radius: 0.5rem;
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

    .table img {
        border-radius: 8px;
        object-fit: cover;
    }

    .btn-warning, .btn-danger {
        padding: 0.4rem 0.8rem;
        font-size: 0.9rem;
        font-weight: 500;
        border-radius: 0.4rem;
    }

    .btn-warning:hover {
        background-color: #ffc107cc;
    }

    .btn-danger:hover {
        background-color: #dc3545cc;
    }

    .text-success {
        color: #198754 !important;
    }
</style>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
	
		<jsp:include page="/views/admin/header.jsp"></jsp:include>
		<jsp:include page="/views/admin/menu.jsp"></jsp:include>
		
		<main>
			<div class="card">
				<div class="card-header">
					<h3 class="text-center text-success">Danh sách Video</h3>
				</div>
				<div class="card-body">
					<a href="/J4Video/admin/video/add" class="btn btn-primary">Thêm mới</a>
					<table class="table">
					  <thead>
					    <tr>
					      <th scope="col">Id</th>
					      <th scope="col">Ảnh</th>
					      <th scope="col">Tiêu đề</th>
					      <th scope="col">Lượt xem</th>
					      <th scope="col">Trạng thái</th>
					      <th scope="col" width="15%">Hành động</th>
					    </tr>
					  </thead>
					  <tbody>
					  	<c:forEach items="${list}" var="video">
					    <tr>
					      <th scope="row">${video.id}</th>
					      <td>
					      	<img alt="" src="/J4Video/images/${video.poster}" width="50" height="50">
					      </td>
					      <td>${video.title}</td>
					      <td>${video.views}</td>
					      <td>${video.active?'Hoạt động':'Tắt'}</td>
					      <td>
					      	<a href="/J4Video/admin/video/edit?id=${video.id}" class="btn btn-warning">Sửa</a> |
					      	<a href="/J4Video/admin/video/delete?id=${video.id}" class="btn btn-danger">Xóa</a>
					      </td>
					    </tr>
					    </c:forEach>
					  </tbody>
					</table>
				</div>
			</div>
		</main>
	</div>
	
</body>
</html>