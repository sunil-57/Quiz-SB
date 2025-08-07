package com.summer.quiz.controller;

import com.summer.quiz.services.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ViewController {
    @Autowired
    private CategoryService categoryService;

    @GetMapping("/")
    public String home(){
        return "home";
    }
    @GetMapping("sign-up")
    public String signUp(){
        return "sign-up";
    }
    @GetMapping("log-in")
    public String logIn(){
        return "log-in";
    }
    @GetMapping("/quiz")
    public String userDashboard(){
        return "users/quiz";
    }
    @GetMapping("/admin/dashboard")
    public String adminDashboard(){
        return "admin/admin-dashboard";
    }

    @GetMapping("/add-category")
    public String categories(){
        return "admin/add-category";
    }

    @GetMapping("/add-quiz")
    public String quizzes(Model model){
        model.addAttribute("categories", categoryService.getAllCategories());
        return "add-quiz";
    }
}