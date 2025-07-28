package com.j4.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.j4.dao.UserDAO;
import com.j4.entity.User;

@WebServlet("/ca-nhan")
public class CaNhanServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    public CaNhanServlet() {
        super();
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

  if (user == null) {
            response.sendRedirect(request.getContextPath() + "/dangnhap.jsp");
            return;
        }

        request.setAttribute("user", user);
         request.getRequestDispatcher("/views/client/ca-nhan.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/dangnhap.jsp");
            return;
        }

         String email = request.getParameter("email");

        user.setEmail(email);

       try {
            userDAO.updatee(user);
            session.setAttribute("user", user);
            request.setAttribute("user", user);
            request.setAttribute("message", "Cập nhật email thành công!");
        } catch (Exception e) {
            request.setAttribute("message", "Lỗi: " + e.getMessage());
        }

        request.getRequestDispatcher("/views/client/ca-nhan.jsp").forward(request, response);
    }
}
