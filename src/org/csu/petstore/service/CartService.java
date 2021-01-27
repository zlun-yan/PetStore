package org.csu.petstore.service;

import org.csu.petstore.domain.Cart;
import org.csu.petstore.domain.Clauses;
import org.csu.petstore.domain.Order;
import org.csu.petstore.domain.User;
import org.csu.petstore.persistence.CartDAO;
import org.csu.petstore.persistence.ClausesDAO;
import org.csu.petstore.persistence.Impl.CartDAOImpl;
import org.csu.petstore.persistence.Impl.ClausesDAOImpl;
import org.csu.petstore.persistence.Impl.ItemDAOImpl;
import org.csu.petstore.persistence.Impl.OrderDAOImpl;
import org.csu.petstore.persistence.ItemDAO;
import org.csu.petstore.persistence.OrderDAO;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

public class CartService {
    private CartDAO cartDAO;
    private ItemDAO itemDAO;
    private OrderDAO orderDAO;
    private ClausesDAO clausesDAO;

    public CartService() {
        cartDAO = new CartDAOImpl();
        itemDAO = new ItemDAOImpl();
        orderDAO = new OrderDAOImpl();
        clausesDAO = new ClausesDAOImpl();
    }

    public List<Cart> getCartListByUserId(int userId) {
        List<Cart> cartList = cartDAO.getCartListByUserId(userId);

        for (Cart cart : cartList) {
            cart.setItem(itemDAO.getItemByItemId(cart.getItemId()));
        }

        return cartList;
    }

    public boolean insertCartByUserIdAndItemIdAndNum(int userId, int itemId, int num) {
        return cartDAO.insertCartItemByUserIdAndItemIdAndNum(userId, itemId, num);
    }

    /**
     * 功能: 从cart删除 加入到clauses和orders
     * @param ids
     * @param session
     * @return
     */
    public boolean checkout(String[] ids, HttpSession session) {
        User user = (User)session.getAttribute("user");
        List<Clauses> clausesList = new ArrayList<>();
        Order order = new Order();
        order.setUserId(user.getId());
        order.setState(0);
        order.setStartDate("2021-1-30");

        double totPrice = 0;
        for (String id: ids) {
            Cart cart = cartDAO.getCartRecordById(Integer.parseInt(id));
            cartDAO.deleteCartItemById(Integer.parseInt(id));
            cart.setItem(itemDAO.getItemByItemId(cart.getItemId()));

            Clauses clauses = new Clauses();
            clauses.setItemName(cart.getItem().getName());
            clauses.setItemPrice(cart.getItem().getPrice());
            clauses.setItemPicURL(cart.getItem().getPicUrl());
            clauses.setNum(cart.getNum());
            clausesList.add(clauses);

            totPrice += clauses.getNum() * clauses.getItemPrice();
        }

        order.setTotPrice(totPrice);
        int orderId = orderDAO.insertOrder(order);

        for (Clauses clauses: clausesList) {
            clauses.setOrderId(orderId);
            clausesDAO.insertClauses(clauses);
        }

        return true;
    }
}
