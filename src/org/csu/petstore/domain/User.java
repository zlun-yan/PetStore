package org.csu.petstore.domain;

import java.util.List;

public class User {
    private int id;
    private String username;
    private String email;
    private String password;

    private String avatar_url;
    private int default_addr_id;
    private int address_num;

    private List<Address> addressList;
    private List<Cart> cartList;

    public String getEmail() {
        return email;
    }

    public String getUsername() {
        return username;
    }

    public int getId() {
        return id;
    }

    public String getPassword() {
        return password;
    }

    public int getAddress_num() {
        return address_num;
    }

    public int getDefault_addr_id() {
        return default_addr_id;
    }

    public String getAvatar_url() {
        return avatar_url;
    }

    public List<Address> getAddressList() {
        return addressList;
    }

    public List<Cart> getCartList() {
        return cartList;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setAddress_num(int address_num) {
        this.address_num = address_num;
    }

    public void setAvatar_url(String avatar_url) {
        this.avatar_url = avatar_url;
    }

    public void setDefault_addr_id(int default_addr_id) {
        this.default_addr_id = default_addr_id;
    }

    public void setAddressList(List<Address> addressList) {
        this.addressList = addressList;
    }

    public void setCartList(List<Cart> cartList) {
        this.cartList = cartList;
    }
}
