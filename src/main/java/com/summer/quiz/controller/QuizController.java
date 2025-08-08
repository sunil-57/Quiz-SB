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
import java.util.Map;
import java.util.stream.Collectors;

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
        List<Quiz> userQuizzes = quizService.findQuizzesByUserId(userId);
        List<Quiz> filteredQuizzes;
        if (categoryName != null && !categoryName.isEmpty()) {
            filteredQuizzes = quizService.getQuizzesByCategoryNameAndUserId(categoryName, userId);
        } else {
            filteredQuizzes = userQuizzes;
        }
        Map<String, Long> categoryCounts = userQuizzes.stream().collect(
                Collectors.groupingBy(q -> q.getCategory().getCategoryName(), Collectors.counting()));

        model.addAttribute("categories", categories);
        model.addAttribute("quizzes", filteredQuizzes);
        model.addAttribute("quizCount", userQuizzes.size());
        model.addAttribute("categoryCounts", categoryCounts);
        model.addAttribute("selectedCategoryName", categoryName);
        return "users/my-quizzes";
    }

    @GetMapping
    public String allQuizzes(@RequestParam(value = "category", required = false) String categoryName, Model model){
        List<Category> categories = categoryService.getAllCategories();
        List<Quiz> allQuizzes = quizService.getAllQuizzes();
        List<Quiz> filteredQuizzes;
        if (categoryName != null && !categoryName.isEmpty()) {
            filteredQuizzes = quizService.getQuizzesByCategoryName(categoryName);
        } else {
            filteredQuizzes = allQuizzes;
        }
        Map<String, Long> categoryCounts = allQuizzes.stream().collect(
                Collectors.groupingBy(q -> q.getCategory().getCategoryName(), Collectors.counting()));
        model.addAttribute("categories", categories);
        model.addAttribute("quizzes", filteredQuizzes);
        model.addAttribute("quizCount", allQuizzes.size());
        model.addAttribute("categoryCounts", categoryCounts);
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
