package org.csu.petstore.service;

import org.csu.petstore.domain.Cart;
import org.csu.petstore.domain.User;
import org.csu.petstore.persistence.CartDAO;
import org.csu.petstore.persistence.Impl.CartDAOImpl;
import org.csu.petstore.persistence.Impl.ItemDAOImpl;
import org.csu.petstore.persistence.ItemDAO;

import javax.servlet.http.HttpSession;
import java.util.List;

public class CartService {
    private CartDAO cartDAO;
    private ItemDAO itemDAO;

    public CartService() {
        cartDAO = new CartDAOImpl();
        itemDAO = new ItemDAOImpl();
    }

    public List<Cart> getCartListByUserId(int userId) {
        List<Cart> cartList = cartDAO.getCartListByUserId(userId);

        for (Cart cart : cartList) {
            System.out.println(cart.getItemId());
            cart.setItem(itemDAO.getItemByItemId(cart.getItemId()));
        }

        return cartList;
    }

    public boolean insertCartByUserIdAndItemIdAndNum(int userId, int itemId, int num) {
        return cartDAO.insertCartItemByUserIdAndItemIdAndNum(userId, itemId, num);
    }
}
