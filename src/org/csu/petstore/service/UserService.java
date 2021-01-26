package org.csu.petstore.service;

import org.csu.petstore.domain.User;
import org.csu.petstore.persistence.Impl.UserDAOImpl;
import org.csu.petstore.persistence.UserDAO;

import javax.servlet.http.HttpSession;

public class UserService {
    private UserDAO userDAO;

    public UserService() {
        userDAO = new UserDAOImpl();
    }

    public boolean setDefaultAddr(User user, int default_addr_id, HttpSession session) {
        user.setDefault_addr_id(default_addr_id);
        session.setAttribute("user", user);
        return userDAO.updateUserAddressDefaultById(user.getId(), default_addr_id);
    }

    public boolean addAddress(User user, int delta, HttpSession session) {
        user.setAddress_num(user.getAddress_num() + delta);
        session.setAttribute("user", user);
        return userDAO.updateUserAddressNumById(user.getId(), user.getAddress_num());
    }
}
