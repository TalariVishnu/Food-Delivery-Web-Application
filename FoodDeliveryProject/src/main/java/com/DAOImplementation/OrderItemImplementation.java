package com.DAOImplementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.DAO.OrderItemDAO;
import com.Model.OrderItem;
import com.Project.utility.DBConnection;

public class OrderItemImplementation implements OrderItemDAO {

    private static final String INSERT_ORDERITEM_QUERY = "INSERT INTO `orderitem` (`orderId`, `menuId`, `quantity`, `totalPrice`) VALUES (?, ?, ?, ?)";
    private static final String GET_ORDERITEM_QUERY = "SELECT * FROM `orderitem` WHERE `orderItemId` = ?";
    private static final String UPDATE_ORDERITEM_QUERY = "UPDATE `orderitem` SET `orderId` = ?, `menuId` = ?, `quantity` = ?, `totalPrice` = ? WHERE `orderItemId` = ?";
    private static final String DELETE_ORDERITEM_QUERY = "DELETE FROM `orderitem` WHERE `orderItemId` = ?";
    private static final String GET_ALL_ORDERITEMS_QUERY = "SELECT * FROM `orderitem` WHERE `orderId` = ?";

    @Override
    public boolean addOrderItem(OrderItem item) {
        boolean status = false;
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(INSERT_ORDERITEM_QUERY)) {

            ps.setInt(1, item.getOrderId());
            ps.setInt(2, item.getMenuId());
            ps.setInt(3, item.getQuantity());
            ps.setInt(4, item.getTotalPrice());

            int rows = ps.executeUpdate();
            if (rows > 0) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    @Override
    public OrderItem getOrderItem(int orderItemId) {
        OrderItem orderitem = null;

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(GET_ORDERITEM_QUERY)) {

            ps.setInt(1, orderItemId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                orderitem = extractOrderItem(rs);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orderitem;
    }

    @Override
    public void updateOrderItem(OrderItem orderitem) {
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(UPDATE_ORDERITEM_QUERY)) {

            ps.setInt(1, orderitem.getOrderId());
            ps.setInt(2, orderitem.getMenuId());
            ps.setInt(3, orderitem.getQuantity());
            ps.setInt(4, orderitem.getTotalPrice());
            ps.setInt(5, orderitem.getOrderItemId());

            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteOrderItem(int orderItemId) {
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(DELETE_ORDERITEM_QUERY)) {

            ps.setInt(1, orderItemId);
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<OrderItem> getAllOrderItemsByOrder(int orderId) {
        List<OrderItem> orderItems = new ArrayList<>();

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(GET_ALL_ORDERITEMS_QUERY)) {

            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                OrderItem orderItem = extractOrderItem(rs);
                orderItems.add(orderItem);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orderItems;
    }

    private OrderItem extractOrderItem(ResultSet rs) throws SQLException {
        int orderItemId = rs.getInt("orderItemId");
        int orderId = rs.getInt("orderId");
        int menuId = rs.getInt("menuId");
        int quantity = rs.getInt("quantity");
        int totalPrice = rs.getInt("totalPrice");

        return new OrderItem(orderItemId, orderId, menuId, quantity, totalPrice);
    }
}
