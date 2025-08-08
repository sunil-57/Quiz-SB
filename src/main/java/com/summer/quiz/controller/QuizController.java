package com.summer.quiz.controller;

import com.summer.quiz.models.Category;
import com.summer.quiz.models.Quiz;
import com.summer.quiz.models.User;
import com.summer.quiz.services.CategoryService;
import com.summer.quiz.services.QuizService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("quizzes")
public class QuizController {
    @Autowired
    private QuizService quizService;

    @Autowired
    private CategoryService categoryService;

    @GetMapping("/{id}")
    public String myQuizzes(@PathVariable("id") int userId, Model model){
        List<Quiz> userQuizzes = quizService.findQuizzesByUserId(userId);
        model.addAttribute("quizzes", userQuizzes);
        return "users/my-quizzes";
    }

    @GetMapping
    public String getAllQuizzes(@RequestParam(value = "category", required = false) String categoryName, Model model){
        List<Category> categories = categoryService.getAllCategories();
        List<Quiz> quizzes;
        if (categoryName != null && !categoryName.isEmpty()) {
            quizzes = quizService.getQuizzesByCategoryId(categoryName);
        } else {
            quizzes = quizService.getAllQuizzes();
        }
        model.addAttribute("categories", categories);
        model.addAttribute("quizzes", quizzes);
        model.addAttribute("selectedCategoryName", categoryName);
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
        return "redirect:/quizzes/"+loggedInUser.getUserid();
    }
}
