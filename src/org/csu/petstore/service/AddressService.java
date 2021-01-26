package org.csu.petstore.service;

import org.csu.petstore.domain.Address;
import org.csu.petstore.persistence.AddressDAO;
import org.csu.petstore.persistence.Impl.AddressDAOImpl;

import java.util.List;

public class AddressService {
    private AddressDAO addressDAO;

    public AddressService() {
        addressDAO = new AddressDAOImpl();
    }

    public List<Address> getAddressListById(int userId) {
        return addressDAO.getAddressByUserId(userId);
    }
}
