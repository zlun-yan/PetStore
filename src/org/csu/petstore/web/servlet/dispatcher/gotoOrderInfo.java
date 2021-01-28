package org.csu.petstore.web.servlet.dispatcher;

import org.csu.petstore.domain.Address;
import org.csu.petstore.domain.Order;
import org.csu.petstore.persistence.AddressDAO;
import org.csu.petstore.persistence.Impl.AddressDAOImpl;
import org.csu.petstore.service.AddressService;
import org.csu.petstore.service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/orderInfo")
public class gotoOrderInfo extends HttpServlet {
    private static final String ORDER_INFO = "/WEB-INF/jsp/account/info/orderInfo.jsp";
    private OrderService orderService;
    private AddressDAO addressDAO;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int orderId = Integer.parseInt(req.getParameter("orderId"));
        orderService = new OrderService();
        addressDAO = new AddressDAOImpl();
        Order order = orderService.getOrderById(orderId);
        Address address = addressDAO.getAddressById(order.getAddrId());

        req.setAttribute("address", address);
        req.setAttribute("order", order);
        req.getRequestDispatcher(ORDER_INFO).forward(req, resp);
    }
}
