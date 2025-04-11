package com.vehicleaval.utility;



import com.vehicleaval.entity.User;
import com.vehicleaval.FactoryProvider;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;

public class UserDao {

    public static User getUserByEmail(String email) {
        EntityManager entityManager = FactoryProvider.getFactory().createEntityManager();
        try {
            return entityManager.createQuery("SELECT u FROM User u WHERE u.email = :email", User.class)
                              .setParameter("email", email)
                              .getSingleResult();
        } catch (NoResultException e) {
            return null;
        } finally {
            entityManager.close();
        }
    }

    public static void saveUser(User user) {
        EntityManager entityManager = FactoryProvider.getFactory().createEntityManager();
        try {
            entityManager.getTransaction().begin();
            entityManager.persist(user);
            entityManager.getTransaction().commit();
        } finally {
            entityManager.close();
        }
    }
}