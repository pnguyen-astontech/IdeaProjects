package com.astontech.fap.controllers;

import com.astontech.fap.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.web.ErrorController;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.xml.transform.ErrorListener;
import java.security.Principal;

/**
 * Created by petenguy1 on 9/28/2016.
 */
@Controller
public class IndexController{

    @Autowired
    private UserRepository userRepository;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(Model model){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        model.addAttribute("profileUsername", auth.getName());
        return "index";
    }

    @RequestMapping(value = "/signup")
    public String signup() {
        return "signup";
    }

    @RequestMapping(value = "/games")
    public String games(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        model.addAttribute("profileUsername", auth.getName());
        return "games";
    }

    @RequestMapping(value = "/profile/{username}", method = RequestMethod.GET)
    public String profile(@PathVariable String username, Model model) {

        model.addAttribute("profileUsername", username);
        model.addAttribute("profileId", userRepository.findIdByUsername(username));

        return "profile";
    }

    @RequestMapping(value = "/login")
    public String login() {
        return "login";
    }

    @RequestMapping(value = "/error/403", method = RequestMethod.GET)
    public String error403() {
        return "error/403";
    }
}
