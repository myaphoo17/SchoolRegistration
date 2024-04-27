package studentregistration.persistant.DAO;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import studentregistration.persistant.DTO.UserRequestDTO;
import studentregistration.persistant.DTO.UserResponseDTO;
import studentregistration.utils.ResultMessage;

public class UserDAO {
public static Connection con = null;
	
	static {
		con = MyConnection.getConnection();
	}
	
	
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
	public int editUser(UserRequestDTO userDTO) {
	    int result = 0;
	    String sql = "UPDATE user SET password=?, role=? WHERE email=?";
	    try {
	        PreparedStatement ps = con.prepareStatement(sql);
	        
	        ps.setString(1, userDTO.getPassword());
	        ps.setString(2, userDTO.getRole());
	        ps.setString(3, userDTO.getEmail());
	        
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
			    ResultMessage result_message = new ResultMessage();
			    String sql = "SELECT * FROM user WHERE email = ? AND password = ?";
			    try {
			        PreparedStatement ps = con.prepareStatement(sql);
			        ps.setString(1, user.getEmail());
			        ps.setString(2, user.getPassword());
			        ResultSet rs = ps.executeQuery();
			        if (rs.next()) {
			            result_message.setResult(1); 
			            result_message.setMessage("Login Successful");
			            String role = rs.getString("role");
			            result_message.setRole(role);
			            
			        } else {
			            result_message.setResult(0); 
			            result_message.setMessage("Login Failed: Invalid username or password");
			        }
			    } catch (SQLException e) {
			        System.out.println("SQL Error: " + e);
			        result_message.setResult(0); 
			        result_message.setMessage("Login Failed: " + e.getMessage());
			    }
			    return result_message;
			}
			
	
			public boolean EmailExists(String email) throws SQLException {
				String sql = "SELECT COUNT(*) FROM user WHERE email = ?";
		        try (PreparedStatement statement = con.prepareStatement(sql)) {
		            statement.setString(1, email);
		            try (ResultSet resultSet = statement.executeQuery()) {
		                if (resultSet.next()) {
		                    int count = resultSet.getInt(1);
		                    return count > 0;
		                }
		            }
				return false;
			}}}
			

			
