package org.csu.petstore.web.servlet.account;

import com.alibaba.fastjson.JSONObject;
import org.csu.petstore.persistence.Impl.UserDAOImpl;
import org.csu.petstore.persistence.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/resetForm")
public class Reset extends HttpServlet {
    private UserDAO userDAO;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        session.removeAttribute("username");

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        userDAO = new UserDAOImpl();
        if (userDAO.updatePasswordByUsername(username, password)) {
            session.setAttribute("boxState", "show");

            JSONObject jsonObject = new JSONObject();
            jsonObject.put("state", "success");
            resp.getWriter().print(jsonObject.toJSONString());
        }
        else {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("state", "error");
            resp.getWriter().print(jsonObject.toJSONString());
        }

    }
}
