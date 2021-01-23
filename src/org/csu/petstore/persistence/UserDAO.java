package org.csu.petstore.persistence;

import org.csu.petstore.domain.User;

public interface UserDAO {
    User getUserByUsername(String username);

    User getUserByEmail(String email);
}
