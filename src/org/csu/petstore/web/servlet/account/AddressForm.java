package org.csu.petstore.web.servlet.account;

import com.alibaba.fastjson.JSONObject;
import org.csu.petstore.domain.Address;
import org.csu.petstore.domain.User;
import org.csu.petstore.persistence.AddressDAO;
import org.csu.petstore.persistence.Impl.AddressDAOImpl;
import org.csu.petstore.persistence.Impl.UserDAOImpl;
import org.csu.petstore.persistence.UserDAO;
import org.csu.petstore.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/addressForm")
public class AddressForm extends HttpServlet {
    private UserService userService;
    private AddressDAO addressDAO;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        Address address = new Address();

        address.setUserId(user.getId());
        address.setProvince(req.getParameter("province"));
        address.setCity(req.getParameter("city"));
        address.setDistrict(req.getParameter("district"));
        address.setAddressCode(Integer.parseInt(req.getParameter("address_code")));
        address.setDetails(req.getParameter("details"));
        address.setName(req.getParameter("name"));
        address.setPhone(req.getParameter("phone"));

        JSONObject jsonObject = new JSONObject();

        addressDAO = new AddressDAOImpl();
        int addressId = addressDAO.insertAddress(address);
        if (addressId != 0) {
            userService = new UserService();
            userService.addAddress(user, 1, session);

            boolean isDefault = Boolean.parseBoolean(req.getParameter("defaultAddr"));
            System.out.println(isDefault);
            if (isDefault) {
                if (userService.setDefaultAddr(user, addressId, session)) {
                    //  成功插入 并且将其设置为默认地址
                    jsonObject.put("state", "success");

                }
                else {
                    // 设置为默认地址失败
                    jsonObject.put("state", "fail");
                }
            }
            else {
                // 成功插入 并且没有将其设置为默认地址
                jsonObject.put("state", "success");
            }
        }
        else {
            // 插入失败
            jsonObject.put("state", "fail");
        }

        resp.getWriter().print(jsonObject.toJSONString());
    }
}
