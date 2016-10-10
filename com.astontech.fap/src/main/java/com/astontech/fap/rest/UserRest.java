package com.astontech.fap.rest;

import com.astontech.fap.domain.User;
import com.astontech.fap.services.UserService;
import org.apache.log4j.Logger;
import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.web.ErrorController;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by petenguy1 on 10/3/2016.
 */
@RestController
@RequestMapping("/api/user")
public class UserRest {

    private Logger log = Logger.getLogger(UserRest.class);

    @Autowired
    private UserService userService;

    @Autowired
    private DataSource dataSource;

    // GET ALL
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public Iterable<User> getAll() {
        return userService.listAllUsers();
    }

    // GET BY ID
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public User getById(@PathVariable int id) {
        return userService.getUserById(id);
    }

    // SAVE
    @RequestMapping(value = "/", method = RequestMethod.POST)
    public User saveUser(@ModelAttribute("user") User user) {
        JdbcUserDetailsManager userDetailsService = new JdbcUserDetailsManager();
        userDetailsService.setDataSource(dataSource);
        PasswordEncoder encoder = new BCryptPasswordEncoder();

        if (!userDetailsService.userExists(user.getUsername())) {
            List<GrantedAuthority> authorities = new ArrayList<>();
            authorities.add(new SimpleGrantedAuthority("USER"));
            org.springframework.security.core.userdetails.User userDetails = new org.springframework.security.core.userdetails.User(user.getUsername(), encoder.encode(user.getPassword()), authorities);

            JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

            userDetailsService.createUser(userDetails);
            userService.saveUser(user);
            jdbcTemplate.update("update users set person_id = ? where username = ?", user.getId(), user.getUsername());
        } else {
            userService.saveUser(user);
        }

        return user;
    }

    // DELETE
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public Boolean delete(@PathVariable int id) {
        boolean result = false;
        try {
            userService.deleteUser(id);
            result = true;
        } catch (Exception ex) {
            log.info(ex);
        }
        return result;
    }
}
