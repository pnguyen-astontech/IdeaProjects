package com.astontech.fap.services;

import com.astontech.fap.domain.User;

/**
 * Created by petenguy1 on 10/3/2016.
 */
public interface UserService {

    Iterable<User> listAllUsers();

    User getUserById(Integer id);

    Integer getIdByUsername(String username);

    User saveUser(User user);

    Iterable<User> saveUserList(Iterable<User> userIterable);

    void deleteUser(Integer id);


}
