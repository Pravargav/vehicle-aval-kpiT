package com.vehicleaval;

import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class FactoryProvider {

    private static EntityManagerFactory entityManagerFactory;

    public static EntityManagerFactory getFactory() {
        if (entityManagerFactory == null) {
            entityManagerFactory = Persistence.createEntityManagerFactory("vehi");
        }
        return entityManagerFactory;
    }

    public static void closeFactory() {
        if (entityManagerFactory != null && entityManagerFactory.isOpen()) {
            entityManagerFactory.close();
        }
    }
}
