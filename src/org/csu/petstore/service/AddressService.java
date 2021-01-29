package org.csu.petstore.service;

import org.csu.petstore.domain.Address;
import org.csu.petstore.domain.User;
import org.csu.petstore.persistence.AddressDAO;
import org.csu.petstore.persistence.Impl.AddressDAOImpl;

import javax.servlet.http.HttpSession;
import java.util.List;

public class AddressService {
    private AddressDAO addressDAO;

    public AddressService() {
        addressDAO = new AddressDAOImpl();
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
        session.setAttribute("user", user);

        return addressDAO.deleteAddressById(id);
    }
}
