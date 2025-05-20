package com.DAOImplementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.DAO.UserDAO;
import com.Model.User;
import com.Project.utility.DBConnection;

public class UserImplementation implements UserDAO {

    private static final String INSERT_USER_QUERY = "insert into `user` (`name`, `username`, `email`, `password`, `phone`) values(?, ?, ?, ?, ?)";
    private static final String GET_USER_QUERY = "select * from `user` where `userId` = ?";
    private static final String UPDATE_USER_QUERY ="UPDATE `user` SET `name` = ?, `password` = ?, `phone` = ?, `address` = ?, `role` = ? WHERE `userId` = ?";
    private static final String DELETE_USER_QUERY = "delete from `user` where userId = ?";
    private static final String GET_ALL_USERS_QUERY = "select * from `user`";
    private static final String GET_USER_EMAIL = "select * from `user` where email = ?";
    private static final String GET_USER_BY_EMAIL_AND_PASSWORD = "select * from `user` where email = ? and password = ?";

    private int res;

    @Override
    public int addUser(User user) {
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparestatement = connection.prepareStatement(INSERT_USER_QUERY)) {
            preparestatement.setString(1, user.getName());
            preparestatement.setString(2, user.getUsername());
            preparestatement.setString(3, user.getEmail());
            preparestatement.setString(4, user.getPassword());
            preparestatement.setString(5, user.getPhone());

            res = preparestatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return res;
    }

    @Override
    public User getUser(int userId) {
        User user = null;
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparestatement = connection.prepareStatement(GET_USER_QUERY)) {

            preparestatement.setInt(1, userId);
            ResultSet resultset = preparestatement.executeQuery();
            while (resultset.next()) {
                user = extractUser(resultset);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public User getUser(String email) {
        User user = null;
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparestatement = connection.prepareStatement(GET_USER_EMAIL)) {

            preparestatement.setString(1, email);
            ResultSet resultset = preparestatement.executeQuery();
            while (resultset.next()) {
                user = extractUser(resultset);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public void updateUser(User user) {
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USER_QUERY)) {

            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.setString(3, user.getPhone());
            preparedStatement.setString(4, user.getAddress());
            preparedStatement.setString(5, user.getRole());

            preparedStatement.setInt(6, user.getUserId());  // Make sure to add the userId to the query

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }



    @Override
    public void deleteUser(int userId) {
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparestatement = connection.prepareStatement(DELETE_USER_QUERY)) {

            preparestatement.setInt(1, userId);
            preparestatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<User> getAllUsers() {
        List<User> userList = new ArrayList<>();
        try (Connection connection = DBConnection.getConnection();
             Statement statement = connection.createStatement()) {

            ResultSet resultset = statement.executeQuery(GET_ALL_USERS_QUERY);
            while (resultset.next()) {
                User user = extractUser(resultset);
                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }

    @Override
    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(GET_USER_BY_EMAIL_AND_PASSWORD)) {

            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user = extractUser(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    private User extractUser(ResultSet rs) throws SQLException {
        int userId = rs.getInt("userId");
        String name = rs.getString("name");
        String username = rs.getString("username");
        String password = rs.getString("password");
        String email = rs.getString("email");
        String phone = rs.getString("phone");
        String address = rs.getString("address");
        String role = rs.getString("role");

        User user = new User(name, username, password, email, phone, address, role);
        user.setUserId(userId);
        return user;
    }
}
