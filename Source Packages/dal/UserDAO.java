/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Statement;
import java.util.ArrayList;
import model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class UserDAO extends DBContext{
    public ArrayList<User> getAllUsers(){
        ArrayList<User> list = new ArrayList<>();
        try {
            String sql="select * from [User]";
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while(rs.next()){
                User u = new User();
                u.setId(rs.getInt(1));
                u.setUsername(rs.getString(2));
                u.setPassword(rs.getString(3));
                u.setDisplay_name(rs.getString(4));
                u.setPhone_number(rs.getString(5));
                u.setEmail(rs.getString(6));
                u.setAvatar(rs.getString(7));
                u.setRole(rs.getString(8));
                list.add(u);
            }
            rs.close();
            st.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }
    
    public ArrayList<User> getAllUserByRole(String role){
        ArrayList<User> list = new ArrayList<>();
        try {
            String sql="select * from [User] where [Role] = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, role);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                User u = new User();
                u.setId(rs.getInt(1));
                u.setUsername(rs.getString(2));
                u.setPassword(rs.getString(3));
                u.setDisplay_name(rs.getString(4));
                u.setPhone_number(rs.getString(5));
                u.setEmail(rs.getString(6));
                u.setAvatar(rs.getString(7));
                u.setRole(rs.getString(8));
                list.add(u);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }
    
    public void deleteUser(int userId) {
        try {
            String deleteBookingFDSsql = "DELETE FROM Booking_FDS_detail WHERE Booking_id IN (SELECT Booking_id FROM Booking WHERE [User_id] = ?)";
            PreparedStatement deleteBookingFDSStatement = connection.prepareStatement(deleteBookingFDSsql);
            deleteBookingFDSStatement.setInt(1, userId);
            deleteBookingFDSStatement.executeUpdate();
            deleteBookingFDSStatement.close();

            String deleteBookingStuffSql = "DELETE FROM Booking_Stuff_detail WHERE Booking_id IN (SELECT Booking_id FROM Booking WHERE [User_id] = ?)";
            PreparedStatement deleteBookingStuffStatement = connection.prepareStatement(deleteBookingStuffSql);
            deleteBookingStuffStatement.setInt(1, userId);
            deleteBookingStuffStatement.executeUpdate();
            deleteBookingStuffStatement.close();

            String deleteBookingSql = "DELETE FROM Booking WHERE [User_id] = ?";
            PreparedStatement deleteBookingStatement = connection.prepareStatement(deleteBookingSql);
            deleteBookingStatement.setInt(1, userId);
            deleteBookingStatement.executeUpdate();
            deleteBookingStatement.close();

            String deleteUserSql = "DELETE FROM [User] WHERE [User_id] = ?";
            PreparedStatement deleteUserStatement = connection.prepareStatement(deleteUserSql);
            deleteUserStatement.setInt(1, userId);
            deleteUserStatement.executeUpdate();
            deleteUserStatement.close();
        } catch (Exception e) {
            // Handle any exceptions
            System.out.println("Error deleting user and corresponding bookings: " + e.getMessage());
        }
    }

    
    public void updateUser(User user) {
        try {
            String sql = "UPDATE [User] SET username = ?, password = ?, display_name = ?, phone_number = ?, email = ?, avatar = ? WHERE [User_id] = ?";
            
            PreparedStatement pstmt = connection.prepareStatement(sql);
            
            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getPassword());
            pstmt.setString(3, user.getDisplay_name());
            pstmt.setString(4, user.getPhone_number());
            pstmt.setString(5, user.getEmail());
            pstmt.setString(6, user.getAvatar());
            pstmt.setInt(7, user.getId());
            
            pstmt.executeUpdate();
            
            pstmt.close();
        } catch (Exception e) {
            System.out.println("Error updating user: " + e.getMessage());
        }
    }
    
    public ArrayList<User> getAllStaffs(){
        ArrayList<User> list = new ArrayList<>();
        try {
            String sql="select * from [User] where [Role] = ?";
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while(rs.next()){
                User u = new User();
                u.setId(rs.getInt(1));
                u.setUsername(rs.getString(2));
                u.setPassword(rs.getString(3));
                u.setDisplay_name(rs.getString(4));
                u.setPhone_number(rs.getString(5));
                u.setEmail(rs.getString(6));
                u.setAvatar(rs.getString(7));
                u.setRole(rs.getString(8));
                list.add(u);
            }
            rs.close();
            st.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }
    
    public User login(String username, String password) {
        String sql = "select * from [User] where Username = ? and [Password] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt(1));
                u.setUsername(rs.getString(2));
                u.setPassword(rs.getString(3));
                u.setDisplay_name(rs.getString(4));
                u.setPhone_number(rs.getString(5));
                u.setEmail(rs.getString(6));
                u.setAvatar(rs.getString(7));
                u.setRole(rs.getString(8));
                return u;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    
    public User getUserById(int id) {
        String sql = "select * from [User] where [User_id] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User u = new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8));
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    public boolean phoneExisted(String phone) {
        ArrayList<User> userList = getAllUsers();
        for (User user : userList) {
            if (user.getPhone_number()!= null && user.getPhone_number().equals(phone)) {
                return true; 
            }
        }
        return false; 
    }
    
 
    public boolean emailExisted(String email) {
        ArrayList<User> userList = getAllUsers();
        for (User user : userList) {
            if (user.getEmail() != null && user.getEmail().equals(email)) {
                return true; 
            }
        }
        return false;
    }
    
  
    public boolean usernameExisted(String username) {
        ArrayList<User> userList = getAllUsers();
        for (User user : userList) {
            if (user.getUsername() != null && user.getUsername().equals(username)) {
                return true; 
            }
        }
        return false; 
    }
    
    public void insert(String username, String password, String displayName, String phoneNumber, String email, String avatar, String role) {
        try {
            // Prepare SQL statement with parameters
            String sql = "INSERT INTO [User](Username, [Password], Display_name, Phone_number, Email, Avatar, [Role]) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement st = connection.prepareStatement(sql);
            // Set values for parameters
            st.setString(1, username);
            st.setString(2, password);
            st.setString(3, displayName);
            st.setString(4, phoneNumber);
            st.setString(5, email);
            st.setString(6, avatar);
            st.setString(7, role);
            
            // Execute the statement
            st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            System.out.println("Error occurred while inserting user: " + e.getMessage());
        }
    }
    
    public static void main(String[] args) {
        UserDAO uDao = new UserDAO();
        ArrayList<User> list = uDao.getAllUsers();
        for (User u : list) {
            System.out.println(u);
        }
        
    }
}
