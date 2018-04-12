package com.codeup.adlister.dao;

import com.codeup.adlister.models.User;

import java.util.List;

public interface Users {
    User findByUsername(String username);
    User findById(Long id);
    Long insert(User user);
    Long updateUsername(String username, Long id);
    Long updateEmail(String email, Long id);
    Long updatePassword(String password, Long id);
}
