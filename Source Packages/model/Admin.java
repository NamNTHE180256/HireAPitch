/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author dumspicy
 */
public class Admin {
    private String username;
    private String password;
    private String displayName;
    private String avatar;

    public Admin() {
    }

    public Admin(String username, String password, String displayName, String avatar) {
        this.username = username;
        this.password = password;
        this.displayName = displayName;
        this.avatar = avatar;
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

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    @Override
    public String toString() {
        return "Admin{" + "username=" + username + ", password=" + password + ", displayName=" + displayName + ", avatar=" + avatar + '}';
    }
    
    
    
}
