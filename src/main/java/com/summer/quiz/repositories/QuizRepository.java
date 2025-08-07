package com.summer.quiz.repositories;

import com.summer.quiz.models.Quiz;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface QuizRepository extends JpaRepository<Quiz, Integer> {
    List<Quiz> findByUserUserid(int userId);
}
