package com.Project;

import java.util.HashMap;
import java.util.Map;

public class CartDAOImplementation
{
	private Map<Integer, CartItem> items;

	public CartDAOImplementation() 
	{
		this.items = new HashMap<>();
	}
	
	public Map<Integer, CartItem> addItem(CartItem item)
	{
		int menuId = item.getMenuId();
		
		if(items.containsKey(menuId))
		{
			CartItem exsistingItem = items.get(menuId);
			exsistingItem.setQuantity(exsistingItem.getQuantity() + item.getQuantity());
		}
		else
		{
			items.put(menuId, item);
		}
		return items;
	}
	
	public Map<Integer, CartItem> updateItem(int menuId, int quantity)
	{
		if(items.containsKey(menuId))
		{
			if(quantity <= 0)
			{
				items.remove(menuId);
			}
			else
			{
				items.get(menuId).setQuantity(quantity);
			}
		}
		return items;
	}
	
	public  void removeItem(int menuId)
	{
		items.remove(menuId);
	}
}
