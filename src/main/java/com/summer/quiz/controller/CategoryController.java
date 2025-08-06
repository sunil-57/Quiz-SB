package com.summer.quiz.controller;

import com.summer.quiz.models.Category;
import com.summer.quiz.services.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("categories")
public class CategoryController {
    @Autowired
    private CategoryService categoryService;

    @PostMapping
    public String saveCategory(@ModelAttribute Category category){
        categoryService.saveCategory(category);
        return "home";
    }
}
