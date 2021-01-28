package org.csu.petstore.persistence;

import org.csu.petstore.domain.Order;

import java.util.List;

public interface OrderDAO {
    /**
     * 传入的order应设置 userId state totPrice stateDate
     * @param order
     * @return
     */
    int insertOrder(Order order);

    /**
     * 记得改变session中的order
     * @param id
     * @param state 0:正在送 1:已送达
     * @return
     */
    boolean updateOrderStateById(int id, int state);

    /**
     * 记得改变session中的order
     * @param id
     * @param endDate
     * @return
     */
    boolean updateOrderEndDateById(int id, String endDate);

    List<Order> getOrderListByUserId(int userId);

    Order getOrderById(int id);
}
