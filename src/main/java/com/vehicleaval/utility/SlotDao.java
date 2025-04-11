

package com.vehicleaval.utility;

import java.util.List;

import com.vehicleaval.FactoryProvider;
import com.vehicleaval.entity.Slot;
import jakarta.persistence.EntityManager;

public class SlotDao {
    public static void save(Slot slot) {
        EntityManager em = FactoryProvider.getFactory().createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(slot);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }
    
    public static List<Slot> findByVehicleId(Long vehicleId) {
        EntityManager em = FactoryProvider.getFactory().createEntityManager();
        try {
            return em.createQuery(
                "SELECT s FROM Slot s WHERE s.vehicle.id = :vehicleId ORDER BY s.startTime", 
                Slot.class)
                .setParameter("vehicleId", vehicleId)
                .getResultList();
        } finally {
            em.close();
        }
    }

    public static Slot findById(Long slotId) {
        EntityManager em = FactoryProvider.getFactory().createEntityManager();
        try {
            return em.find(Slot.class, slotId);
        } finally {
            em.close();
        }
    }
    
    public static void update(Slot slot) {
        EntityManager em = FactoryProvider.getFactory().createEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(slot);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }
}