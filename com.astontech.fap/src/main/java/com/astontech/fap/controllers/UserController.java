package com.astontech.fap.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by petenguy1 on 10/3/2016.
 */
@Controller
public class UserController {

    @RequestMapping("/user")
    public String userPage() {
        return "user";
    }
}
