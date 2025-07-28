<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>
<style>
    body {
        background: #f8f9fa;
        display: flex;
        align-items: center;
        justify-content: center;
        height: 100vh;
        margin: 0;
    }

    .card {
        max-width: 400px;
        width: 100%;
        margin: auto;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        border-radius: 1rem;
        border: none;
    }

    .card-header {
        background-color: #fff;
        border-bottom: none;
        padding-top: 2rem;
    }

    .card-body {
        padding: 2rem;
    }

    h1 {
        font-size: 1.8rem;
        margin-bottom: 1rem;
    }

    label {
        font-weight: 500;
    }

    .btn-primary {
        width: 100%;
        padding: 0.6rem;
        font-weight: 500;
        border-radius: 0.5rem;
    }

    .text-danger {
        display: block;
        margin-bottom: 1rem;
        text-align: center;
        font-weight: bold;
    }

    .text-center {
        text-align: center;
    }

    .forgot-password {
        display: block;
        margin-top: 10px;
        text-align: center;
        font-size: 0.9rem;
    }
</style>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>

<body>
	<div class="container">
		<header></header>
		<nav></nav>
		<main>
			<div class="card">
				<div class="card-header">
					<h1 class="text-center text-primary">Đăng nhập</h1>
				</div>
				<div class="card-body">
					<label class="text-danger">${message}</label>
					<form action="/J4Video/dang-nhap" method="post">
						<div class="mb-3">
						  <label for="email" class="form-label">Email</label>
						  <input type="email" class="form-control" id="email" name="email" placeholder="name@example.com" required>
						</div>
						<div class="mb-3">
						  <label for="password" class="form-label">Mật khẩu</label>
						  <input type="password" class="form-control" id="password" name="password" placeholder="Mật khẩu" required>
						</div>
						
						<div class="mb-3">
						  <button class="btn btn-primary">Đăng nhập</button>
						</div>
					</form>

					
					<a href="${pageContext.request.contextPath}/quen-mat-khau" class="forgot-password">Quên mật khẩu?</a>
				</div>
			</div>
		</main>
		<footer></footer>
	</div>
</body>
</html>
