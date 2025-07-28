<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add</title>
<style>
    body {
        background-color: #f8f9fa;
        font-family: 'Segoe UI', sans-serif;
    }

    .container {
        padding-top: 2rem;
    }

    .card {
        border: none;
        border-radius: 1rem;
        box-shadow: 0 4px 16px rgba(0, 0, 0, 0.1);
        background-color: #ffffff;
    }

    .card-header {
        background-color: #fff;
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
    }

    .form-label {
        font-weight: 500;
        color: #333;
    }

    .form-control {
        border-radius: 0.5rem;
        box-shadow: none;
        border-color: #ced4da;
    }

    .form-control:focus {
        border-color: #0d6efd;
        box-shadow: 0 0 0 0.15rem rgba(13, 110, 253, 0.25);
    }

    .form-check-input {
        cursor: pointer;
    }

    .btn {
        border-radius: 0.5rem;
        padding: 0.5rem 1.2rem;
        font-weight: 500;
    }

    .btn-primary {
        background-color: #0d6efd;
        border-color: #0d6efd;
    }

    .btn-primary:hover {
        background-color: #0b5ed7;
    }

    .text-danger {
        font-size: 0.95rem;
        font-weight: 500;
        margin-bottom: 1rem;
        display: block;
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
					<h3 class="text-center text-success">Thêm mới Video</h3>
				</div>
				<div class="card-body">
					<label class="text-danger">${message }</label>
					<form action="/J4Video/admin/video/insert" method="post" enctype="multipart/form-data">
						<div class="mb-3">
						  <label for="title" class="form-label">Tiêu đề</label>
						  <input type="text" class="form-control" id="title" name="title" placeholder="Tiêu đề">
						</div>
						<div class="mb-3">
						  <label for="urlVideo" class="form-label">Link video</label>
						  <input type="text" class="form-control" id="urlVideo" name="urlVideo" placeholder="url video">
						</div>
						<div class="mb-3">
						  <label for="description" class="form-label">Mô tả</label>
						  <textarea class="form-control" id="description" name="description" rows="3"></textarea>
						</div>
						<div class="mb-3">
						  <label for="poster" class="form-label">Ảnh đại diện</label>
						  <input type="file" class="form-control" id="poster" name="poster">
						</div>
						<div class="mb-3">
						 	<label for="poster" class="form-label">Trạng thái</label>
							<div class="form-check form-check-inline">
							  <input class="form-check-input" type="radio" name="active" id="active" value="true" checked>
							  <label class="form-check-label" for="active">Hoạt động</label>
							</div>
							<div class="form-check form-check-inline">
							  <input class="form-check-input" type="radio" name="active" id="active2" value="false">
							  <label class="form-check-label" for="active2">Không hoạt động</label>
							</div>
						</div>
						
						<div class="mb-3">
							<button class="btn btn-primary">Lưu</button> 
							<a href="/J4Video/admin/video/list" class="btn btn-primary">Quay lại</a>
						</div>
					</form>
				</div>
			</div>
		</main>
	</div>
	
</body>
</html>