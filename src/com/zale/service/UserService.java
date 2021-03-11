package com.zale.service;

import com.zale.pojo.User;

public interface UserService {
    /**
     * Register
     * @param user
     */
    void registerUser(User user);

    /**
     * Login
     * @param user
     * @return null for fail, value for success
     */
    User login(User user);

    /**
     * check if Username already exists
     * @param username
     * @return true for exists, false for available
     */
    boolean existsUsername(String username);
}
