/// @description


// TODO: Based on the day the pumpkins should start to decay slowly over time
// TODO: Add the sprites to the sprite sheet for decaying pumpkins

self.mouse_on_pumpkin = false;


function rotted_far_enough() {
	// Run to set the sprite image index on creation
	// As the days progress up to the max len of the sprite then that's it dont increase more just remain rotten
	var _len_spr_images = sprite_get_number(self.sprite_index);
	
	if _len_spr_images > obj_quest_manager.current_day_in_game {
		self.image_index = obj_quest_manager.current_day_in_game - 1; // Minus one for 0 index
	}
	else {
		self.image_index = _len_spr_images - 1;
	}
}

// Set the image index for the game progression
rotted_far_enough();