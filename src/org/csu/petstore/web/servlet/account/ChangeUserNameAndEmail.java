package org.csu.petstore.web.servlet.account;

import com.alibaba.fastjson.JSONObject;
import org.csu.petstore.persistence.Impl.UserDAOImpl;
import org.csu.petstore.persistence.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/changeProfile")
public class ChangeUserNameAndEmail extends HttpServlet {
    private UserDAO userDAO;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int userId = Integer.parseInt(req.getParameter("userId"));
        String username = req.getParameter("username");
        String email = req.getParameter("email");

        userDAO = new UserDAOImpl();
        userDAO.updateUsernameById(userId, username);
        userDAO.updateEmailById(userId, email);

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("state", "success");
        resp.getWriter().print(jsonObject);
    }
}
