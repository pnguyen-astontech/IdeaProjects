package com.astontech.fap.controllers;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by petenguy1 on 10/10/2016.
 */
@Controller
public class DatabasesController {

    @RequestMapping(value = "/db")
    public String databases(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        model.addAttribute("profileUsername", auth.getName());
        return "db/db"; }

    @RequestMapping(value = "/db/db_states_list")
    public String states(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        model.addAttribute("profileUsername", auth.getName());
        return "db/db_states_list"; }

    @RequestMapping(value = "/db/db_users_list")
    public String users(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        model.addAttribute("profileUsername", auth.getName());
        return "db/db_users_list"; }
}
