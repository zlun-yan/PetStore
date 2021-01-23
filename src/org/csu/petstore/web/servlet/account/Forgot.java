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
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/forgotForm")
public class Forgot extends HttpServlet {
    private UserDAO userDAO;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("user[email]");

        userDAO = new UserDAOImpl();
        User user = userDAO.getUserByEmail(email);
        if (user != null) {
            HttpSession session = req.getSession();
            session.setAttribute("username", user.getUsername());

            JSONObject jsonObject = new JSONObject();
            jsonObject.put("state", "success");
            resp.getWriter().print(jsonObject.toJSONString());
        }
        else {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("state", "wrong");
            resp.getWriter().print(jsonObject.toJSONString());
        }
    }
}
