package org.csu.petstore.domain;

import java.util.List;

public class Order {
    private int id;
    private int userId;
    private int state;
    private int addrId;
    private double totPrice;
    private String startDate;
    private String endDate;

    private List<Clauses> clausesList;

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

    public List<Clauses> getClausesList() {
        return clausesList;
    }

    public int getAddrId() {
        return addrId;
    }

    public void setAddrId(int addrId) {
        this.addrId = addrId;
    }

    public void setClausesList(List<Clauses> clausesList) {
        this.clausesList = clausesList;
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
