package org.csu.petstore.domain;

public class Clauses {
    private int id;
    private int orderId;
    private String itemName;
    private double itemPrice;
    private String itemPicURL;
    private int num;

    public int getId() {
        return id;
    }

    public int getNum() {
        return num;
    }

    public double getItemPrice() {
        return itemPrice;
    }

    public int getOrderId() {
        return orderId;
    }

    public String getItemName() {
        return itemName;
    }

    public String getItemPicURL() {
        return itemPicURL;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public void setItemPicURL(String itemPicURL) {
        this.itemPicURL = itemPicURL;
    }

    public void setItemPrice(double itemPrice) {
        this.itemPrice = itemPrice;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }
}
