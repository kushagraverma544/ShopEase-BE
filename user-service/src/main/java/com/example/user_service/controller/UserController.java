package com.example.user_service.controller;

import com.example.user_service.dto.UserDto;
import com.example.user_service.service.UserService;

import lombok.RequiredArgsConstructor;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/users")
public class UserController {

	private final UserService userService;

	
	@GetMapping("/all")
	public List<UserDto> getUsers() {
		return userService.getUsers();
	}

	@GetMapping("{id}")
	public UserDto getUserById(@PathVariable Long id) {
		return userService.getUserById(id);
	}

	@PostMapping("/create")
	public UserDto createUser(@RequestBody UserDto userDto) {
		return userService.createUser(userDto);
	}
}