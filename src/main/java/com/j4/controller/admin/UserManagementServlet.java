package com.j4.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.j4.dao.UserDAO;
import com.j4.entity.User;

@WebServlet("/user/list")
public class UserManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");
		String idParam = request.getParameter("id");

		if (action != null && idParam != null) {
			try {
				int id = Integer.parseInt(idParam);
				User user = UserDAO.findById(id);

				if (user != null) {
					if (action.equals("delete")) {
						UserDAO.delete(user);
					} else if (action.equals("lock")) {
						user.setAdmin(false); // khoá tài khoản
						UserDAO.updateee(user);
					} else if (action.equals("unlock")) {
						user.setAdmin(true); // mở lại tài khoản
						UserDAO.updateee(user);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("error", "Thao tác thất bại: " + e.getMessage());
			}
		}

		List<User> users = UserDAO.findAll();
		request.setAttribute("users", users);
		request.getRequestDispatcher("/views/admin/video/user-list.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}