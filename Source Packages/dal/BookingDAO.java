/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Booking;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.BookingFDS;
import model.BookingStuff;
/**
 *
 * @author Admin
 */
public class BookingDAO extends DBContext{
    public void insert(Booking b) {
        try {
            String sql = "INSERT INTO Booking (Book_day, Time_start, Time_end, [User_id], [Pitch_id]) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, b.getBookDay());
            st.setString(2, b.getTimeStart());
            st.setString(3, b.getTimeEnd());
            st.setInt(4, b.getUserId());
            st.setInt(5, b.getPitchId());
            
            st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public ArrayList<Booking> getBookingByUP(int userId, int pitchId) {
        ArrayList<Booking> bookings = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Booking WHERE [User_id] = ? AND Pitch_id = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userId);
            st.setInt(2, pitchId);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Booking booking = new Booking();
                booking.setBookingId(rs.getInt(1));
                booking.setBookDay(rs.getString(2));
                booking.setTimeStart(rs.getString(3));
                booking.setTimeEnd(rs.getString(4));
                booking.setUserId(rs.getInt(5));
                booking.setPitchId(rs.getInt(6));
                booking.setStatus(rs.getBoolean(7));
                bookings.add(booking);
            }

            rs.close();
            st.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }
    
    public Booking getBookingById(int bookingId) {
    try {
        String sql = "SELECT * FROM Booking WHERE Booking_id = ?";
        PreparedStatement st = connection.prepareStatement(sql);
        st.setInt(1, bookingId);
        ResultSet rs = st.executeQuery();

        if (rs.next()) {
            Booking booking = new Booking();
            booking.setBookingId(rs.getInt("Booking_id"));
            booking.setBookDay(rs.getString("Book_day"));
            booking.setTimeStart(rs.getString("Time_start"));
            booking.setTimeEnd(rs.getString("Time_end"));
            booking.setUserId(rs.getInt("User_id"));
            booking.setPitchId(rs.getInt("Pitch_id"));
            booking.setStatus(rs.getBoolean("Status"));
            return booking;
        }

        rs.close();
        st.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return null;
}
    
    public void confirmBooking(int bookingId) {
        try {
            String sql = "UPDATE Booking SET [Status] = 1 WHERE Booking_id = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, bookingId);
            st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
        public void delete(int id) {
        try {
            String deleteBookingFDSsql = "DELETE FROM Booking_FDS_detail WHERE Booking_id = ?";
            PreparedStatement deleteBookingFDSStatement = connection.prepareStatement(deleteBookingFDSsql);
            deleteBookingFDSStatement.setInt(1, id);
            deleteBookingFDSStatement.executeUpdate();
            deleteBookingFDSStatement.close();

            String deleteBookingStuffSql = "DELETE FROM Booking_Stuff_detail WHERE Booking_id = ?";
            PreparedStatement deleteBookingStuffStatement = connection.prepareStatement(deleteBookingStuffSql);
            deleteBookingStuffStatement.setInt(1, id);
            deleteBookingStuffStatement.executeUpdate();
            deleteBookingStuffStatement.close();

            String deleteBookingSql = "DELETE FROM Booking WHERE Booking_id = ?";
            PreparedStatement deleteBookingStatement = connection.prepareStatement(deleteBookingSql);
            deleteBookingStatement.setInt(1, id);
            deleteBookingStatement.executeUpdate();
            deleteBookingStatement.close();
        } catch (Exception e) {
            System.out.println("Error deleting booking and corresponding records: " + e.getMessage());
        }
    }

    
    public ArrayList<Booking> getAllBooking() {
        ArrayList<Booking> bookings = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Booking";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int bookingId = rs.getInt(1);
                String bookDay = rs.getString(2);
                String timeStart = rs.getString(3);
                String timeEnd = rs.getString(4);
                int userId = rs.getInt(5);
                int pitchId = rs.getInt(6);
                boolean status = rs.getBoolean(7);
                
                Booking booking = new Booking(bookingId, bookDay, timeStart, timeEnd, userId, pitchId, status);
                bookings.add(booking);
            }
            rs.close();
            st.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }
    public boolean hasDuplicateTime(int pitchId, String datePicker, String startTime, String endTime) {
        try {
            String sql = "SELECT * FROM Booking "
                    + "WHERE Pitch_id = ? AND Book_day = ? "
                    + "AND ((Time_start <= ? AND Time_end >= ?) OR "
                    + "(Time_start <= ? AND Time_end >= ?))";

            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, pitchId);
            st.setString(2, datePicker);
            st.setString(3, startTime);
            st.setString(4, startTime);
            st.setString(5, endTime);
            st.setString(6, endTime);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }

            rs.close();
            st.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; 
    }
    
    public ArrayList<Booking> getAllBookingByPitchAndDay(int pitchId, String bookDay) {
        ArrayList<Booking> bookings = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Booking WHERE Pitch_id = ? AND Book_day = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, pitchId);
            statement.setString(2, bookDay);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                int bookingId = rs.getInt("Booking_id");
                String timeStart = rs.getString("Time_start");
                String timeEnd = rs.getString("Time_end");
                int userId = rs.getInt("User_id");
                boolean status = rs.getBoolean("Status");
                Booking booking = new Booking(bookingId, bookDay, timeStart, timeEnd, userId, pitchId, status);
                bookings.add(booking);
            }
            rs.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }
    
