package com.DAO;

import java.util.List;

import com.Model.User;

public interface UserDAO 
{
	int addUser(User user);
	User getUser(int userId);
	void updateUser(User user);
	void deleteUser(int userId);
	List<User> getAllUsers();
	User getUser(String email);
	User getUserByEmailAndPassword(String email, String password);

}
