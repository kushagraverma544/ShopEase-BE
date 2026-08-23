package com.example.user_service.service.impl;

import com.example.user_service.dto.UserDto;
import com.example.user_service.entity.User;
import com.example.user_service.service.UserService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

	private final List<User> users = List.of(
			new User(1L, "Aarav Sharma", "aarav@example.com"),
			new User(2L, "Priya Verma", "priya@example.com")
	);

	@Override
	public List<UserDto> getUsers() {
		return users.stream()
				.map(user -> new UserDto(user.getId(), user.getName(), user.getEmail()))
				.toList();
	}
}