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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("quizzes")
public class QuizController {
    @Autowired
    private QuizService quizService;

    @Autowired
    private CategoryService categoryService;

    @GetMapping("/{userId}")
    public String myQuizzes(@PathVariable("userId") int userId, @RequestParam(value = "category", required = false) String categoryName, Model model){
        List<Category> categories = categoryService.getAllCategories();
        List<Quiz> userQuizzes;
        if (categoryName != null && !categoryName.isEmpty()) {
            userQuizzes = quizService.getQuizzesByCategoryNameAndUserId(categoryName, userId);
        } else {
            userQuizzes = quizService.getAllQuizzes();
        }
        model.addAttribute("quizzes", userQuizzes);
        model.addAttribute("categories", categories);
        model.addAttribute("selectedCategoryName", categoryName);
        return "users/my-quizzes";
    }

    @GetMapping
    public String getAllQuizzes(@RequestParam(value = "category", required = false) String categoryName, Model model){
        List<Category> categories = categoryService.getAllCategories();
        List<Quiz> quizzes;
        if (categoryName != null && !categoryName.isEmpty()) {
            quizzes = quizService.getQuizzesByCategoryName(categoryName);
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

    @PostMapping("/{quizId}")
    public String toggleQuizStatus(@PathVariable int quizId, RedirectAttributes redirectAttributes, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return "redirect:/log-in";
        }
        try {
            quizService.toggleStatus(quizId);
            redirectAttributes.addFlashAttribute("message", "Quiz status updated successfully.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Failed to update quiz status.");
        }
        return "redirect:/quizzes/" + loggedInUser.getUserid();
    }

}
