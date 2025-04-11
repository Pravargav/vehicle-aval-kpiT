package com.vehicleaval.utility;


import com.vehicleaval.entity.Dealer;
import com.vehicleaval.FactoryProvider;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;

public class DealerDao {
    
    public static Dealer findByEmail(String email) {
        EntityManager em = FactoryProvider.getFactory().createEntityManager();
        try {
            TypedQuery<Dealer> query = em.createQuery(
                "SELECT d FROM Dealer d WHERE d.email = :email", Dealer.class);
            query.setParameter("email", email);
            return query.getSingleResult();
        } catch (NoResultException e) {
            return null;
        } finally {
            em.close();
        }
    }
    
    public static void save(Dealer dealer) {
        EntityManager em = FactoryProvider.getFactory().createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(dealer);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }
    
    public static void update(Dealer dealer) {
        EntityManager em = FactoryProvider.getFactory().createEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(dealer);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }
    
    public static void delete(Long dealerId) {
        EntityManager em = FactoryProvider.getFactory().createEntityManager();
        try {
            em.getTransaction().begin();
            Dealer dealer = em.find(Dealer.class, dealerId);
            if (dealer != null) {
                em.remove(dealer);
            }
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }
}
