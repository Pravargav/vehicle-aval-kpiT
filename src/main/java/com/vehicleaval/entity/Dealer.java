package com.vehicleaval.entity;

import jakarta.persistence.*;
import java.util.*;

@Entity
@Table(name = "dealers")
public class Dealer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "dealer_id")
    private Long id;

    @Column(nullable = false, unique = true, length = 50)
    private String email;

    @Column(nullable = false, length = 64)
    private String passwordHash;

    @Column(name = "full_name", nullable = false, length = 100)
    private String fullName;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false, length = 20)
    private DealerRole role;

    @Column(length = 20)
    private String phone;

    @Column(name = "dealership_name", length = 100)
    private String dealershipName;

    @Column(name = "default_slot_duration", nullable = false)
    private Integer defaultSlotDuration = 60;

    @Column(name = "max_daily_slots", nullable = false)
    private Integer maxDailySlots = 8;

    @Column(name = "working_hours_start", length = 5)
    private String workingHoursStart = "09:00";

    @Column(name = "working_hours_end", length = 5)
    private String workingHoursEnd = "17:00";

    @Column(name = "is_active", nullable = false)
    private Boolean isActive = true;

    @OneToMany(mappedBy = "dealer")
    private Set<Vehicle> managedVehicles = new HashSet<>();

    @OneToMany(mappedBy = "createdBy")
    private List<Slot> createdSlots = new ArrayList<>();

    public enum DealerRole {
        ADMIN("Administrator"),
        MANAGER("Manager"),
        SALES_REP("Sales Representative"),
        INVENTORY_MGR("Inventory Manager");
        
        private final String displayName;
        
        DealerRole(String displayName) {
            this.displayName = displayName;
        }
        
        public String getDisplayName() {
            return displayName;
        }
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPasswordHash() {
        return passwordHash;
    }

    public void setPasswordHash(String passwordHash) {
        this.passwordHash = passwordHash;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public DealerRole getRole() {
        return role;
    }

    public void setRole(DealerRole role) {
        this.role = role;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getDealershipName() {
        return dealershipName;
    }

    public void setDealershipName(String dealershipName) {
        this.dealershipName = dealershipName;
    }

    public Integer getDefaultSlotDuration() {
        return defaultSlotDuration;
    }

    public void setDefaultSlotDuration(Integer defaultSlotDuration) {
        this.defaultSlotDuration = defaultSlotDuration;
    }

    public Integer getMaxDailySlots() {
        return maxDailySlots;
    }

    public void setMaxDailySlots(Integer maxDailySlots) {
        this.maxDailySlots = maxDailySlots;
    }

    public String getWorkingHoursStart() {
        return workingHoursStart;
    }

    public void setWorkingHoursStart(String workingHoursStart) {
        this.workingHoursStart = workingHoursStart;
    }

    public String getWorkingHoursEnd() {
        return workingHoursEnd;
    }

    public void setWorkingHoursEnd(String workingHoursEnd) {
        this.workingHoursEnd = workingHoursEnd;
    }

    public Boolean getIsActive() {
        return isActive;
    }

    public void setIsActive(Boolean isActive) {
        this.isActive = isActive;
    }

    public Set<Vehicle> getManagedVehicles() {
        return managedVehicles;
    }

    public void setManagedVehicles(Set<Vehicle> managedVehicles) {
        this.managedVehicles = managedVehicles;
    }

    public List<Slot> getCreatedSlots() {
        return createdSlots;
    }

    public void setCreatedSlots(List<Slot> createdSlots) {
        this.createdSlots = createdSlots;
    }

    // Add these constructors to your existing Dealer class
    public Dealer() {
    }

    public Dealer(String email, String passwordHash, String fullName, DealerRole role) {
        this.email = email;
        this.passwordHash = passwordHash;
        this.fullName = fullName;
        this.role = role;
        this.isActive = true;
    }
}