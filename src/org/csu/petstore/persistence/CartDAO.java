package org.csu.petstore.persistence;

public interface CartDAO {
    boolean insertCartItemByUserIdAndItemIdAndNum(int userId, int itemId, int num);
}
