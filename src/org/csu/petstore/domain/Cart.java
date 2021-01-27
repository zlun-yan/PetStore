package org.csu.petstore.domain;

public class Cart {
    private int id;
    private int userId;
    private int itemId;
    private int num;

    private Item item;

    public int getNum() {
        return num;
    }

    public int getId() {
        return id;
    }

    public int getUserId() {
        return userId;
    }

    public int getItemId() {
        return itemId;
    }

    public Item getItem() {
        return item;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public void setItem(Item item) {
        this.item = item;
    }
}
