package com.j4.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.j4.dao.UserDAO;
import com.j4.entity.User;

/**
 * Servlet implementation class DoiMatKhauServlet
 */
@WebServlet("/doi-mat-khau")
public class DoiMatKhauServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoiMatKhauServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/client/doi-mat-khau.jsp").forward(request, response);
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/dangnhap.jsp");
            return;
        }

        if (!user.getPassword().equals(oldPassword)) {
            request.setAttribute("message", "Mật khẩu cũ không đúng!");
        } else if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("message", "Xác nhận mật khẩu không khớp!");
        } else {
            // Update password in DB
            user.setPassword(newPassword);

            // Ví dụ nếu bạn dùng DAO
            UserDAO dao = new UserDAO();
            dao.update(user);

            request.setAttribute("message", "Đổi mật khẩu thành công!");
        }

        request.getRequestDispatcher("/views/client/doi-mat-khau.jsp").forward(request, response);
    }

}
