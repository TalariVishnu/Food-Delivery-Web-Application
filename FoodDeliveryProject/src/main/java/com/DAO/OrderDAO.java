package com.DAO;

import java.util.List;

import com.Model.Order;

public interface OrderDAO 
{
	void addOrder(Order order);
	Order getOrder(int orderId);
	void updateOrder(Order order);
	void deleteOrder(int orderId);
	List<Order> getAllOrdersByUser(int userId);
	int addOrderAndReturnId(Order order);
	int addOrderAndGetId(Order order);
}
