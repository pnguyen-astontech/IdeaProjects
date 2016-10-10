package com.astontech.fap.services.impl;

import com.astontech.fap.domain.User;
import com.astontech.fap.repositories.UserRepository;
import com.astontech.fap.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by petenguy1 on 10/3/2016.
 */
@Service
public class UserServiceImpl implements UserService{

    @Autowired
    private UserRepository userRepository;

    @Override
    public Iterable<User> listAllUsers() {
        return userRepository.findAll();
    }

    @Override
    public User getUserById(Integer id) {
        return userRepository.findOne(id);
    }

    @Override
    public Integer getIdByUsername(String username) {
        return userRepository.findIdByUsername(username);
    }

    @Override
    public User saveUser(User user) {
        return userRepository.save(user);
    }

    @Override
    public Iterable<User> saveUserList(Iterable<User> userIterable) {
        return userRepository.save(userIterable);
    }

    @Override
    public void deleteUser(Integer id) {
        userRepository.delete(id);
    }
}
