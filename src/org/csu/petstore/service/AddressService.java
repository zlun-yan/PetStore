package org.csu.petstore.service;

import org.csu.petstore.domain.Address;
import org.csu.petstore.domain.User;
import org.csu.petstore.persistence.AddressDAO;
import org.csu.petstore.persistence.Impl.AddressDAOImpl;
import org.csu.petstore.persistence.Impl.UserDAOImpl;
import org.csu.petstore.persistence.UserDAO;

import javax.servlet.http.HttpSession;
import java.util.List;

public class AddressService {
    private AddressDAO addressDAO;
    private UserDAO userDAO;

    public AddressService() {
        addressDAO = new AddressDAOImpl();
        userDAO = new UserDAOImpl();
    }

    public List<Address> getAddressListById(int userId) {
        return addressDAO.getAddressByUserId(userId);
    }

    public boolean deleteAddressById(int id, HttpSession session) {
        User user = (User) session.getAttribute("user");
        List<Address> addressList = user.getAddressList();
        for (int i = 0; i < addressList.size(); i++) {
            if (addressList.get(i).getId() == id) {
                addressList.remove(i);
                break;
            }
        }
        user.setAddressList(addressList);
        addressDAO.deleteAddressById(id);

        user.setAddress_num(user.getAddress_num() - 1);
        userDAO.updateUserAddressNumById(user.getId(), user.getAddress_num());

        user.setDefault_addr_id(0);
        userDAO.updateUserAddressDefaultById(user.getId(), user.getDefault_addr_id());

        session.setAttribute("user", user);
        return true;
    }
}
