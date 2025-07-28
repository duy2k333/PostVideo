<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang chủ</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    
    <style>
        /* Cải thiện kiểu hình ảnh */
        .card-img-top {
            border-radius: 8px; /* Bo góc hình ảnh */
            object-fit: cover; /* Đảm bảo hình ảnh không bị kéo dãn */
            height: 240px; /* Giới hạn chiều cao của hình ảnh */
        }

        /* Chỉnh sửa phần mô tả video */
        .card-body {
            padding: 15px; /* Thêm padding để tạo không gian */
        }

        .card-title {
            font-size: 1.1rem; /* Tăng kích thước font của tiêu đề */
            font-weight: bold;
        }

        .card-text {
            font-size: 0.9rem; /* Kích thước font cho mô tả */
            color: #666; /* Màu sắc nhạt cho mô tả */
            height: 60px; /* Đảm bảo mô tả không quá dài */
            overflow: hidden;
            text-overflow: ellipsis; /* Hiển thị "..." nếu mô tả quá dài */
        }

        /* Cải thiện nút */
        .btn-sm {
            font-size: 0.85rem;
            padding: 5px 10px; /* Cải thiện độ rộng nút */
        }

        .btn-outline-danger, .btn-outline-primary {
            width: 45%; /* Nút có kích thước đều */
        }

        .d-flex {
            justify-content: space-between; /* Đảm bảo các nút được căn đều */
        }

        /* Thêm margin cho các card */
        .card {
            margin-bottom: 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Thêm bóng cho card */
        }
    </style>
</head>
<body>
    <jsp:include page="/views/client/menu.jsp"></jsp:include>
    <div class="container">
        <main>
            <div class="row">
                <c:forEach items="${list}" var="video">
                    <div class="col-md-3 col-sm-6 col-xs-12">
                        <div class="card" style="width: 18rem;">
                            <img src="./images/${video.poster}" class="card-img-top" alt="..." />
                            <div class="card-body">
                                <h5 class="card-title">${video.title}</h5>
                                <p class="card-text">${video.description}</p>
                                <div class="d-flex justify-content-between">
                                    <a href="/J4Video/yeu-thich/them?id=${video.id}" class="btn btn-outline-danger btn-sm">Yêu thích</a>
                                    <a href="${pageContext.request.contextPath}/chi-tiet?id=${video.id}" class="btn btn-outline-primary btn-sm">Xem video</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </main>
    </div>
    <jsp:include page="/views/client/footer.jsp"></jsp:include>
</body>
</html>
