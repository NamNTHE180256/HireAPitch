/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dal.pitchDAO;

/**
 *
 * @author Admin
 */
public class Pitch {
    private int pitchId;
    private String pitchName;
    private String address;
    private int price;
    private String image;
    private String type;
    private String region;

    public Pitch() {
    }

    public Pitch(int pitchId, String pitchName, String address, int price, String image, String type, String region) {
        this.pitchId = pitchId;
        this.pitchName = pitchName;
        this.address = address;
        this.price = price;
        this.image = image;
        this.type = type;
        this.region = region;
    }

    public Pitch(String pitchName, String address, int price, String image, String type, String region) {
        this.pitchName = pitchName;
        this.address = address;
        this.price = price;
        this.image = image;
        this.type = type;
        this.region = region;
    }
    

    public int getPitchId() {
        return pitchId;
    }

    public void setPitchId(int pitchId) {
        this.pitchId = pitchId;
    }

    public String getPitchName() {
        return pitchName;
    }

    public void setPitchName(String pitchName) {
        this.pitchName = pitchName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    
}
