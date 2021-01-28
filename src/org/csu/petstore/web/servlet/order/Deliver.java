package org.csu.petstore.web.servlet.order;

import com.alibaba.fastjson.JSONObject;
import org.csu.petstore.persistence.Impl.OrderDAOImpl;
import org.csu.petstore.persistence.OrderDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/deliver")
public class Deliver extends HttpServlet {
    private OrderDAO orderDAO;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int orderId = Integer.parseInt(req.getParameter("orderId"));

        orderDAO = new OrderDAOImpl();
        Date date = new Date();
        SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd");
        String dateStr = dateFormat.format(date);

        orderDAO.updateOrderStateById(orderId, 2);


        JSONObject jsonObject = new JSONObject();
        if (orderDAO.updateOrderEndDateById(orderId, dateStr)) {
            jsonObject.put("state", dateStr);
        }
        else {
            jsonObject.put("state", "fail");
        }

        resp.getWriter().print(jsonObject);
    }
}
