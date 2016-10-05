package com.astontech.fap.bootstrap;

import com.astontech.fap.domain.User;
import com.astontech.fap.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

/**
 * Created by petenguy1 on 10/3/2016.
 */
@Component
public class SeedData implements ApplicationListener<ContextRefreshedEvent>{

    @Autowired
    private UserService userService;

    @Override
    public void onApplicationEvent(ContextRefreshedEvent event) {
        //generateUsers();
    }

    private void generateUsers() {
        User user = new User("pnguyen", "pnguyen");
        user.setFirstName("Peter");
        user.setLastName("Nguyen");

        userService.saveUser(user);

        User user1 = new User("aston", "aston");
        user1.setFirstName("Aston");
        user1.setLastName("Technologies");

        userService.saveUser(user1);

    }
}
