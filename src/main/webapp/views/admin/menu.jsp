<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<style>
    .navbar {
        background: linear-gradient(to right, #4e54c8, #8f94fb);
        padding: 1rem;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        border-radius: 0 0 1rem 1rem;
    }

    .navbar-brand,
    .navbar-nav .nav-link {
        color: #ffffff !important;
        font-weight: 500;
        transition: color 0.3s ease, background-color 0.3s ease;
    }

    .navbar-nav .nav-link:hover,
    .navbar-nav .nav-link.active {
        color: #ffc107 !important;
    }

    .dropdown-menu {
        border-radius: 0.5rem;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
        border: none;
        padding: 0.5rem 0;
    }

    .dropdown-item {
        padding: 0.6rem 1.2rem;
        transition: background-color 0.3s ease, color 0.3s ease;
    }

    .dropdown-item:hover {
        background-color: #f0f0f0;
        color: #4e54c8;
    }

    .navbar-toggler {
        border: none;
    }

    .navbar-toggler-icon {
        filter: invert(1); /* Biến icon thành trắng nếu nền tối */
    }
</style>

<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/J4Video/admin/video/list">Trang chủ</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/J4Video/admin/video/list">Quản lý Video</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/J4Video/user/list">Quản lý Người dùng</a>

        </li>
        <li class="nav-item">
  <a class="nav-link" href="/J4Video/admin/thong_ke">Thống kê</a>
</li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Tài khoản
          </a>
             <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="accountDropdown">
            <c:choose>
              <c:when test="${sessionScope.user == null}">
                <li><a class="dropdown-item" href="/J4Video/dang-ky">Đăng ký</a></li>
                <li><a class="dropdown-item" href="/J4Video/dang-nhap">Đăng nhập</a></li>
                <li><a class="dropdown-item" href="/J4Video/quen-mat-khau">Quên mật khẩu</a></li>
              </c:when>
              <c:otherwise>
                <li><a class="dropdown-item" href="/J4Video/ca-nhan">Cập nhật thông tin</a></li>
                <li><a class="dropdown-item" href="/J4Video/admin/video/list">Quản lí hệ thống</a></li>
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/doi-mat-khau">Đổi mật khẩu</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="/J4Video/dang-xuat">Đăng xuất</a></li>

              </c:otherwise>
            </c:choose>
          </ul>
      
    </div>
  </div>
  
</nav>
