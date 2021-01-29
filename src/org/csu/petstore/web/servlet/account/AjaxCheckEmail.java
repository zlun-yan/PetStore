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

@WebServlet("/ajaxCheckEmail")
public class AjaxCheckEmail extends HttpServlet {
    private UserDAO userDAO;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");

        userDAO = new UserDAOImpl();
        User user = userDAO.getUserByEmail(email);

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
