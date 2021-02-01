package org.csu.petstore.domain;

public class Type {
    private int id;
    private String name;
    private String details;
    private String picURL;

    public String getPicURL() {
        return picURL;
    }

    public String getName() {
        return name;
    }

    public int getId() {
        return id;
    }

    public String getDetails() {
        return details;
    }

    public void setPicURL(String picURL) {
        this.picURL = picURL;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setDetails(String details) {
        this.details = details;
    }
}
