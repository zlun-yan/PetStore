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

@WebServlet("/signUpForm")
public class SignUp extends HttpServlet {
    private UserDAO userDAO;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        userDAO = new UserDAOImpl();

        User user = new User();
        user.setUsername(req.getParameter("user[login]"));
        user.setEmail(req.getParameter("user[email]"));
        user.setPassword(req.getParameter("user[password]"));

        JSONObject jsonObject = new JSONObject();
        if (userDAO.insertUser(user)) {
            HttpSession session = req.getSession();
            session.setAttribute("user", user);
            jsonObject.put("state", "success");
        }
        else {
            jsonObject.put("state", "error");
        }

        resp.getWriter().print(jsonObject.toJSONString());
    }
}
