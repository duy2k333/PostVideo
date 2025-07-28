package com.j4.controller;

import com.j4.dao.UserDAO;
import com.j4.entity.User;
import com.j4.util.EmailUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/quen-mat-khau")
public class AuthForgotPasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Xử lý yêu cầu quên mật khẩu
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");

        // Kiểm tra xem email có tồn tại trong cơ sở dữ liệu không
        User user = UserDAO.findByEmail(email);

        if (user != null) {
            // Tạo một token reset mật khẩu
            String resetToken = generateResetToken(email);

            // Tạo liên kết để thay đổi mật khẩu
            String resetLink = "http://localhost:8080/J4Video/doi-mat-khau?email=" + email + "&token=" + resetToken;

            // Gửi email chứa liên kết thay đổi mật khẩu
            EmailUtil.sendResetPasswordEmail(user.getEmail(), resetLink);

            // Gửi thông báo cho người dùng
            request.setAttribute("message", "Đã gửi email hướng dẫn thay đổi mật khẩu.");
        } else {
            // Nếu không tìm thấy email
            request.setAttribute("message", "Email không tồn tại trong hệ thống.");
        }

        // Quay lại trang đăng nhập với thông báo
        request.getRequestDispatcher("/views/dangnhap.jsp").forward(request, response);
    }

    // Tạo một token để thay đổi mật khẩu (có thể dùng email + token để tạo link bảo mật hơn)
    private String generateResetToken(String email) {
        return email + "-reset-token";  // Chỉnh sửa để bảo mật hơn
    }
}
