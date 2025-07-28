<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Liên hệ - J4Video</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<jsp:include page="/views/client/menu.jsp" />

<div class="container py-5">
    <div class="text-center mb-5">
        <h2 class="fw-bold">Liên hệ với TDTMVD</h2>
        <p class="text-muted">Nếu bạn có bất kỳ thắc mắc hoặc góp ý nào, đừng ngần ngại gửi cho chúng tôi!</p>
    </div>

    <div class="row">
        <!-- Form liên hệ -->
        <div class="col-md-6 mb-4">
            <form action="lien-he" method="post">
                <div class="mb-3">
                    <label for="name" class="form-label">Họ và tên</label>
                    <input type="text" class="form-control" id="name" name="name" placeholder="Nhập họ tên của bạn" required>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Địa chỉ Email</label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="you@example.com" required>
                </div>
                <div class="mb-3">
                    <label for="message" class="form-label">Nội dung</label>
                    <textarea class="form-control" id="message" name="message" rows="5" placeholder="Nhập nội dung liên hệ..." required></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Gửi liên hệ</button>
            </form>
        </div>

        <!-- Thông tin liên hệ -->
        <div class="col-md-6 mb-4">
            <h5>Thông tin liên hệ</h5>
            <p><strong>Địa chỉ:</strong> 123 Nguyễn Văn Cừ, Quận 5, TP. HCM</p>
            <p><strong>Email:</strong> support@j4video.vn</p>
            <p><strong>Hotline:</strong> 0909 123 456</p>

            <h6 class="mt-4">Bản đồ</h6>
            <iframe
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.443528580194!2d106.69336841480095!3d10.776374292321785!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752eecc5b18407%3A0xd15417a3a7e0737f!2zMTIzIE5ndXnhu4VuIFbEg24gQ-G7pywgUXXhuq1uIDUsIEjDoCBO4buZaSwgVMOHoSBQaMO6YyBDaMOidSwgVmnhu4d0IE5hbQ!5e0!3m2!1svi!2s!4v1681010101010!5m2!1svi!2s"
                width="100%" height="250" style="border:0;" allowfullscreen="" loading="lazy">
            </iframe>
        </div>
    </div>
</div>

<jsp:include page="/views/client/footer.jsp" />

</body>
</html>
