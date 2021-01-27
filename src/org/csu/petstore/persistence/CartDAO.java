package org.csu.petstore.persistence;

import org.csu.petstore.domain.Cart;

import java.util.List;

public interface CartDAO {
    boolean insertCartItemByUserIdAndItemIdAndNum(int userId, int itemId, int num);

    List<Cart> getCartListByUserId(int userId);
}
