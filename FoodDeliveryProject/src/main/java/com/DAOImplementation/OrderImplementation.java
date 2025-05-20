package com.DAOImplementation;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.DAO.OrderDAO;
import com.Model.Order;
import com.Project.utility.DBConnection;

public class OrderImplementation implements OrderDAO {

    private static final String INSERT_ORDERS_QUERY = "INSERT INTO orders (userId, restaurantId, totalAmount, status, paymentMode) VALUES (?, ?, ?, ?, ?)";
    private static final String GET_ORDER_QUERY = "SELECT * FROM orders WHERE orderId = ?";
    private static final String UPDATE_ORDER_QUERY = "UPDATE orders SET totalAmount = ?, status = ?, paymentMode = ? WHERE orderId = ?";
    private static final String DELETE_ORDER_QUERY = "DELETE FROM orders WHERE orderId = ?";
    private static final String GET_ORDERS_BY_USER_QUERY = "SELECT * FROM orders WHERE userId = ?";

    @Override
    public void addOrder(Order order) {
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(INSERT_ORDERS_QUERY)) {

            stmt.setInt(1, order.getUserId());
            stmt.setInt(2, order.getRestaurantId());
            stmt.setInt(3, order.getTotalAmount());
            stmt.setString(4, order.getStatus());
            stmt.setString(5, order.getPaymentMode());

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Order getOrder(int orderId) {
        Order order = null;
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(GET_ORDER_QUERY)) {

            stmt.setInt(1, orderId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                order = extractOrder(rs);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return order;
    }

    @Override
    public void updateOrder(Order order) {
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(UPDATE_ORDER_QUERY)) {

            stmt.setInt(1, order.getTotalAmount());
            stmt.setString(2, order.getStatus());
            stmt.setString(3, order.getPaymentMode());
            stmt.setInt(4, order.getOrderId());

            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteOrder(int orderId) {
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(DELETE_ORDER_QUERY)) {

            stmt.setInt(1, orderId);
            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Order> getAllOrdersByUser(int userId) {
        List<Order> orders = new ArrayList<>();
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(GET_ORDERS_BY_USER_QUERY)) {

            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                orders.add(extractOrder(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    @Override
    public int addOrderAndGetId(Order order) {
        int generatedId = -1;
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(INSERT_ORDERS_QUERY, Statement.RETURN_GENERATED_KEYS)) {

            stmt.setInt(1, order.getUserId());
            stmt.setInt(2, order.getRestaurantId());
            stmt.setInt(3, order.getTotalAmount());
            stmt.setString(4, order.getStatus());
            stmt.setString(5, order.getPaymentMode());

            int affectedRows = stmt.executeUpdate();

            if (affectedRows > 0) {
                ResultSet rs = stmt.getGeneratedKeys();
                if (rs.next()) {
                    generatedId = rs.getInt(1);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return generatedId;
    }

    @Override
    public int addOrderAndReturnId(Order order) {
        int orderId = -1;
        try {
            Connection con = DBConnection.getConnection();
            String sql = "INSERT INTO orders (userId, restaurantId, orderDate, totalAmount, status, paymentMode) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            ps.setInt(1, order.getUserId());
            ps.setInt(2, order.getRestaurantId());
            ps.setDate(3, new java.sql.Date(order.getOrderDate().getTime()));
            ps.setInt(4, order.getTotalAmount());
            ps.setString(5, order.getStatus());
            ps.setString(6, order.getPaymentMode());

            int rows = ps.executeUpdate();
            if (rows > 0) {
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    orderId = rs.getInt(1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orderId;
    }


    private Order extractOrder(ResultSet rs) throws SQLException {
        Order order = new Order();
        order.setOrderId(rs.getInt("orderId"));
        order.setUserId(rs.getInt("userId"));
        order.setRestaurantId(rs.getInt("restaurantId"));
        order.setOrderDate(rs.getDate("orderDate"));
        order.setTotalAmount(rs.getInt("totalAmount"));
        order.setStatus(rs.getString("status"));
        order.setPaymentMode(rs.getString("paymentMode"));
        return order;
    }
}
