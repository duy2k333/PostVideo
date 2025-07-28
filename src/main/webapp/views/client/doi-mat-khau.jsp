<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đổi mật khẩu</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body >
<jsp:include page="/views/client/menu.jsp" />
 <div class="container">
    <h2>Đổi mật khẩu</h2>
 
    <form method="post" action="${pageContext.request.contextPath}/doi-mat-khau">
        <div class="mb-3">
            <label for="oldPassword" class="form-label">Mật khẩu cũ:</label>
            <input type="password" class="form-control" name="oldPassword" required>
        </div>
        <div class="mb-3">
            <label for="newPassword" class="form-label">Mật khẩu mới:</label>
            <input type="password" class="form-control" name="newPassword" required>
        </div>
        <div class="mb-3">
            <label for="confirmPassword" class="form-label">Xác nhận mật khẩu mới:</label>
            <input type="password" class="form-control" name="confirmPassword" required>
        </div>
        <button type="submit" class="btn btn-primary">Cập nhật</button>
    </form>

    <c:if test="${not empty message}">
        <div class="alert alert-info mt-3">${message}</div>
    </c:if>
    </div>
     <jsp:include page="/views/client/footer.jsp" />
</body>
</html>
