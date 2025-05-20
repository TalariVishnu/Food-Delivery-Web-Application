package com.DAOImplementation;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.DAO.MenuDAO;
import com.Model.Menu;
import com.Project.utility.DBConnection;

public class MenuImplementation implements MenuDAO {

    private static final String INSERT_MENU_QUERY = "insert into `menu` (`restaurantId`, `itemName`, `description`, `price`, `ratings`, `isAvailable`, `imagePath`) values(?, ?, ?, ?, ?, ?, ?)";
    private static final String GET_MENU_QUERY = "select * from `menu` where `menuId` = ?";
    private static final String UPDATE_MENU_QUERY = "UPDATE `menu` SET `restaurantId` = ?, `itemName` = ?, `description` = ?, `price` = ?, `ratings` = ?, `isAvailable` = ?, `imagePath` = ? WHERE `menuId` = ?";
    private static final String DELETE_MENU_QUERY = "delete from `menu` where `menuId` = ?";
    private static final String GET_ALL_MENUS_QUERY = "select * from `menu`";
    private static final String GET_MENUS = "SELECT DISTINCT * FROM `menu` WHERE `restaurantId` = ?";

    @Override
    public void addMenu(Menu menu) {
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparestatement = connection.prepareStatement(INSERT_MENU_QUERY)) {
            preparestatement.setInt(1, menu.getRestaurantId());
            preparestatement.setString(2, menu.getItemName());
            preparestatement.setString(3, menu.getDescription());
            preparestatement.setInt(4, menu.getPrice());
            preparestatement.setInt(5, menu.getRatings());
            preparestatement.setString(6, menu.getIsAvailable());
            preparestatement.setString(7, menu.getImagePath()); // Directly storing the image path (URL or file path)
            
            int res = preparestatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Menu getMenu(int mid) {
        Menu menu = null;
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparestatement = connection.prepareStatement(GET_MENU_QUERY)) {

            preparestatement.setInt(1, mid);
            ResultSet resultset = preparestatement.executeQuery();

            if (resultset.next()) {
                menu = extractMenu(resultset);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return menu;
    }

    @Override
    public void updateMenu(Menu menu) {
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparestatement = connection.prepareStatement(UPDATE_MENU_QUERY)) {
            preparestatement.setInt(1, menu.getRestaurantId());
            preparestatement.setString(2, menu.getItemName());
            preparestatement.setString(3, menu.getDescription());
            preparestatement.setInt(4, menu.getPrice());
            preparestatement.setInt(5, menu.getRatings());
            preparestatement.setString(6, menu.getIsAvailable());
            preparestatement.setString(7, menu.getImagePath()); // Directly updating the image path
            preparestatement.setInt(8, menu.getMenuId()); // Adding the menuId for the update
            
            int res = preparestatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteMenu(int menuId) {
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparestatement = connection.prepareStatement(DELETE_MENU_QUERY)) {
            preparestatement.setInt(1, menuId);
            int res = preparestatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Menu> getAllMenusByRestaurant(int restaurantId) {
        List<Menu> menuList = new ArrayList<>();
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(GET_MENUS)) {

            statement.setInt(1, restaurantId);
            ResultSet resultset = statement.executeQuery();

            while (resultset.next()) {
                Menu menu = extractMenu(resultset);
                menuList.add(menu);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return menuList;
    }

    // Helper method to extract Menu object from ResultSet
    Menu extractMenu(ResultSet resultset) throws SQLException {
        int menuId = resultset.getInt("menuId");
        int restaurantId = resultset.getInt("restaurantID");
        String itemName = resultset.getString("itemName");
        String description = resultset.getString("description");
        int price = resultset.getInt("price");
        int ratings = resultset.getInt("ratings");
        String isAvailable = resultset.getString("isAvailable");
        String imagePath = resultset.getString("imagePath"); // Directly retrieve image path (URL or file path)
        
        return new Menu(menuId, restaurantId, itemName, description, price, ratings, isAvailable, imagePath);
    }

    @Override
    public List<Menu> getMenus(int restaurantId) {
        List<Menu> menuList = new ArrayList<>();
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(GET_MENUS)) {

            statement.setInt(1, restaurantId);
            ResultSet resultset = statement.executeQuery();

            while (resultset.next()) {
                Menu menu = extractMenu(resultset);
                menuList.add(menu);    
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return menuList;
    }
}
