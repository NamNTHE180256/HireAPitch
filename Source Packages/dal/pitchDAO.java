/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Statement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Pitch;
import java.sql.PreparedStatement;
import java.sql.SQLException;


/**
 *
 * @author dumspicy
 */
public class pitchDAO extends DBContext {

    public ArrayList<Pitch> getAllPitch() {
        ArrayList<Pitch> list = new ArrayList<>();
        UserDAO uDao = new UserDAO();
        try{
            String sql = "select * from Pitch";
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while(rs.next()){
                Pitch p = new Pitch();
                p.setPitchId(rs.getInt(1));
                p.setPitchName(rs.getString(2));
                p.setAddress(rs.getString(3));
                p.setPrice(rs.getInt(4));
                p.setImage(rs.getString(5));
                p.setType(rs.getString(6));
                p.setRegion(rs.getString(7));
                list.add(p);
            }
            rs.close();
            st.close();
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
        return list;
    }
    
    public void delete(int pitchId) {
        try {
            String deleteBookingFDSsql = "DELETE FROM Booking_FDS_detail WHERE Booking_id IN (SELECT Booking_id FROM Booking WHERE Pitch_id = ?)";
            PreparedStatement deleteBookingFDSStatement = connection.prepareStatement(deleteBookingFDSsql);
            deleteBookingFDSStatement.setInt(1, pitchId);
            deleteBookingFDSStatement.executeUpdate();
            deleteBookingFDSStatement.close();

            String deleteBookingStuffSql = "DELETE FROM Booking_Stuff_detail WHERE Booking_id IN (SELECT Booking_id FROM Booking WHERE Pitch_id = ?)";
            PreparedStatement deleteBookingStuffStatement = connection.prepareStatement(deleteBookingStuffSql);
            deleteBookingStuffStatement.setInt(1, pitchId);
            deleteBookingStuffStatement.executeUpdate();
            deleteBookingStuffStatement.close();

            String deleteBookingSql = "DELETE FROM Booking WHERE Pitch_id = ?";
            PreparedStatement deleteBookingStatement = connection.prepareStatement(deleteBookingSql);
            deleteBookingStatement.setInt(1, pitchId);
            deleteBookingStatement.executeUpdate();
            deleteBookingStatement.close();

            String deletePitchSql = "DELETE FROM Pitch WHERE Pitch_id = ?";
            PreparedStatement deletePitchStatement = connection.prepareStatement(deletePitchSql);
            deletePitchStatement.setInt(1, pitchId);
            deletePitchStatement.executeUpdate();
            deletePitchStatement.close();
        } catch (Exception e) {
            // Handle any exceptions
            System.out.println("Error deleting pitch and corresponding bookings: " + e.getMessage());
        }
    }

    
    public void update(Pitch pitch) {
        try {
            String sql = "UPDATE Pitch SET Pitch_name = ?, [Address] = ?, Price = ?, [Image] = ?, [Type] = ?, Region = ? WHERE Pitch_id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, pitch.getPitchName());
            statement.setString(2, pitch.getAddress());
            statement.setInt(3, pitch.getPrice());
            statement.setString(4, pitch.getImage());
            statement.setString(5, pitch.getType());
            statement.setString(6, pitch.getRegion());
            statement.setInt(7, pitch.getPitchId());

            statement.executeUpdate();
            statement.close();
        } catch (Exception e) {
            System.out.println("Error updating pitch: " + e.getMessage());
        }
    }
    
    public void insert(Pitch pitch) {
        try {
            String sql = "INSERT Pitch(Pitch_name, [Address], Price, [Image], [Type], Region) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, pitch.getPitchName());
            statement.setString(2, pitch.getAddress());
            statement.setInt(3, pitch.getPrice());
            statement.setString(4, pitch.getImage());
            statement.setString(5, pitch.getType());
            statement.setString(6, pitch.getRegion());
            
            statement.executeUpdate();
            
            statement.close();
        } catch (Exception e) {
            System.out.println("Error inserting pitch: " + e.getMessage());
        }
    }
    
    public ArrayList<Pitch> choosePitch(String type, String region) {
        ArrayList<Pitch> list = new ArrayList<>();
        UserDAO uDao = new UserDAO();
        try {
            String sql = "SELECT * FROM Pitch WHERE [Type] = ? AND Region = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, type);
            ps.setString(2, region);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Pitch p = new Pitch();
                p.setPitchId(rs.getInt(1));
                p.setPitchName(rs.getString(2));
                p.setAddress(rs.getString(3));
                p.setPrice(rs.getInt(4));
                p.setImage(rs.getString(5));
                p.setType(rs.getString(6));
                p.setRegion(rs.getString(7));
                list.add(p);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    
    public Pitch getPitchById(int id) {
        ArrayList<Pitch> list = new ArrayList<>();
        UserDAO uDao = new UserDAO();
        try {
            String sql = "SELECT * FROM Pitch WHERE Pitch_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Pitch p = new Pitch();
                p.setPitchId(rs.getInt(1));
                p.setPitchName(rs.getString(2));
                p.setAddress(rs.getString(3));
                p.setPrice(rs.getInt(4));
                p.setImage(rs.getString(5));
                p.setType(rs.getString(6));
                p.setRegion(rs.getString(7));
                return p;
            }
            rs.close();
            ps.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    
    public ArrayList<Pitch> getPitchByName(String name) {
        ArrayList<Pitch> list = new ArrayList<>();
        try {
            String sql = "select * from Pitch where Pitch_name like ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1,"%" + name + "%");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Pitch p = new Pitch();
                p.setPitchId(rs.getInt(1));
                p.setPitchName(rs.getString(2));
                p.setAddress(rs.getString(3));
                p.setPrice(rs.getInt(4));
                p.setImage(rs.getString(5));
                p.setType(rs.getString(6));
                p.setRegion(rs.getString(7));
                list.add(p);
            }
            rs.close();
            ps.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    
    public ArrayList<Pitch> getLastestPitch() {
        ArrayList<Pitch> list = new ArrayList<>();
        try {
            String sql = "select top 4 * from Pitch\n"
                    + "order by Pitch_id desc";
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while(rs.next()){
                Pitch p = new Pitch();
                p.setPitchId(rs.getInt(1));
                p.setPitchName(rs.getString(2));
                p.setAddress(rs.getString(3));
                p.setPrice(rs.getInt(4));
                p.setImage(rs.getString(5));
                p.setType(rs.getString(6));
                p.setRegion(rs.getString(7));
                list.add(p);
            }
            rs.close();
            st.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }
    
    

    public static void main(String[] args) {
        pitchDAO pDAO = new pitchDAO();
        ArrayList<Pitch> listP = pDAO.getPitchByName("sân");
        for (Pitch pitch : listP) {
            System.out.println(pitch);
        }
    }
}
