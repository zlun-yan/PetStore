package org.csu.petstore.service;

import org.csu.petstore.domain.Order;
import org.csu.petstore.domain.User;
import org.csu.petstore.persistence.ClausesDAO;
import org.csu.petstore.persistence.Impl.ClausesDAOImpl;
import org.csu.petstore.persistence.Impl.OrderDAOImpl;
import org.csu.petstore.persistence.OrderDAO;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class OrderService {
    private OrderDAO orderDAO;
    private ClausesDAO clausesDAO;

    public OrderService() {
        orderDAO = new OrderDAOImpl();
        clausesDAO = new ClausesDAOImpl();
    }

    public String deliver(int orderId, HttpSession session) {
        if (changeOrderById(orderId, 2, session)) {
            return setOrderEndDateById(orderId, session);
        }
        return "fail";
    }

    public boolean changeOrderById(int orderId, int state, HttpSession session) {
        orderDAO.updateOrderStateById(orderId, state);
        User user = (User) session.getAttribute("user");

        List<Order> orderList = user.getOrderList();
        for (Order order: orderList) {
            if (order.getId() == orderId) {
                order.setState(state);
                break;
            }
        }

        user.setOrderList(orderList);
        session.setAttribute("user", user);
        return true;
    }

    public String setOrderEndDateById(int orderId, HttpSession session) {
        User user = (User) session.getAttribute("user");
        Date date = new Date();
        SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd");
        String dateStr = dateFormat.format(date);

        orderDAO.updateOrderEndDateById(orderId, dateStr);
        List<Order> orderList = user.getOrderList();
        for (Order order: orderList) {
            if (order.getId() == orderId) {
                order.setEndDate(dateStr);
                break;
            }
        }

        user.setOrderList(orderList);
        session.setAttribute("user", user);
        return dateStr;
    }

    public List<Order> getOrderListByUserId(int userId) {
        List<Order> orderList = orderDAO.getOrderListByUserId(userId);
        for (Order order: orderList) {
            order.setClausesList(clausesDAO.getClausesListByOrderId(order.getId()));
        }
        return orderList;
    }

    public Order getOrderById(int id) {
        Order order = orderDAO.getOrderById(id);
        order.setClausesList(clausesDAO.getClausesListByOrderId(id));
        return order;
    }

    public boolean deleteOrderById(int id, HttpSession session) {
        clausesDAO.deleteClausesByOrderId(id);
        orderDAO.deleteOrderById(id);

        User user = (User) session.getAttribute("user");
        List<Order> orderList = user.getOrderList();
        for (int i = 0; i < orderList.size(); i++) {
            if (orderList.get(i).getId() == id) {
                orderList.remove(i);
                break;
            }
        }
        user.setOrderList(orderList);
        session.setAttribute("user", user);

        return true;
    }
}
