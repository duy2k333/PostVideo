package com.j4.controller;

import com.j4.dao.VideoDAO; // Giả sử bạn có VideoDAO để truy vấn dữ liệu từ DB
import com.j4.entity.Video;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/thong_ke")
public class ThongKeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ThongKeServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        VideoDAO videoDAO = new VideoDAO();
        List<Video> videoList = videoDAO.findAll(); // Lấy danh sách video từ DB
        
        // Tính tổng số lượt xem
        long totalViews = videoList.stream().mapToLong(Video::getViews).sum();

        // Gửi dữ liệu thống kê sang JSP
        request.setAttribute("videoList", videoList);
        request.setAttribute("totalViews", totalViews);
        request.setAttribute("totalVideos", videoList.size());

        // Chuyển hướng sang trang thống kê
        request.getRequestDispatcher("/views/admin/thong_ke.jsp").forward(request, response);
    }
}
