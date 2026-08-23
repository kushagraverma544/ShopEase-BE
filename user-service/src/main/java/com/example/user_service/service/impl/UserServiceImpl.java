package com.example.user_service.service.impl;

import com.example.user_service.dto.UserDto;
import com.example.user_service.entity.User;
import com.example.user_service.repository.UserRepository;
import com.example.user_service.service.UserService;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

	private final UserRepository userRepository;

	@Override
	public List<UserDto> getUsers() {
		return userRepository.findAll().stream()
				.map(user -> new UserDto(user.getId(), user.getName(), user.getEmail()))
				.toList();
	}

	@Override
	public UserDto getUserById(Long id) {
		User user = userRepository.findById(id).orElseThrow(() -> new RuntimeException("User not found"));
		return new UserDto(user.getId(), user.getName(), user.getEmail());
	}

	@Override
	public UserDto createUser(UserDto userDto) {
		User user = new User();
		user.setName(userDto.getName());
		user.setEmail(userDto.getEmail());
		user = userRepository.save(user);
		return new UserDto(user.getId(), user.getName(), user.getEmail());
	}
}
