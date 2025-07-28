package com.j4.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.j4.dao.UserDAO;
import com.j4.entity.User;
import com.j4.util.JpaUtil;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.TypedQuery;

/**
 * Servlet implementation class AuthServlet
 */
@WebServlet({"/dang-nhap", "/dang-ky"})
public class AuthServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AuthServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uriString = request.getRequestURI();
		if (uriString.contains("dang-ky")) {
			request.getRequestDispatcher("/views/dangky.jsp").forward(request, response);
		}else {
			request.getRequestDispatcher("/views/dangnhap.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String uriString = request.getRequestURI();
		if (uriString.contains("dang-ky")) {
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String repeatPassword = request.getParameter("repeatPassword");
			String fullName = request.getParameter("fullName");
			if (!password.equals(repeatPassword)) {
				request.setAttribute("message", "Xác nhận mật khẩu chưa đúng");
				request.getRequestDispatcher("/views/dangky.jsp").forward(request, response);
				return;
			}
			User user = new User(null, email, password, fullName, false,null, null);
			//dang ký
			dangKy(user);
			response.sendRedirect(request.getContextPath() + "/dang-nhap");
		}else {
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			User rs = UserDAO.findByIdOrEmail(email);
		
			if (rs == null || !rs.getPassword().equals(password)) {
				request.setAttribute("message", "Thông tin tài khoản chưa đúng");
				request.getRequestDispatcher("/views/dangnhap.jsp").forward(request, response);
				return;
			}
			
			request.getSession().setAttribute("user", rs);
			response.sendRedirect(request.getSession().getAttribute("uriString").toString());
			
		}
	}
	
	public User dangNhap(String email, String password) {
		//B1
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("J4Video");
		//B2:
		EntityManager entityManager = factory.createEntityManager();
		//B3
		String jpql = "select o from User o where o.email = :email";
		
		TypedQuery<User> typedQuery = entityManager.createQuery(jpql, User.class);
		typedQuery.setParameter("email", email);
		List<User> users = typedQuery.getResultList();
		if (users.size()>0) {
			User user = users.get(0);
			if (user.getPassword().equals(password)) {
				
				return user;
			}
		}
		return null;
	}
	
	public User dangNhap2(String email, String password) {
		//B1
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("J4Video");
		//B2:
		EntityManager entityManager = factory.createEntityManager();
		//B3
		String jpql = "select o from User o where o.email = ?1";
		
		TypedQuery<User> typedQuery = entityManager.createQuery(jpql, User.class);
		typedQuery.setParameter(1, email);
		User user = typedQuery.getSingleResult();
		if (user != null && user.getPassword().equals(password)) {
			return user;
		}
		return null;
	}

	public void dangKy(User user) {
		
		EntityManager entityManager = JpaUtil.getEntityManager();
		//B3
		entityManager.getTransaction().begin();
		try {
			entityManager.persist(user);
			entityManager.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entityManager.getTransaction().rollback();
		}
		entityManager.close();
		
	}


}
