/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author dumspicy
 */
public class Staff {
    private int staffId;
    private String username;
    private String password;
    private String displayName;
    private String phoneNumber;
    private String avatar;

    public Staff() {
    }

    public Staff(int staffId, String username, String password, String displayName, String phoneNumber, String avatar) {
        this.staffId = staffId;
        this.username = username;
        this.password = password;
        this.displayName = displayName;
        this.phoneNumber = phoneNumber;
        this.avatar = avatar;
    }

    public int getStaffId() {
        return staffId;
    }

    public void setStaffId(int staffId) {
        this.staffId = staffId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDisplayName() {
        return displayName;
    }

    public void setDisplayName(String displayName) {
        this.displayName = displayName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    @Override
    public String toString() {
        return "Staff{" + "staffId=" + staffId + ", username=" + username + ", password=" + password + ", displayName=" + displayName + ", phoneNumber=" + phoneNumber + ", avatar=" + avatar + '}';
    }
}
