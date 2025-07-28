<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chi tiết video</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="/views/client/menu.jsp"></jsp:include>

<div class="container mt-5">
    <div class="row">
        <!-- CỘT TRÁI: Video chính -->
        <div class="col-md-8">
            <c:if test="${not empty video}">
                <!-- Lấy ID video từ URL YouTube -->
                <c:set var="videoId" value="${fn:substringAfter(video.urlVideo, 'v=')}" />
                <c:if test="${fn:length(videoId) > 0}">
                    <div class="ratio ratio-16x9">
                        <iframe src="https://www.youtube.com/embed/${videoId}"
                                title="YouTube video player" frameborder="0"
                                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                                allowfullscreen>
                        </iframe>
                    </div>

                    <div class="mt-3">
                        <h2>${video.title}</h2>
                        <p>${video.description}</p>
                        <a href="/J4Video/yeu-thich/them?id=${video.id}" class="btn btn-outline-danger">Yêu thích</a>
                        <a href="/J4Video/trang-chu" class="btn btn-secondary">Quay lại</a>
                    </div>
                </c:if>
                <c:if test="${fn:length(videoId) == 0}">
                    <div class="alert alert-danger">Video không hợp lệ hoặc không thể phát.</div>
                </c:if>
            </c:if>

            <c:if test="${empty video}">
                <div class="alert alert-danger">Không tìm thấy thông tin video.</div>
            </c:if>
        </div>

        <!-- CỘT PHẢI: Video khác -->
        <div class="col-md-4">
            <h5>Video khác</h5>
            <c:forEach var="v" items="${videoList}">
                <div class="card mb-3">
                    <div class="row g-0">
                        <div class="col-4">
                            <img src="./images/${v.poster}" class="img-fluid rounded-start" alt="${v.title}">
                        </div>
                        <div class="col-8">
                            <div class="card-body p-2">
                                <a href="${pageContext.request.contextPath}/chi-tiet?id=${v.id}" class="text-decoration-none text-dark">
                                    <h6 class="card-title mb-0">${v.title}</h6>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

<jsp:include page="/views/client/footer.jsp"></jsp:include>
</body>
</html>
