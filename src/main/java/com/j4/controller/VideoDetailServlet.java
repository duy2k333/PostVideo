package com.j4.controller;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.j4.dao.VideoDAO;
import com.j4.entity.Video;

@WebServlet("/chi-tiet")
public class VideoDetailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private VideoDAO videoDAO;

    @Override
    public void init() throws ServletException {
        videoDAO = new VideoDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("-id");

        if (idParam == null || idParam.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/404.jsp"); // Trường hợp không có id
            return;
        }

        try {
            Integer id = Integer.parseInt(idParam); // Chuyển từ String sang Integer
            Video video = videoDAO.findById(id);

            if (video != null) {
                // Thay vì lấy tất cả video và lọc trong bộ nhớ, bạn có thể viết truy vấn JPQL để tìm video khác
                List<Video> otherVideos = videoDAO.findOtherVideos(id);

                // Gửi dữ liệu đến JSP
                request.setAttribute("video", video);
                request.setAttribute("videoList", otherVideos);
                request.getRequestDispatcher("/views/client/video-detail.jsp").forward(request, response);
                return;
            }
        } catch (NumberFormatException e) {
            // Xử lý lỗi khi ID không hợp lệ
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace(); // Log lỗi chung
        }

        // Trường hợp lỗi hoặc không tìm thấy video
        response.sendRedirect(request.getContextPath() + "/404.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
