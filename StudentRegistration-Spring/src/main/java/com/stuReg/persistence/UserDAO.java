package com.stuReg.persistence;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.stuReg.models.UserRequestDTO;
import com.stuReg.models.UserResponseDTO;
import com.stuReg.utils.ResultMessage;

@Service("user_repo")
public class UserDAO {
public static Connection con = null;
	
	static {
		con = MyConnection.getConnection();
	}
	
	//insert
	
	public int addUser(UserRequestDTO UserDTO) {
		int result = 0;
		String sql = "INSERT INTO user(email,password,role) VALUES(?,?,?)";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, UserDTO.getEmail());
			ps.setString(2, UserDTO.getPassword());
			ps.setString(3, UserDTO.getRole());
		
		
			result = ps.executeUpdate();
			
		}catch(SQLException e){
			System.out.println("Insert error!!! "+e);
		}
		return result;
	}
	
	//edit
	public int editUser(UserRequestDTO user) {
	    int result = 0;
	    String sql = "UPDATE user SET password=?, role=? WHERE email=?";
	    try {
	        PreparedStatement ps = con.prepareStatement(sql);
	        
	        ps.setString(1, user.getPassword());
	        ps.setString(2, user.getRole());
	        ps.setString(3, user.getEmail());
	        
	        result = ps.executeUpdate();
	    } catch(SQLException e) {
	        System.out.println("Update error: " + e.getMessage());
	    }
	    return result;
	}

	public int deleteUser(String email) {
		int result = 0;
		String sql = "DELETE FROM user WHERE email = ?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1, email);
			
			result = ps.executeUpdate();
			
		}catch(SQLException e){
			System.out.println("Delete error!!! "+e);
		}
		return result;
	}
	
	public UserResponseDTO getUserByEmail(String email) {
		UserResponseDTO user = new UserResponseDTO();
		String sql = "SELECT * FROM user WHERE email = ?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,email);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setRole(rs.getString("role"));
			}
			
		}catch(SQLException e) {
			System.out.println("Select error!!! "+e);
		}
		return user;
	}
	
	public List<UserResponseDTO> getAllusers() {
		List<UserResponseDTO> users = new ArrayList<UserResponseDTO>();
		String sql = "SELECT * FROM user";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				UserResponseDTO user = new UserResponseDTO();
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setRole(rs.getString("role"));
				
				users.add(user);
			}
			
		}catch(SQLException e) {
			System.out.println("Select all error!!! "+e);
		}
		return  users;
	}
	
	 public ResultMessage login(UserRequestDTO user) {
	        ResultMessage resultMessage = new ResultMessage();
	        String sql = "SELECT * FROM user WHERE email = ? AND password = ?";
	        try (PreparedStatement ps = con.prepareStatement(sql)) {
	            ps.setString(1, user.getEmail());
	            ps.setString(2, user.getPassword());
	            try (ResultSet rs = ps.executeQuery()) {
	                if (rs.next()) {
	                    resultMessage.setResult(1); 
	                    resultMessage.setMessage("Login Successful");
	                    String role = rs.getString("role");
	                    resultMessage.setRole(role);
	                } else {
	                    resultMessage.setResult(0);
	                    resultMessage.setMessage("Login Failed: Invalid email or password");
	                }
	            }
	        } catch (SQLException e) {
	            System.out.println("SQL Error: " + e.getMessage());
	            resultMessage.setResult(0); 
	            resultMessage.setMessage("Login Failed: " + e.getMessage());
	        }
	        return resultMessage;
	    }
	
			 public boolean isEmailExists(String email) throws SQLException {
			        String sql = "SELECT COUNT(*) FROM user WHERE email = ?";
			        try (PreparedStatement statement = con.prepareStatement(sql)) {
			            statement.setString(1, email);
			            try (ResultSet resultSet = statement.executeQuery()) {
			                if (resultSet.next()) {
			                    int count = resultSet.getInt(1);
			                    return count > 0;
			                }
			            }
			        }
			        return false;
			    }

			 public List<UserResponseDTO> getAllAdmins() {
			        List<UserResponseDTO> admins = new ArrayList<>();
			        String sql = "SELECT * FROM user WHERE role = 'admin' OR role = 'Admin'";


			        try (PreparedStatement ps = con.prepareStatement(sql);
			             ResultSet rs = ps.executeQuery()) {

			            while (rs.next()) {
			                UserResponseDTO admin = new UserResponseDTO();
			                admin.setEmail(rs.getString("email"));
			                admin.setPassword(rs.getString("password"));
			                admin.setRole(rs.getString("role"));
			                admins.add(admin);
			            }

			        } catch (SQLException e) {
			            // Log the exception using a logging framework instead of System.out.println
			            System.err.println("Error retrieving admin users: " + e.getMessage());
			        }

			        return admins;
			    }

			}

			
