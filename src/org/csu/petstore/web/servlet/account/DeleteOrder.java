package org.csu.petstore.web.servlet.account;

import com.alibaba.fastjson.JSONObject;
import org.csu.petstore.service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deleteOrder")
public class DeleteOrder extends HttpServlet {
    private OrderService orderService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("orderId"));

        orderService = new OrderService();
        JSONObject jsonObject = new JSONObject();
        if (orderService.deleteOrderById(id, req.getSession())) {
            jsonObject.put("state", "success");
        }
        else {
            jsonObject.put("state", "fail");
        }

        resp.getWriter().print(jsonObject.toJSONString());
    }
}
