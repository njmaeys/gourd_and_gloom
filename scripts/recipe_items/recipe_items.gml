function recipe_items() {
	return [
			{
				rec_name: "Sunflower",
				rec_spr: recipe_item_sprite("Sunflower"),
				cur_count: 0,
			},
			{
				rec_name: "Red Mushroom",
				rec_spr: recipe_item_sprite("Red Mushroom"),
				cur_count: 0,
			},
			{
				rec_name: "Carrot",
				rec_spr: recipe_item_sprite("Carrot"),
				cur_count: 0,
			}
	]
}

function add_recipe_item_to_player_inventory(_item_type) {
	// Only allowing recipe items for now with this function
	for (var _i = 0; _i < array_length(obj_player_inventory.inventory_recipe); _i += 1) {
		var _item = obj_player_inventory.inventory_recipe[_i];
		if _item.rec_name == _item_type and _item.cur_count < obj_player_inventory.inventory_recipe_count_max {
			_item.cur_count += 1;
		}
	}
	

	audio_play_sound(snd_pickup, 0, false, obj_game_manager.vol_current);
}

function remove_recipe_item_from_player_inventory(_item_type) {
	// Only allowing recipe items for now with this function
	for (var _i = 0; _i < array_length(obj_player_inventory.inventory_recipe); _i += 1) {
		var _item = obj_player_inventory.inventory_recipe[_i];
		if _item.rec_name == _item_type and _item.cur_count > obj_player_inventory.inventory_recipe_count_min {
			_item.cur_count -= 1;
		}
	}
}

function recipe_item_sprite(_item_name) {
	switch (_item_name) {
		case "Red Mushroom":
			return spr_mushroom_red
		
		case "Sunflower":
			return spr_sunflower
				
		case "Carrot":
			return spr_carrot
	}
}

function add_item_to_cauldron(_item_name) {
	// Specific interaction with the cauldron to check if the item trying to be added is of the type
	// it needs within it's current recipe
	
	// If the cauldron has no active recipe then just back out
	if obj_cauldron.current_recipe = -1 {
		return;
	}
	
	// Ensure the player has the item needed before lowering the count in the cauldron
	var _has_item = false;
	for (var _i = 0; _i < array_length(obj_player_inventory.inventory_recipe); _i += 1) {
		var _hi = obj_player_inventory.inventory_recipe[_i]
		
		if _hi.rec_name == _item_name and _hi.cur_count > 0 {
			_has_item = true;
		}
	}
	
	var _recipe_needs = 0;
	var _recipe_has = 0;
	for (var _i = 0; _i < array_length(obj_cauldron.current_recipe.recipe_requirements); _i += 1) {
		var _it = obj_cauldron.current_recipe.recipe_requirements[_i]
		
		if _has_item
			and _it.item_name == _item_name 
			and _it.current < _it.needed 
		{
			// Decrease the currently needed number in the recipe
			_it.current += 1;
				
			// Remove the item from the player items
			remove_recipe_item_from_player_inventory(_item_name);
		}
		
		// Every time this runs _recipe_complete should start at 0 and only ever be finally 0 if all items are at 0
		_recipe_needs += _it.needed;
		_recipe_has += _it.current
	}
	
	// If the recipe is complete the reset the cauldron
	if _recipe_needs == _recipe_has {
		// Add the recipe to the quest log completion
		add_completed_recipe_to_player_tasks(obj_cauldron.current_recipe.recipe_name);
	}
}