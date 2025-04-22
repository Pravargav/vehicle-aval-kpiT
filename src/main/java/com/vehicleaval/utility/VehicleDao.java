package com.vehicleaval.utility;

import com.vehicleaval.entity.Vehicle;
import com.vehicleaval.FactoryProvider;
import jakarta.persistence.EntityManager;
import java.util.List;

public class VehicleDao{
    
    public static void save(Vehicle vehicle) {
        EntityManager em = FactoryProvider.getFactory().createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(vehicle);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }
    
    public static Vehicle findById(Long id) {
        EntityManager em = FactoryProvider.getFactory().createEntityManager();
        try {
            return em.find(Vehicle.class, id);
        } finally {
            em.close();
        }
    }
    
    public static List<Vehicle> findByDealerId(Long dealerId) {
        EntityManager em = FactoryProvider.getFactory().createEntityManager();
        try {
            return em.createQuery(
                "SELECT v FROM Vehicle v WHERE v.dealer.id = :dealerId ORDER BY v.createdAt DESC", 
                Vehicle.class)
                .setParameter("dealerId", dealerId)
                .getResultList();
        } finally {
            em.close();
        }
    }
    
    public static void update(Vehicle vehicle) {
        EntityManager em = FactoryProvider.getFactory().createEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(vehicle);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }
    
    public static void delete(Long vehicleId) {
        EntityManager em = FactoryProvider.getFactory().createEntityManager();
        try {
            em.getTransaction().begin();
            Vehicle vehicle = em.find(Vehicle.class, vehicleId);
            if (vehicle != null) {
                em.remove(vehicle);
            }
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public static List<Vehicle> findAvailableForSlots() {
        EntityManager em = FactoryProvider.getFactory().createEntityManager();
        try {
            return em.createQuery(
                "SELECT v FROM Vehicle v WHERE v.availableForSlots = true AND v.status = 'AVAILABLE' ORDER BY v.createdAt DESC", 
                Vehicle.class)
                .getResultList();
        } finally {
            em.close();
        }
    }

    public Vehicle getVehicleById(Long vehicleId) {
        EntityManager em = FactoryProvider.getFactory().createEntityManager();
        try {
            return em.find(Vehicle.class, vehicleId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    
}
