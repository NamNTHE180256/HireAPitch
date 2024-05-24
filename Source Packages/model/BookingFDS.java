/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dal.FDS_DAO;

/**
 *
 * @author Admin
 */
public class BookingFDS {
    private int Booking_id;
    private int FDS_id;
    private int amount;

    public BookingFDS() {
    }

    public BookingFDS(int Booking_id, int FDS_id, int amount) {
        this.Booking_id = Booking_id;
        this.FDS_id = FDS_id;
        this.amount = amount;
    }

    public int getBooking_id() {
        return Booking_id;
    }

    public void setBooking_id(int Booking_id) {
        this.Booking_id = Booking_id;
    }

    public int getFDS_id() {
        return FDS_id;
    }

    public void setFDS_id(int FDS_id) {
        this.FDS_id = FDS_id;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
    
    public FDS getFDS() {
        FDS_DAO d = new FDS_DAO();
        return d.getFoodAndDrinkById(this.FDS_id);
    }
}
