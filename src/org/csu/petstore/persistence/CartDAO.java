package org.csu.petstore.persistence;

import org.csu.petstore.domain.Cart;

import java.util.List;

public interface CartDAO {
    boolean insertCartItemByUserIdAndItemIdAndNum(int userId, int itemId, int num);

    List<Cart> getCartListByUserId(int userId);

    boolean updateCartItemNumById(int id, int num);

    boolean deleteCartItemById(int id);

    Cart getCartRecordById(int id);

    /**
     * 0未选择 1已选择
     * @param id
     * @param state
     * @return
     */
    boolean updateCartCheckedById(int id, int state);

    Cart getCartRecordByItemIdAndUserId(int itemId, int userId);
}
