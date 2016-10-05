package com.astontech.fap.controllers;

import org.springframework.boot.autoconfigure.web.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.xml.transform.ErrorListener;

/**
 * Created by petenguy1 on 9/28/2016.
 */
@Controller
public class IndexController{

    @RequestMapping(value = "/")
    public String index(){
        return "index";
    }

    @RequestMapping(value = "/signup")
    public String signup() {
        return "signup";
    }

    @RequestMapping(value = "/games")
    public String games() {
        return "games";
    }

    @RequestMapping(value = "/profile")
    public String profile() {
        return "profile";
    }

    @RequestMapping(value = "/login")
    public String login() {
        return "login";
    }

    @RequestMapping(value = "/403", method = RequestMethod.GET)
    public String error403() {
        return "403";
    }
}
