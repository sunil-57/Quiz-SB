package com.summer.quiz.controller;

import com.summer.quiz.services.QuestionsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("quizzes/{quizId}/questions")
public class QuestionsController {
    @Autowired
    private QuestionsService questionsService;


}
