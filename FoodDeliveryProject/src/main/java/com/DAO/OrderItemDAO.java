package com.DAO;

import java.util.List;

import com.Model.OrderItem;

public interface OrderItemDAO 
{
	boolean addOrderItem(OrderItem orderitem);
	OrderItem getOrderItem(int orderItemId);
	void updateOrderItem(OrderItem orderitem);
	void deleteOrderItem(int orderItemId);
	List<OrderItem> getAllOrderItemsByOrder(int orderId);
}
