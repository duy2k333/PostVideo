<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!-- Bootstrap & Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

<nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-3">
  <div class="container-fluid">
    
    <a href="/J4Video/trang-chu">
		<img alt="" src="/J4Video/images/hinh.webp" width="55">
	</a>

    <!-- Responsive toggle -->
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
            aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <!-- Navbar content -->
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      
      <!-- Left menu -->
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link" href="/J4Video/trang-chu">Trang chủ</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/J4Video/videos/list">Videos</a>
        </li>
        <c:if test="${sessionScope.user != null}">
          <li class="nav-item">
            <a class="nav-link" href="/J4Video/yeu-thich">Yêu thích</a>
          </li>
        </c:if>
        <li class="nav-item">
         <a class="nav-link" href="/J4Video/views/client/gioi-thieu.jsp">Giới thiệu</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/J4Video/views/client/lien-he.jsp">Liên hệ</a>
        </li>
      </ul>

      <!-- Search bar -->
      <form class="d-flex me-3" role="search" action="/J4Video/tim-kiem" method="get">
        <input class="form-control me-2" type="search" name="keyword" placeholder="Tìm video..." aria-label="Search">
        <button class="btn btn-outline-light" type="submit">
          <i class="bi bi-search"></i>
        </button>
      </form>

      <!-- User dropdown (no fullname) -->
      <ul class="navbar-nav">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="accountDropdown" role="button"
             data-bs-toggle="dropdown" aria-expanded="false">
            <i class="bi bi-person-circle"></i> Tài khoản
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
        </li>
      </ul>

    </div>
  </div>
</nav>
