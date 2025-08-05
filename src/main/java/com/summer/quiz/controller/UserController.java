package com.summer.quiz.controller;

import com.summer.quiz.models.User;
import com.summer.quiz.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("users/all")
    public List<User> getAllUsers(){
        return userService.getAllUsers();
    }

    @PostMapping("/register")
    public String registerUser(@ModelAttribute User user){
        userService.registerUser(user);
        return "redirect:/log-in";
    }

    @PostMapping("/log-in")
    public String authenticateUser(@RequestParam String username,
                        @RequestParam String password, Model model){
        User user = userService.authenticate(username, password);

        if (user != null) {
            if (user.isAdmin()) {
                return "redirect:/admin/dashboard";
            } else {
                return "redirect:/quiz";
            }
        } else {
            model.addAttribute("error", "Invalid username or password");
            return "log-in";
        }
    }
}
