package org.csu.petstore.web.servlet.account;

import com.alibaba.fastjson.JSONObject;
import org.csu.petstore.domain.Cart;
import org.csu.petstore.domain.Item;
import org.csu.petstore.persistence.CartDAO;
import org.csu.petstore.persistence.Impl.CartDAOImpl;
import org.csu.petstore.service.CartService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/doCheckout")
public class Checkout extends HttpServlet {
    private CartService cartService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String id = req.getParameter("ids");
        String[] ids = req.getParameter("ids").split(";");
        int addrId = Integer.parseInt(req.getParameter("addr"));
        cartService = new CartService();

        JSONObject jsonObject = new JSONObject();
        if (cartService.checkout(ids, addrId, session)) {
            jsonObject.put("state", "success");
        }
        else {
            jsonObject.put("state", "fail");
        }

        resp.getWriter().print(jsonObject);
    }
}
