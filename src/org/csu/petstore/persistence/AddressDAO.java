package org.csu.petstore.persistence;

import org.csu.petstore.domain.Address;

import java.util.List;

public interface AddressDAO {
    List<Address> getAddressByUserId(int userId);

    int insertAddress(Address address);

    Address getAddressById(int id);

    boolean deleteAddressById(int id);
}
