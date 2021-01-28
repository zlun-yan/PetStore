package org.csu.petstore.web.servlet.order;

import com.alibaba.fastjson.JSONObject;
import org.csu.petstore.persistence.Impl.OrderDAOImpl;
import org.csu.petstore.persistence.OrderDAO;
import org.csu.petstore.service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/pay")
public class Pay extends HttpServlet {
    private OrderService orderService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int orderId = Integer.parseInt(req.getParameter("orderId"));

        JSONObject jsonObject = new JSONObject();
        orderService = new OrderService();
        if (orderService.changeOrderById(orderId, 1, req.getSession())) {
            jsonObject.put("state", "success");
        }
        else {
            jsonObject.put("state", "fail");
        }

        resp.getWriter().print(jsonObject);
    }
}
