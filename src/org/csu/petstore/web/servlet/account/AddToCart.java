package org.csu.petstore.web.servlet.account;

import com.alibaba.fastjson.JSONObject;
import org.csu.petstore.domain.User;
import org.csu.petstore.persistence.CartDAO;
import org.csu.petstore.persistence.Impl.CartDAOImpl;
import org.csu.petstore.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/addToCart")
public class AddToCart extends HttpServlet {
    private UserService userService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        int itemId = Integer.parseInt(req.getParameter("itemId"));

        JSONObject jsonObject = new JSONObject();
        userService = new UserService();
        if (userService.addToCart(user, itemId, 1, session)) {
            jsonObject.put("state", "success");
        }
        else {
            jsonObject.put("state", "fail");
        }

        resp.getWriter().print(jsonObject.toJSONString());
    }
}
