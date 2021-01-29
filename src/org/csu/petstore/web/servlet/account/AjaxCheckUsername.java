package org.csu.petstore.web.servlet.account;

import com.alibaba.fastjson.JSONObject;
import org.csu.petstore.domain.User;
import org.csu.petstore.persistence.Impl.UserDAOImpl;
import org.csu.petstore.persistence.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ajaxCheckUsername")
public class AjaxCheckUsername extends HttpServlet {
    private UserDAO userDAO;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");

        userDAO = new UserDAOImpl();
        User user = userDAO.getUserByUsername(username);

        JSONObject jsonObject = new JSONObject();
        if (user == null) {
            jsonObject.put("state", "available");
        }
        else {
            jsonObject.put("state", "unavailable");
        }

        resp.getWriter().print(jsonObject.toJSONString());
    }
}