// BookingStuffDetails
    public void insert(BookingStuff bookingStuff) {
        try {
            String sql = "INSERT INTO Booking_Stuff_detail (Booking_id, Stuff_id, Amount) VALUES (?, ?, ?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, bookingStuff.getBooking_id());
            st.setInt(2, bookingStuff.getStuff_id());
            st.setInt(3, bookingStuff.getAmount());
            
            st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public BookingStuff getExistBookingStuff(int bookingId, int stuffId) {
        try {
            String sql = "SELECT * FROM Booking_Stuff_detail WHERE Booking_id = ? AND Stuff_id = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, bookingId);
            st.setInt(2, stuffId);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                BookingStuff bookingStuff = new BookingStuff();
                bookingStuff.setBooking_id(rs.getInt(1));
                bookingStuff.setStuff_id(rs.getInt(2));
                bookingStuff.setAmount(rs.getInt(3));
                return bookingStuff;
            }

            rs.close();
            st.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public ArrayList<BookingStuff> getBookingStuffByBookingId(int bookingId) {
        ArrayList<BookingStuff> list = new ArrayList();
        try {
            String sql = "SELECT * FROM Booking_Stuff_detail WHERE Booking_id = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, bookingId);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                BookingStuff bookingStuff = new BookingStuff();
                bookingStuff.setBooking_id(rs.getInt(1));
                bookingStuff.setStuff_id(rs.getInt(2));
                bookingStuff.setAmount(rs.getInt(3));
                list.add(bookingStuff);
            }

            rs.close();
            st.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public void deleteBookingStuff(int bookingId, int stuffId) {
        try {
            String sql = "DELETE FROM Booking_Stuff_detail WHERE Booking_id = ? AND Stuff_id = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, bookingId);
            st.setInt(2, stuffId);

            st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    
    public void update(BookingStuff existingBookingStuff) {
        try {
            String sql = "UPDATE Booking_Stuff_detail SET Amount = ? WHERE Booking_id = ? AND Stuff_id = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, existingBookingStuff.getAmount());
            st.setInt(2, existingBookingStuff.getBooking_id());
            st.setInt(3, existingBookingStuff.getStuff_id());
            st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
//BookingFDSDetails
    public void insert(BookingFDS bookingFDS) {
        try {
            String sql = "INSERT INTO Booking_FDS_detail (Booking_id, FDS_id, Amount) VALUES (?, ?, ?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, bookingFDS.getBooking_id());
            st.setInt(2, bookingFDS.getFDS_id());
            st.setInt(3, bookingFDS.getAmount());
            
            st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public BookingFDS getExistBookingFDS(int bookingId, int FDSId) {
        try {
            String sql = "SELECT * FROM Booking_FDS_detail WHERE Booking_id = ? AND FDS_id = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, bookingId);
            st.setInt(2, FDSId);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                BookingFDS bookingFDS = new BookingFDS();
                bookingFDS.setBooking_id(rs.getInt(1));
                bookingFDS.setFDS_id(rs.getInt(2));
                bookingFDS.setAmount(rs.getInt(3));
                return bookingFDS;
            }

            rs.close();
            st.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public ArrayList<BookingFDS> getBookingFDSByBookingId(int bookingId) {
        ArrayList<BookingFDS> list = new ArrayList();
        try {
            String sql = "SELECT * FROM Booking_FDS_detail WHERE Booking_id = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, bookingId);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                BookingFDS bookingFDS = new BookingFDS();
                bookingFDS.setBooking_id(rs.getInt(1));
                bookingFDS.setFDS_id(rs.getInt(2));
                bookingFDS.setAmount(rs.getInt(3));
                list.add(bookingFDS);
            }
            rs.close();
            st.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public void deleteBookingFDS(int bookingId, int FDSId) {
        try {
            String sql = "DELETE FROM Booking_FDS_detail WHERE Booking_id = ? AND FDS_id = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, bookingId);
            st.setInt(2, FDSId);

            st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    
    public void update(BookingFDS existingBookingFDS) {
        try {
            String sql = "UPDATE Booking_FDS_detail SET Amount = ? WHERE Booking_id = ? AND FDS_id = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, existingBookingFDS.getAmount());
            st.setInt(2, existingBookingFDS.getBooking_id());
            st.setInt(3, existingBookingFDS.getFDS_id());
            st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
}
