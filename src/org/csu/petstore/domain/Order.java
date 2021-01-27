package org.csu.petstore.domain;

public class Order {
    private int id;
    private int userId;
    private int state;
    private double totPrice;
    private String startDate;
    private String endDate;

    public int getUserId() {
        return userId;
    }

    public int getId() {
        return id;
    }

    public int getState() {
        return state;
    }

    public double getTotPrice() {
        return totPrice;
    }

    public String getEndDate() {
        return endDate;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setState(int state) {
        this.state = state;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public void setTotPrice(double totPrice) {
        this.totPrice = totPrice;
    }
}
