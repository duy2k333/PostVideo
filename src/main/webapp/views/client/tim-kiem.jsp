<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Kết quả tìm kiếm</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

  <!-- Menu -->
  <jsp:include page="/views/client/menu.jsp"></jsp:include>

  <!-- Nội dung -->
  <div class="container">
    <main>
      <h3 class="mb-4">Kết quả tìm kiếm</h3>
      
      <c:choose>
        <c:when test="${empty videos}">
          <p>Không tìm thấy video nào phù hợp.</p>
        </c:when>
        <c:otherwise>
          <div class="row">
            <c:forEach items="${videos}" var="video">
              <div class="col-md-3 col-sm-6 col-xs-12 mb-4">
                <div class="card h-100" style="width: 100%;">
                   <img src="./images/${video.poster}" class="card-img-top" alt="..." style="max-height:250px;">
                  <div class="card-body d-flex flex-column">
                    <h5 class="card-title">${video.title}</h5>
                    
                    <!-- Cắt mô tả nếu dài -->
                    <c:choose>
                      <c:when test="${fn:length(video.description) > 100}">
                        <p class="card-text">${fn:substring(video.description, 0, 100)}...</p>
                      </c:when>
                      <c:otherwise>
                        <p class="card-text">${video.description}</p>
                      </c:otherwise>
                    </c:choose>

                    <a href="/J4Video/yeu-thich/them?id=${video.id}" class="btn btn-outline-danger mt-auto">Yêu thích</a>
                  </div>
                </div>
              </div>
            </c:forEach>
          </div>
        </c:otherwise>
      </c:choose>
    </main>
  </div>

  <!-- Footer -->
  <jsp:include page="/views/client/footer.jsp"></jsp:include>

</body>
</html>
