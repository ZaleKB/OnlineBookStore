package com.zale.service.impl;

import com.zale.dao.UserDao;
import com.zale.dao.impl.UserDaoImpl;
import com.zale.pojo.User;
import com.zale.service.UserService;

public class UserServiceImpl implements UserService {

    private UserDao userDao = new UserDaoImpl();

    @Override
    public void registerUser(User user) {
        userDao.saveUser(user);
    }

    @Override
    public User login(User user) {
        //check database
        return userDao.queryUserByUsernameAndPassword(user.getUsername(), user.getPassword());
    }

    @Override
    public boolean existsUsername(String username) {

        if (userDao.queryUserByUsername(username) == null) {
           return false;
        }

        return true;

    }
}
