package com.zale.dao;

import com.zale.pojo.User;

public interface UserDao {
    /**
     * Query User according to Username
     * @param username
     * @return no user exists if return null
     */
    User queryUserByUsername(String username);

    /**
     * Query User according to username and password
     * @param username
     * @param password
     * @return username or password incorrect if return null
     */
    User queryUserByUsernameAndPassword(String username, String password);

    /**
     * Save User information
     * @param user
     * @return fail if return -1, otherwise the number of rows for sql effected
     */
    int saveUser(User user);
}
