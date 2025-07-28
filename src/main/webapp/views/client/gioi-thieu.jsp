<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Giới thiệu - J4Video</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

    <jsp:include page="/views/client/menu.jsp" />

    <div class="container py-5">
        <!-- Phần tiêu đề -->
        <div class="text-center mb-5">
            <h1 class="fw-bold">Giới thiệu về TDTMVD</h1>
            <p class="text-muted">Nền tảng chia sẻ video hiện đại – dễ dùng, linh hoạt và kết nối cộng đồng.</p>
        </div>

        <!-- Phần giới thiệu chung -->
        <div class="row align-items-center mb-5">
            <div class="col-md-6 mb-4">
                <img src="/J4Video/images/hinh.webp" class="img-fluid rounded shadow" alt="Giới thiệu TDTMVD">
            </div>
            <div class="col-md-6">
                <h3>TDTMVD là gì?</h3>
                <p>TDTMVD là nền tảng xem và chia sẻ video trực tuyến được thiết kế dành cho mọi lứa tuổi. Với tiêu chí đơn giản - nhanh chóng - thân thiện, người dùng có thể dễ dàng tìm kiếm, xem, và quản lý các video yêu thích chỉ với vài cú click.</p>

                <h4 class="mt-4">Chức năng nổi bật:</h4>
                <ul>
                    <li>Thư viện video phong phú, đa dạng thể loại</li>
                    <li>Hệ thống yêu thích & quản lý tài khoản cá nhân</li>
                    <li>Tìm kiếm nhanh theo từ khóa</li>
                    <li>Thiết kế responsive - tương thích mọi thiết bị</li>
                </ul>
            </div>
        </div>

        <!-- Mục tiêu -->
        <div class="mb-5">
            <h3 class="fw-semibold">Sứ mệnh & Mục tiêu</h3>
            <p>Chúng tôi không chỉ xây dựng một website chia sẻ video, mà còn tạo ra một không gian kết nối cộng đồng – nơi mọi người có thể học hỏi, giải trí và truyền cảm hứng cho nhau thông qua nội dung chất lượng.</p>
        </div>

        <!-- Giá trị cốt lõi -->
        <div class="mb-5">
            <h3 class="fw-semibold">Giá trị cốt lõi</h3>
            <div class="row">
                <div class="col-md-4">
                    <div class="border p-3 rounded shadow-sm h-100">
                        <h5 class="text-primary">1. Sự đơn giản</h5>
                        <p>Giao diện trực quan giúp người dùng tiếp cận và sử dụng dễ dàng ngay từ lần đầu tiên.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="border p-3 rounded shadow-sm h-100">
                        <h5 class="text-success">2. Tính hiệu quả</h5>
                        <p>Tối ưu hóa hiệu suất hệ thống, đảm bảo trải nghiệm mượt mà ngay cả khi có nhiều người truy cập.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="border p-3 rounded shadow-sm h-100">
                        <h5 class="text-warning">3. Sự sáng tạo</h5>
                        <p>Liên tục cập nhật và đổi mới để mang lại những tính năng mới, phù hợp với xu hướng hiện đại.</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Đội ngũ phát triển -->
        <div class="mb-5">
            <h3 class="fw-semibold">Đội ngũ phát triển</h3>
            <div class="row text-center">
                <div class="col-md-3">
                    <img src="/J4Video/images/hinh6.jpg" class="rounded-circle shadow mb-2" width="120" height="120">
                    <h6 class="fw-bold">Phúc Duy</h6>
                    <p class="text-muted">Backend Developer</p>
                </div>
                <div class="col-md-3">
                    <img src="/J4Video/images/hinh2.jpg" class="rounded-circle shadow mb-2" width="120" height="120">
                    <h6 class="fw-bold">Mạnh Tường</h6>
                    <p class="text-muted">Frontend Developer</p>
                </div>
                <div class="col-md-3">
                    <img src="/J4Video/images/hinh5.jpg" class="rounded-circle shadow mb-2" width="120" height="120">
                    <h6 class="fw-bold">Thế Tài</h6>
                    <p class="text-muted">UI/UX Designer</p>
                </div>
                <div class="col-md-3">
                    <img src="/J4Video/images/hinh3.jpg" class="rounded-circle shadow mb-2" width="120" height="120">
                    <h6 class="fw-bold">Quang Minh</h6>
                    <p class="text-muted">Team Leader</p>
                </div>
            </div>
        </div>

        <!-- Cảm ơn -->
        <div class="text-center">
            <h4 class="fw-semibold text-success">Cảm ơn bạn đã đồng hành cùng TDTMVD!</h4>
            <p>Hãy cùng nhau tạo nên một cộng đồng chia sẻ video tích cực và sáng tạo!</p>
        </div>
    </div>

    <jsp:include page="/views/client/footer.jsp" />

</body>
</html>
