package com.stuReg.models;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class UserResponseDTO {

	@Email(message = "Invalid email format")
	@Size(max = 20, message = "Email cannot exceed 20 characters")
	@NotBlank(message = "Email cannot be blank")
	private String email;
	@NotBlank(message = "Password cannot be blank")
	@NotNull(message = "Password cannot be null")
	private String password;
	private String role;

	public UserResponseDTO() {

	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

}
