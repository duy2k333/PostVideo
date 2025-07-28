package com.j4.dao;

import java.util.List;

import com.j4.entity.User;
import com.j4.util.JpaUtil;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;

public class UserDAO {
	static EntityManager entityManager = JpaUtil.getEntityManager();
	
	//kiem tra user co it nhat 1 luot like
	public static List<User> findUserHasLike() {
		String jpqlString = "select u from User u where u.likes is not empty";
		TypedQuery<User> query = entityManager.createQuery(jpqlString, User.class);
		return query.getResultList();
	}
	
	//find all
	public static List<User> findAll() {
		
		TypedQuery<User> query = entityManager.createNamedQuery("User.findAll", User.class);
		return query.getResultList();
				
	}
	
	//find by id
	public static User findById(Integer id) {
		return entityManager.find(User.class, id);
	}
	
	//find by email
	public static User findByEmail(String email) {
		
		TypedQuery<User> query = entityManager.createNamedQuery("User.findByEmail", User.class);
		query.setParameter("email", email);
		return query.getSingleResult();
	}
	
	//find by id or email
	public static User findByIdOrEmail(String idOrEmail) {
		String jpql = "select u from User u where u.email = :email or u.id = :id";
		TypedQuery<User> query = entityManager.createQuery(jpql, User.class);
		query.setParameter("email", idOrEmail);
		try {
			Integer id = Integer.parseInt(idOrEmail);
			System.out.println(id);
			query.setParameter("id", id);
		} catch (Exception e) {
			// TODO: handle exception
			query.setParameter("id", 0);
			
		}
		return query.getSingleResult();
	}
	
	//find by keyword
	
	public void update(User user) {
	    EntityManager em = JpaUtil.getEntityManager();
	    EntityTransaction trans = em.getTransaction();
	    try {
	        trans.begin();
	        em.merge(user);
	        trans.commit();
	    } catch (Exception e) {
	        trans.rollback();
	        throw e;
	    } finally {
	        em.close();
	    }
	}
	
	 public void updatee(User user) {
	        EntityManager em = JpaUtil.getEntityManager();
	        EntityTransaction trans = em.getTransaction();
	        try {
	            trans.begin();
	            em.merge(user);
	            trans.commit();
	        } catch (Exception e) {
	            trans.rollback();
	            throw e;
	        } finally {
	            em.close();
	        }
	    }
	 
	 public static void updateee(User user) {
	        EntityManager em = JpaUtil.getEntityManager();
	        EntityTransaction trans = em.getTransaction();
	        try {
	            trans.begin();
	            em.merge(user);
	            trans.commit();
	        } catch (Exception e) {
	            trans.rollback();
	            throw e;
	        } finally {
	            em.close();
	        }
	    }

	    // === Delete User === //
	    public static void delete(User user) {
	        EntityManager em = JpaUtil.getEntityManager();
	        EntityTransaction trans = em.getTransaction();
	        try {
	            trans.begin();
	            User managedUser = em.find(User.class, user.getId());
	            if (managedUser != null) {
	                em.remove(managedUser);
	            }
	            trans.commit();
	        } catch (Exception e) {
	            trans.rollback();
	            throw e;
	        } finally {
	            em.close();
	        }
	    }
}
