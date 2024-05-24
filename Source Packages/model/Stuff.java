/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author dumspicy
 */
public class Stuff {
    private int stuffId;
    private String stuffName;
    private String size;
    private int amountExist;
    private int price;
    private String image;
    private String type;

    public Stuff() {
    }

    public Stuff(int stuffId, String stuffName, String size, int amountExist, int price, String image, String type) {
        this.stuffId = stuffId;
        this.stuffName = stuffName;
        this.size = size;
        this.amountExist = amountExist;
        this.price = price;
        this.image = image;
        this.type = type;
    }



    public int getStuffId() {
        return stuffId;
    }

    public void setStuffId(int stuffId) {
        this.stuffId = stuffId;
    }

    public String getStuffName() {
        return stuffName;
    }

    public void setStuffName(String stuffName) {
        this.stuffName = stuffName;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public int getAmountExist() {
        return amountExist;
    }

    public void setAmountExist(int amountExist) {
        this.amountExist = amountExist;
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

    @Override
    public String toString() {
        return "Stuff{" + "stuffId=" + stuffId + ", stuffName=" + stuffName + ", size=" + size + ", amountExist=" + amountExist + ", price=" + price + ", image=" + image + ", type_id_Stuff=" + type + '}';
    }
    
}
