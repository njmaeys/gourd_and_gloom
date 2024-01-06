/// @description 

// Just exit out if the button is not allowed to click
if !self.can_click {
	return;
}

// Mouse check
self.mouse_hovering = mouse_hovering_object();

if self.mouse_hovering {
	self.image_index = 1;
	
	if mouse_check_button_pressed(mb_left) {
		mouse_click_noise(true);
		
		// Send the player to the start in the cellar
		obj_player.spawn_point_name_dest = "summon_start";
		warp_with_transition(rm_witch_cellar)
		
		// Try to destroy and then create all the things
		instance_destroy(obj_player);
		if !instance_exists(obj_player) {
			instance_create_layer(0, 0, "Instances", obj_player);
		}
		instance_destroy(obj_cauldron);
		if !instance_exists(obj_cauldron) {
			instance_create_layer(0, 0, "Instances", obj_cauldron);
		}
		instance_destroy(obj_player_inventory);
		if !instance_exists(obj_player_inventory) {
			instance_create_layer(0, 0, "Instances", obj_player_inventory);
		}
		instance_destroy(obj_game_manager);
		if !instance_exists(obj_game_manager) {
			instance_create_layer(0, 0, "Instances", obj_game_manager);
		}
		instance_destroy(obj_quest_manager);
		if !instance_exists(obj_quest_manager) {
			instance_create_layer(0, 0, "Instances", obj_quest_manager);
		}
	}
}
else {
	self.image_index = 0;
}



