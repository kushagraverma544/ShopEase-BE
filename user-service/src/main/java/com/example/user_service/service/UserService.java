package com.example.user_service.service;

import com.example.user_service.dto.UserDto;

import java.util.List;

public interface UserService {

	List<UserDto> getUsers();
}