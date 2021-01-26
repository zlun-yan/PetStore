package org.csu.petstore.domain;

public class Address {
    private int id;
    private int userId;
    private String province;
    private String city;
    private String district;
    private int addressCode;
    private String details;
    private String name;
    private String phone;

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public int getAddressCode() {
        return addressCode;
    }

    public int getUserId() {
        return userId;
    }

    public String getCity() {
        return city;
    }

    public String getDetails() {
        return details;
    }

    public String getDistrict() {
        return district;
    }

    public String getPhone() {
        return phone;
    }

    public String getProvince() {
        return province;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setAddressCode(int addressCode) {
        this.addressCode = addressCode;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}
