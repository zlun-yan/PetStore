package org.csu.petstore.domain;

public class Item {
    private int id;
    private String name;
    private double price;
    private int num;
    private int userId;
    private int typeId;
    private String tags;
    private String details;
    private String picUrl;
    private String date;
    private int sale;

    public String getDetails() {
        return details;
    }

    public int getUserId() {
        return userId;
    }

    public String getName() {
        return name;
    }

    public int getId() {
        return id;
    }

    public String getDate() {
        return date;
    }

    public double getPrice() {
        return price;
    }

    public int getNum() {
        return num;
    }

    public int getSale() {
        return sale;
    }

    public int getTypeId() {
        return typeId;
    }

    public String getPicUrl() {
        return picUrl;
    }

    public String getTags() {
        return tags;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public void setPicUrl(String picUrl) {
        this.picUrl = picUrl;
    }

    public void setSale(int sale) {
        this.sale = sale;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }
}
