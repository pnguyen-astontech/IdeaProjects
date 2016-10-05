package com.astontech.fap.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by petenguy1 on 10/3/2016.
 */
@Controller
public class AdminController {
    @RequestMapping("/admin")
    public String adminPage() {
        return "admin/admin";
    }

    @RequestMapping("/admin/user/admin_user_add")
    public String adminUserAdd() {
        return "admin/user/admin_user_add";
    }

    @RequestMapping("/admin/user/admin_user_list")
    public String adminUserList() {
        return "admin/user/admin_user_list";
    }
}
