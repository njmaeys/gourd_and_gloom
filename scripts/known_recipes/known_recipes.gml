// Complie the list of recipes and the expected needed items
function known_recipes(_recipe){
	// TODO: Come up with clever names for these
	
	// Return the current recipe that the player needs to create
	switch (_recipe) {
		case "Basic Health Potion":
			return {
				recipe_name: _recipe,
				recipe_requirements: [
					{
						item_name: "Sunflower",
						item_spr: recipe_item_sprite("Sunflower"),
						needed: 3,
						current: 0,
					},
					{
						item_name: "Red Mushroom",
						item_spr: recipe_item_sprite("Red Mushroom"),
						needed: 3,
						current: 0,
					}
				]
			}
			
		case "Carrot Juice":
			return {
				recipe_name: _recipe,
				recipe_requirements: [
					{
						item_name: "Carrot",
						item_spr: recipe_item_sprite("Carrot"),
						needed: 4,
						current: 0,
					}
				]
			}
	}
}

//function add_completed_recipe_to_player_tasks(_recipe_item, _successful) {
//	obj_player_inventory.potion_completed_successfully = _successful;
//	var _rec_len = array_length(obj_player.recipe_quest_progress);
//	for (var _i = 0; _i < _rec_len; _i += 1) {
//		var _item = obj_player.recipe_quest_progress[_i]

//		if _recipe_item == _item.potion_name
//			// I'm going to just assume it's always going to be 0. One slot per potion to brew
//			and _item.potion_count == 0
//		{
//			// Remove the inventory/cauldron view and draw a potion real big and animated or something
//			// Basically a big (good job) when the potion is brewed
//			obj_player_inventory.potion_complete_cooldown = 60;
//			audio_play_sound(snd_potion_complete, 0, false, obj_game_manager.vol_current);
//			obj_player_inventory.potion_just_completed = obj_player.recipe_quest_progress[_i];
			
//			if _successful {
//				obj_player.recipe_quest_progress[_i].potion_count += 1;
			
//				var _rec_next = _i + 1;
//				// If the player has completed the objective then reset the cauldron recipe
//				if _rec_next >= _rec_len {
//					// TODO: Figure out how to have some sort of cauldron annimation 
//					obj_cauldron.current_recipe = -1;
//					break;
//				}
							
//				obj_cauldron.current_recipe = known_recipes(obj_player.recipe_quest_progress[_rec_next].potion_name);
//				// This will auto set the next potion
//				obj_cauldron.current_recipe_index = _rec_next;
//			}
			
//			// Call break to prevent the same recipe names being updated
//			break;
//		}
//	}
//}


function add_completed_recipe_to_player_tasks(_recipe_item, _successful) {
	obj_player_inventory.potion_completed_successfully = _successful;

	var _item = obj_player.recipe_quest_progress[obj_cauldron.current_recipe_index]

	if _recipe_item == _item.potion_name
		// I'm going to just assume it's always going to be 0. One slot per potion to brew
		and _item.potion_count == 0
	{
		// Remove the inventory/cauldron view and draw a potion real big and animated or something
		// Basically a big (good job) when the potion is brewed
		obj_player_inventory.potion_complete_cooldown = 60;
		audio_play_sound(snd_potion_complete, 0, false, obj_game_manager.vol_current);
		obj_player_inventory.potion_just_completed = obj_player.recipe_quest_progress[obj_cauldron.current_recipe_index];
			
		if _successful {
			// Look through all the potions in the progress and see if one is not completed
			var _rec_len = array_length(obj_player.recipe_quest_progress);
			obj_player.recipe_quest_progress[obj_cauldron.current_recipe_index].potion_count += 1;
			var _rec_next = -1;
			for (var _a = 0; _a < _rec_len; _a += 1) {
				// Loop the the potions and try to set the value
				if obj_player.recipe_quest_progress[_a].potion_count == 0 {
					_rec_next = _a;
				}
			}
							
			obj_cauldron.current_recipe = known_recipes(obj_player.recipe_quest_progress[_rec_next].potion_name);
			// This will auto set the next potion
			obj_cauldron.current_recipe_index = _rec_next;
		}
	}
	
}