package org.csu.petstore.persistence;

import org.csu.petstore.domain.Address;

public interface AddressDAO {
    int insertAddress(Address address);
}
