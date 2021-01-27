package org.csu.petstore.web.servlet.account;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.csu.petstore.domain.User;
import org.csu.petstore.persistence.Impl.UserDAOImpl;
import org.csu.petstore.persistence.UserDAO;
import org.csu.petstore.service.AddressService;
import org.csu.petstore.service.CartService;
import org.csu.petstore.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet("/signInForm")
public class SignIn extends HttpServlet {
    private UserDAO userDAO;
    private CartService cartService;
    private AddressService addressService;

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
                addressService = new AddressService();
                cartService = new CartService();
                user.setAddressList(addressService.getAddressListById(user.getId()));
                user.setCartList(cartService.getCartListByUserId(user.getId()));

                HttpSession session = req.getSession();
                session.setAttribute("user", user);

                String info = JSON.toJSONString(user);
                jsonObject = JSON.parseObject(info);
                jsonObject.put("state", "correct");
            }
            else {
                jsonObject = new JSONObject();
                jsonObject.put("state", "psdwrong");
            }
        }
        else {
            jsonObject = new JSONObject();
            jsonObject.put("state", "namewrong");
        }

        resp.getWriter().print(jsonObject.toJSONString());
    }
}
