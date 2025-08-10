package com.summer.quiz.services;

import com.summer.quiz.models.Questions;
import com.summer.quiz.repositories.QuestionsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QuestionsService {
    @Autowired
    private QuestionsRepository questionsRepository;

    public List<Questions> getQuestions(int quizId){
        return questionsRepository.findAllByQuizQuizId(quizId);
    }

    public Questions saveQuestion(Questions question) {
        return questionsRepository.save(question);
    }

    public Integer calculateScore(Integer questionId, String selectedOption, int score) {
        Questions question = questionsRepository.findById(questionId).orElse(null);
        if(selectedOption.equals(question.getCorrectAnswer())) score++;
        return score;
    }

}
