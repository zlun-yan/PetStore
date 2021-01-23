package org.csu.petstore.web.servlet.account;

import com.alibaba.fastjson.JSON;
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
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet("/signInForm")
public class signIn extends HttpServlet {
    private UserDAO userDAO;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userId = req.getParameter("user[login]");
        String password = req.getParameter("user[password]");

        userDAO = new UserDAOImpl();
        User user;
        Pattern p = Pattern.compile("\\w{3,15}@(\\w{2,8}\\.){1,2}(com|net|cn)");
        Matcher m = p.matcher(userId);
        if (m.matches()) {
            user = userDAO.getUserByEmail(userId);
        }
        else {
            user = userDAO.getUserByUsername(userId);
        }

        JSONObject jsonObject;

        if (user != null) {
            if (user.getPassword().equals(password)) {
                System.out.println("Password correct.");

                String info = JSON.toJSONString(user);
                jsonObject = JSON.parseObject(info);
                jsonObject.put("state", "correct");
            }
            else {
                System.out.println("Password wrong.");

                jsonObject = new JSONObject();
                jsonObject.put("state", "psdwrong");
            }
        }
        else {
            System.out.println("User is not exist.");

            jsonObject = new JSONObject();
            jsonObject.put("state", "namewrong");
        }

        resp.getWriter().print(jsonObject.toJSONString());
//        req.getRequestDispatcher("forgot").forward(req, resp);
    }
}
