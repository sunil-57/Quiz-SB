package com.summer.quiz.controller;

import com.summer.quiz.models.Quiz;
import com.summer.quiz.models.User;
import com.summer.quiz.services.CategoryService;
import com.summer.quiz.services.QuizService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("quizzes")
public class QuizController {
    @Autowired
    private QuizService quizService;

    @Autowired
    private CategoryService categoryService;
    @GetMapping("/{id}")
    public String myQuizzes(@PathVariable("id") int userID, Model model){
        //TODO need to return to users quizes page instead of all quizes
        return "my-quizzes";
    }

    @GetMapping
    public String getAllQuizzes(Model model){
        model.addAttribute("quizzes", quizService.getAllQuizzes());
        return "all-quizzes";
    }

    @PostMapping
    public String saveQuiz(@ModelAttribute Quiz quiz, HttpSession session){
        User loggedInUser = (User) session.getAttribute("loggedInUser"); // Ensure this is set at login
        if (loggedInUser == null) {
            return "redirect:/log-in";
        }
        quiz.setUser(loggedInUser);
        quizService.saveQuiz(quiz);
        return "redirect:/quizzes";
    }
}
