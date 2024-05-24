/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import model.FDS;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;
/**
 *
 * @author dumspicy
 */
public class FDS_DAO extends DBContext{
    public ArrayList<FDS> getAllFoodAndDrink(){
        ArrayList<FDS> listFDS = new ArrayList<>();
        try {
            String sql = "select * from FDS";
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while(rs.next()){
                FDS f = new FDS();
                f.setFDS_id(rs.getInt(1));
                f.setFDS_name(rs.getString(2));
                f.setAmount(rs.getInt(3));
                f.setPrice(rs.getInt(4));
                f.setImage(rs.getString(5));
                f.setType(rs.getString(6));
                listFDS.add(f);
            }
            rs.close();
            st.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listFDS;
    }
    
    public void add(FDS fd) {
        try {
            String sql = "INSERT INTO FDS(FDS_name, Amount_exist, Price, [Image], [Type]) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(sql);

            stmt.setString(1, fd.getFDS_name());
            stmt.setInt(2, fd.getAmount());
            stmt.setInt(3, fd.getPrice());
            stmt.setString(4, fd.getImage());
            stmt.setString(5, fd.getType());

            stmt.executeUpdate();
            stmt.close();
        } catch (SQLException e) {
            System.out.println("Error adding food and drink item: " + e.getMessage());
        }
    }
    
    public void update(FDS fd) {
        try {
            String sql = "UPDATE FDS SET FDS_name = ?, Amount_exist = ?, Price = ?, [Image] = ?, [Type] = ? WHERE FDS_id = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);

            stmt.setString(1, fd.getFDS_name());
            stmt.setInt(2, fd.getAmount());
            stmt.setInt(3, fd.getPrice());
            stmt.setString(4, fd.getImage());
            stmt.setString(5, fd.getType());
            stmt.setInt(6, fd.getFDS_id());

            stmt.executeUpdate();
            stmt.close();
        } catch (SQLException e) {
            System.out.println("Error updating food and drink item: " + e.getMessage());
        }
    }
    
    public void delete(int id) {
        try {
            String deleteBookingFDSsql = "DELETE FROM Booking_FDS_detail WHERE FDS_id = ?";
            PreparedStatement deleteBookingFDSStatement = connection.prepareStatement(deleteBookingFDSsql);
            deleteBookingFDSStatement.setInt(1, id);
            deleteBookingFDSStatement.executeUpdate();
            deleteBookingFDSStatement.close();

            String deleteFDSsql = "DELETE FROM FDS WHERE FDS_id = ?";
            PreparedStatement deleteFDSStatement = connection.prepareStatement(deleteFDSsql);
            deleteFDSStatement.setInt(1, id);
            deleteFDSStatement.executeUpdate();
            deleteFDSStatement.close();
        } catch (Exception e) {
            // Handle any exceptions
            System.out.println("Error deleting FDS and corresponding records: " + e.getMessage());
        }
    }

    
    public FDS getFoodAndDrinkById(int id){
        try {
            String sql = "SELECT * FROM FDS WHERE FDS_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                FDS f = new FDS();
                f.setFDS_id(rs.getInt(1));
                f.setFDS_name(rs.getString(2));
                f.setAmount(rs.getInt(3));
                f.setPrice(rs.getInt(4));
                f.setImage(rs.getString(5));
                f.setType(rs.getString(6));
                return f;
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    
    public static void main(String[] args) {
        FDS_DAO fDAO = new FDS_DAO();
        FDS listFDS = fDAO.getFoodAndDrinkById(1);
        System.out.println(listFDS);
        
    }
}
