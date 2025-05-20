package com.DAO;

import java.util.List;

import com.Model.Menu;

public interface MenuDAO
{
	void addMenu(Menu menu);
	Menu getMenu(int menuId);
	void updateMenu(Menu menu);
	void deleteMenu(int menuId);
	List<Menu> getAllMenusByRestaurant(int restaurantId);
	List<Menu> getMenus(int restaurantId);

}





