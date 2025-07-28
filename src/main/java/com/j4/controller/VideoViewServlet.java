package com.j4.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.j4.dao.VideoDAO;
import com.j4.entity.Video;

@WebServlet("/xem-video")
public class VideoViewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private VideoDAO videoDAO;

    @Override
    public void init() throws ServletException {
        videoDAO = new VideoDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");

        if (idParam == null || idParam.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/404.jsp");
            return;
        }

        try {
            int id = Integer.parseInt(idParam); // Chuyển từ String sang int

            Video video = videoDAO.findById(id);
            if (video != null) {
                request.setAttribute("video", video);

                // Gợi ý: load thêm danh sách video khác
                request.setAttribute("videoList", videoDAO.findAll());

                request.getRequestDispatcher("/views/client/video-detail.jsp").forward(request, response);
            } else {
                // Video không tồn tại
                response.sendRedirect(request.getContextPath() + "/404.jsp");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/404.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/500.jsp"); // Có thể tạo trang lỗi 500 riêng
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
