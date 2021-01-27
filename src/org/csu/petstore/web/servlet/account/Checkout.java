package org.csu.petstore.web.servlet.account;

import com.alibaba.fastjson.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/checkout")
public class Checkout extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String[] ids = req.getParameter("ids").split(";");

        for (String str: ids) {
            System.out.println(str);
        }

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("state", "success");
        resp.getWriter().print(jsonObject);
    }
}
