package com.summer.quiz.models;

import jakarta.persistence.*;
import org.hibernate.annotations.CreationTimestamp;

import java.sql.Timestamp;

@Entity
@Table(name = "quiz")
public class Quiz {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int quizId;

    @ManyToOne
    @JoinColumn(name = "categoryId", nullable = false)
    private Category category;
    @ManyToOne
    @JoinColumn(name = "userId", nullable = false)
    private User user;
    private int noOfQuestionToPlay;

    @Column(nullable = false, columnDefinition = "BOOLEAN DEFAULT false")
    private boolean status;
    @CreationTimestamp
    @Column(nullable = false, updatable = false)
    private Timestamp createdDate;

    public int getQuizId() {
        return quizId;
    }

    public void setQuizId(int quizId) {
        this.quizId = quizId;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getNoOfQuestionToPlay() {
        return noOfQuestionToPlay;
    }

    public void setNoOfQuestionToPlay(int noOfQuestionToPlay) {
        this.noOfQuestionToPlay = noOfQuestionToPlay;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Timestamp getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Timestamp createdDate) {
        this.createdDate = createdDate;
    }
}
