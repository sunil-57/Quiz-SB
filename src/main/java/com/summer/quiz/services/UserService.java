package com.summer.quiz.services;

import com.summer.quiz.models.User;
import com.summer.quiz.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {
    @Autowired
    private UserRepository userrepository;

    public void registerUser(User user){
        userrepository.save(user);
    }

    public List<User> getAllUsers(){
        return userrepository.findAll();
    }
}
