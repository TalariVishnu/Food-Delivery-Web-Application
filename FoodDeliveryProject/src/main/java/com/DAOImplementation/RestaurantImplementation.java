package com.DAOImplementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.DAO.RestaurantDAO;
import com.Model.Restaurant;
import com.Project.utility.DBConnection;

public class RestaurantImplementation implements RestaurantDAO {

    private static final String INSERT_RESTAURANT_QUERY = 
        "INSERT INTO restaurant (name, address, phone, rating, cusineType, isActive, eta, imagePath, adminUserId) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

    private static final String GET_RESTAURANT_QUERY = 
        "SELECT * FROM restaurant WHERE restaurantId = ?";

    private static final String UPDATE_RESTAURANT_QUERY = 
        "UPDATE restaurant SET name = ?, address = ?, phone = ?, rating = ?, cusineType = ?, isActive = ?, eta = ?, adminUserId = ?, imagePath = ? WHERE restaurantId = ?";

    private static final String DELETE_RESTAURANT_QUERY = 
        "DELETE FROM restaurant WHERE restaurantId = ?";

    private static final String GET_ALL_RESTAURANTS_QUERY = 
        "SELECT * FROM restaurant";

    @Override
    public void addRestaurant(Restaurant restaurant) {
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_RESTAURANT_QUERY)) {

            preparedStatement.setString(1, restaurant.getName());
            preparedStatement.setString(2, restaurant.getAddress());
            preparedStatement.setString(3, restaurant.getPhone());
            preparedStatement.setInt(4, restaurant.getRating());
            preparedStatement.setString(5, restaurant.getCusineType());
            preparedStatement.setString(6, restaurant.getIsActive());
            preparedStatement.setString(7, restaurant.getEta());
            preparedStatement.setString(8, restaurant.getImagePath());  // URL
            preparedStatement.setInt(9, restaurant.getAdminUserId());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Restaurant getRestaurant(int restaurantId) {
        Restaurant restaurant = null;
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(GET_RESTAURANT_QUERY)) {

            preparedStatement.setInt(1, restaurantId);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                restaurant = extractRestaurant(resultSet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return restaurant;
    }

    @Override
    public void updateRestaurant(Restaurant restaurant) {
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_RESTAURANT_QUERY)) {

            preparedStatement.setString(1, restaurant.getName());
            preparedStatement.setString(2, restaurant.getAddress());
            preparedStatement.setString(3, restaurant.getPhone());
            preparedStatement.setInt(4, restaurant.getRating());
            preparedStatement.setString(5, restaurant.getCusineType());
            preparedStatement.setString(6, restaurant.getIsActive());
            preparedStatement.setString(7, restaurant.getEta());
            preparedStatement.setInt(8, restaurant.getAdminUserId());
            preparedStatement.setString(9, restaurant.getImagePath());  // URL
            preparedStatement.setInt(10, restaurant.getRestaurantId());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteRestaurant(int restaurantId) {
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_RESTAURANT_QUERY)) {

            preparedStatement.setInt(1, restaurantId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Restaurant> getAllRestaurants() {
        List<Restaurant> restaurantList = new ArrayList<>();
        try (Connection connection = DBConnection.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(GET_ALL_RESTAURANTS_QUERY)) {

            while (resultSet.next()) {
                restaurantList.add(extractRestaurant(resultSet));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return restaurantList;
    }

    private Restaurant extractRestaurant(ResultSet resultSet) throws SQLException {
        int restaurantId = resultSet.getInt("restaurantId");
        String name = resultSet.getString("name");
        String address = resultSet.getString("address");
        String phone = resultSet.getString("phone");
        int rating = resultSet.getInt("rating");
        String cusineType = resultSet.getString("cusineType");
        String isActive = resultSet.getString("isActive");
        String eta = resultSet.getString("eta");
        String imagePath = resultSet.getString("imagePath"); // URL
        int adminUserId = resultSet.getInt("adminUserId");

        return new Restaurant(restaurantId, name, address, phone, rating, cusineType, isActive, eta, adminUserId, imagePath);
    }
}
