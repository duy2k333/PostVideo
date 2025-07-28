package com.j4.dao;

import java.util.List;

import com.j4.entity.Video;
import com.j4.util.JpaUtil;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

public class VideoDAO {
	static EntityManager entityManager = JpaUtil.getEntityManager();
	//1. lay ds
	public static List<Video> findAll() {
		String jpql = "select v from Video v order by v.id desc";
		TypedQuery<Video> query = entityManager.createQuery(jpql, Video.class);
		List<Video> videos = query.getResultList();
		
		return videos;
	}
	//2 lay theo id
	
	public static Video findById(Integer id) {
		return entityManager.find(Video.class, id);
	}
	
	//3 them
	public static int insert(Video video) {
		//B3
		entityManager.getTransaction().begin();
		try {
			entityManager.persist(video);
			entityManager.getTransaction().commit();
			return 1;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entityManager.getTransaction().rollback();
			return 0;
		}
	}
	//4 sưa
	public static int update(Video video) {
		//B3
		entityManager.getTransaction().begin();
		try {
			entityManager.merge(video);
			entityManager.getTransaction().commit();
			return 1;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entityManager.getTransaction().rollback();
			return 0;
		}
	}
	//5 xoa
	public static int delete(Integer id) {
		//B3
		entityManager.getTransaction().begin();
		try {
			Video video = entityManager.find(Video.class, id);
			entityManager.remove(video);
			entityManager.getTransaction().commit();
			return 1;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entityManager.getTransaction().rollback();
			return 0;
		}
	}
	
	//6 tim videos yeu thich theo user id
	public static List<Video> findVideoByUserId(Integer userId) {
		String jpql = "select li.video from Like li where li.user.id = :userId";
		TypedQuery<Video> query =  entityManager.createQuery(jpql, Video.class);
		query.setParameter("userId", userId);
		return query.getResultList();
	}
	// 7. Tìm video theo từ khóa trong tiêu đề hoặc mô tả
	public static List<Video> searchByKeyword(String keyword) {
	    String jpql = "SELECT v FROM Video v WHERE LOWER(v.title) LIKE :kw OR LOWER(v.description) LIKE :kw";
	    TypedQuery<Video> query = entityManager.createQuery(jpql, Video.class);
	    query.setParameter("kw", "%" + keyword.toLowerCase() + "%");
	    return query.getResultList();
	}
	public static List<Video> findOtherVideos(Integer currentVideoId) {
        // Truy vấn lấy video ngoại trừ video hiện tại
        String jpql = "SELECT v FROM Video v WHERE v.id != :currentVideoId ORDER BY v.id DESC";
        TypedQuery<Video> query = entityManager.createQuery(jpql, Video.class);
        query.setParameter("currentVideoId", currentVideoId);
        return query.getResultList();
    }
	
	
}
