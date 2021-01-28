package org.csu.petstore.service;

import org.csu.petstore.domain.Order;
import org.csu.petstore.persistence.ClausesDAO;
import org.csu.petstore.persistence.Impl.ClausesDAOImpl;
import org.csu.petstore.persistence.Impl.OrderDAOImpl;
import org.csu.petstore.persistence.OrderDAO;

import java.util.List;

public class OrderService {
    private OrderDAO orderDAO;
    private ClausesDAO clausesDAO;

    public OrderService() {
        orderDAO = new OrderDAOImpl();
        clausesDAO = new ClausesDAOImpl();
    }

    public List<Order> getOrderListByUserId(int userId) {
        List<Order> orderList = orderDAO.getOrderListByUserId(userId);
        for (Order order: orderList) {
            order.setClausesList(clausesDAO.getClausesListByOrderId(order.getId()));
        }
        return orderList;
    }
}
