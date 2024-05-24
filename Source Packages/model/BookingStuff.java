/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dal.StuffDAO;

/**
 *
 * @author Admin
 */
public class BookingStuff {
    private int Booking_id;
    private int Stuff_id;
    private int amount;

    public BookingStuff() {
    }

    public BookingStuff(int Booking_id, int Stuff_id, int amount) {
        this.Booking_id = Booking_id;
        this.Stuff_id = Stuff_id;
        this.amount = amount;
    }

    public int getBooking_id() {
        return Booking_id;
    }

    public void setBooking_id(int Booking_id) {
        this.Booking_id = Booking_id;
    }

    public int getStuff_id() {
        return Stuff_id;
    }

    public void setStuff_id(int Stuff_id) {
        this.Stuff_id = Stuff_id;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
    
    public Stuff getStuff() {
        StuffDAO d = new StuffDAO();
        return d.getStuffById(this.Stuff_id);
    }
}
