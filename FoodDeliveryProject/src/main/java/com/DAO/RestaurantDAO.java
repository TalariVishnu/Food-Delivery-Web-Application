package com.DAO;

import java.util.List;

import com.Model.Restaurant;



public interface RestaurantDAO {
	
	void addRestaurant(Restaurant restaurant);
	Restaurant getRestaurant(int restaurantId);
	void updateRestaurant(Restaurant restaurant);
	void deleteRestaurant(int restaurantId);
	List<Restaurant> getAllRestaurants();
}
