package org.csu.petstore.web.servlet.order;

import com.alibaba.fastjson.JSONObject;
import org.csu.petstore.service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deliver")
public class Deliver extends HttpServlet {
    private OrderService orderService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int orderId = Integer.parseInt(req.getParameter("orderId"));
        orderService = new OrderService();

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("state", orderService.deliver(orderId, req.getSession()));

        resp.getWriter().print(jsonObject);
    }
}
