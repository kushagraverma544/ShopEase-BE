package com.example.user_service;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
import com.example.user_service.dto.UserDto;
import com.example.user_service.service.UserService;

import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest(webEnvironment = WebEnvironment.NONE, properties = "eureka.client.enabled=false")
class UserServiceApplicationTests {

	@Autowired
	private UserService userService;

	@Test
	void getUsersReturnsSeededUsers() {
		assertThat(userService.getUsers())
				.containsExactly(
						new UserDto(1L, "Aarav Sharma", "aarav@example.com"),
						new UserDto(2L, "Priya Verma", "priya@example.com")
				);
	}

}
