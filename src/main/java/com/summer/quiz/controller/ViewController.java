package com.summer.quiz.controller;

import com.summer.quiz.services.CategoryService;
import com.summer.quiz.services.QuestionsService;
import com.summer.quiz.services.QuizService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class ViewController {
    @Autowired
    private CategoryService categoryService;

    @Autowired
    private QuizService quizService;

    @Autowired
    private QuestionsService questionsService;

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

    @GetMapping("/create-quiz")
    public String quizzes(Model model){
        model.addAttribute("categories", categoryService.getAllCategories());
        return "create-quiz";
    }
    @GetMapping("/quizzes/{quizId}/create-question")
    public String showAddQuestionForm(@PathVariable("quizId") int quizId, Model model){
        model.addAttribute("questions", questionsService.getQuestions(quizId));
        model.addAttribute("quiz", quizService.getQuizById(quizId));
        return "users/create-question";
    }

    @GetMapping("/users/profile")
    public String profile(){
        return "users/user-profile";
    }
}