<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chủ</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</head>
<body>
	
		
		<jsp:include page="/views/client/menu.jsp"></jsp:include>
		<div class="container">
		<main>
			<div class="row">
				<c:forEach items="${list}" var="video">
				<div class="col-md-3 col-sm-6 col-xs-12">
					<div class="card" style="width: 18rem; margin-bottom: 20px">
					  <img src="/J4Video/images/${video.poster}" class="card-img-top" alt="..." style="height:240px;">
					  <div class="card-body">
					    <h5 class="card-title">${video.title }</h5>
					    <p class="card-text">${video.description }</p>
					    <a href="/J4Video/yeu-thich/them?id=${video.id}" class="btn btn-outline-danger">Yêu thích</a>
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