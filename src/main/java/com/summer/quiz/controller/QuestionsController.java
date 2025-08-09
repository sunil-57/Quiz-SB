package com.summer.quiz.controller;

import com.summer.quiz.services.QuestionsService;
import com.summer.quiz.services.QuizService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("quizzes/{quizId}/questions")
public class QuestionsController {

    @Autowired
    private QuizService quizService;

    @Autowired
    private QuestionsService questionsService;

    @GetMapping
    public String getQuesstions(@PathVariable("quizId") int quizId, Model model){
        model.addAttribute("quiz",quizService.getQuizById(quizId));
        model.addAttribute("questions", questionsService.getQuestions(quizId));
        return "users/quiz-questions";
    }

}
