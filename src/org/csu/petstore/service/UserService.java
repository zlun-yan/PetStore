package org.csu.petstore.service;

import org.csu.petstore.domain.Cart;
import org.csu.petstore.domain.User;
import org.csu.petstore.persistence.Impl.UserDAOImpl;
import org.csu.petstore.persistence.UserDAO;

import javax.servlet.http.HttpSession;

public class UserService {
    private UserDAO userDAO;
    private AddressService addressService;
    private CartService cartService;

    public UserService() {
        userDAO = new UserDAOImpl();
        addressService = new AddressService();
        cartService = new CartService();
    }

    public boolean setDefaultAddr(User user, int default_addr_id, HttpSession session) {
        user.setDefault_addr_id(default_addr_id);
        session.setAttribute("user", user);
        return userDAO.updateUserAddressDefaultById(user.getId(), default_addr_id);
    }

    public boolean addAddress(User user, int delta, HttpSession session) {
        user.setAddress_num(user.getAddress_num() + delta);
        user.setAddressList(addressService.getAddressListById(user.getId()));
        session.setAttribute("user", user);
        return userDAO.updateUserAddressNumById(user.getId(), user.getAddress_num());
    }

    public boolean addToCart(User user, int itemId, int num, HttpSession session) {
        Cart cart = cartService.getCartRecordByItemIdAndUserId(itemId, user.getId());
        if (cart == null) {
            cartService.insertCartByUserIdAndItemIdAndNum(user.getId(), itemId, num);
        }
        else {
            cartService.updateCartItemNumById(cart.getId(), cart.getNum() + num);
        }

        user.setCartList(cartService.getCartListByUserId(user.getId()));
        session.setAttribute("user", user);
        return true;
    }
}
