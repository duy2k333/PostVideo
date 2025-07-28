<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng ký</title>
<style>
    body {
        background: linear-gradient(to right, #74ebd5, #ACB6E5);
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 0;
        font-family: 'Segoe UI', sans-serif;
    }

    .container {
        max-width: 500px;
        width: 100%;
    }

    .card {
        border: none;
        border-radius: 1rem;
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        background-color: #ffffffcc;
        backdrop-filter: blur(10px);
    }

    .card-header {
        background-color: transparent;
        border-bottom: none;
        padding-top: 1.5rem;
    }

    h1 {
        font-size: 2rem;
        font-weight: 600;
        color: #0d6efd;
        margin-bottom: 1rem;
    }

    .card-body {
        padding: 2rem;
    }

    .form-label {
        font-weight: 500;
    }

    .form-control {
        border-radius: 0.5rem;
        padding: 0.5rem 1rem;
        font-size: 1rem;
    }

    .btn-primary {
        width: 100%;
        padding: 0.6rem;
        font-weight: 500;
        font-size: 1rem;
        border-radius: 0.5rem;
        transition: background-color 0.3s ease;
    }

    .btn-primary:hover {
        background-color: #0b5ed7;
    }

    .text-danger {
        display: block;
        text-align: center;
        font-weight: 600;
        margin-bottom: 1rem;
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
					<h1 class="text-center text-primary">Đăng ký</h1>
				</div>
				<div class="card-body">
					<label class="text-danger">${message}</label>
					<form action="/J4Video/dang-ky" method="post">
						<div class="mb-3">
						  <label for="email" class="form-label">Email</label>
						  <input type="email" class="form-control" id="email" name="email" placeholder="name@example.com">
						</div>
						<div class="mb-3">
						  <label for="password" class="form-label">Mật khẩu</label>
						  <input type="password" class="form-control" id="password" name="password" placeholder="Mật khẩu">
						</div>
						<div class="mb-3">
						  <label for="repeatPassword" class="form-label">Xác nhận mật khẩu</label>
						  <input type="password" class="form-control" id="repeatPassword" name="repeatPassword" placeholder="Xác nhận mật khẩu">
						</div>
						<div class="mb-3">
						  <label for="fullname" class="form-label">Họ tên</label>
						  <input type="text" class="form-control" id="fullName" name="fullName" placeholder="Họ và tên">
						</div>
						<div class="mb-3">
						  <button class="btn btn-primary">Đăng ký</button>
						</div>
					</form>
				</div>
			</div>
		</main>
		<footer></footer>
	</div>
</body>
</html>