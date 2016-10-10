package com.astontech.fap.controllers;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by petenguy1 on 10/3/2016.
 */
@Controller
public class AdminController {
    @RequestMapping("/admin")
    public String adminPage(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        model.addAttribute("profileUsername", auth.getName());
        return "admin/admin";
    }

    @RequestMapping("/admin/user/admin_user_add")
    public String adminUserAdd(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        model.addAttribute("profileUsername", auth.getName());
        return "admin/user/admin_user_add";
    }

    @RequestMapping("/admin/user/admin_user_list")
    public String adminUserList(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        model.addAttribute("profileUsername", auth.getName());
        return "admin/user/admin_user_list";
    }

    @RequestMapping("/admin/state/admin_state_add")
    public String adminStateAdd(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        model.addAttribute("profileUsername", auth.getName());
        return "admin/state/admin_state_add";
    }

    @RequestMapping("/admin/state/admin_state_list")
    public String adminStateList(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        model.addAttribute("profileUsername", auth.getName());
        return "admin/state/admin_state_list";
    }
}
