package com.summer.quiz.repositories;

import com.summer.quiz.models.Questions;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface QuestionsRepository extends JpaRepository<Questions, Integer> {

}
