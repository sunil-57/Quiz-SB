package com.summer.quiz.services;

import com.summer.quiz.repositories.QuestionsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QuestionsService {
    @Autowired
    private QuestionsRepository questionsRepository;
}
