package org.csu.petstore.persistence;

import org.csu.petstore.domain.User;

public interface UserDAO {
    User getUserByUsername(String username);

    User getUserByEmail(String email);

    boolean updatePasswordByUsername(String username, String password);

    boolean insertUser(User user);

    /**
     *
     * @param userId
     * @param value 这个值应该是改变之后的值
     * @return
     */
    boolean updateUserAddressNumById(int userId, int value);

    boolean updateUserAddressDefaultById(int userId, int addressId);
}
