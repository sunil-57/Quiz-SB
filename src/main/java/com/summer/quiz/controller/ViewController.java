package com.summer.quiz.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ViewController {
    @GetMapping("/")
    public String home(){
        return "home";
    }

    @GetMapping("/sign-up")
    public String signUp(){
        return "sign-up";
    }
    @GetMapping("/log-in")
    public String logIn(){
        return "log-in";
    }
    @GetMapping("/quiz")
    public String quiz(){
        return "quiz";
    }
}