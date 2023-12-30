/// @description 

draw_sprite_stretched(
	spr_inventory,
	0,
	self.x,
	self.y,
	self.play_area_width,
	self.play_area_height
);


// If the player is in a mini game the whole area is blank
if !self.playing_mini_game {
	// Draw the close button
	var _close_x = self.x + 290;
	var _close_y = self.y - 5;
	self.mouse_on_close = point_in_rectangle(
		mouse_x,
		mouse_y,
		_close_x,
		_close_y,
		_close_x + 16,
		_close_y + 16
	);

	var _close_spr_index = 0;
	if self.mouse_on_close 
		and !self.playing_mini_game
		and !obj_player_inventory.show_settings
		and !obj_player_inventory.inventory_open
	{
		_close_spr_index = 1;
	
		if mouse_check_button_pressed(mb_left) 
			or keyboard_key_press(ord(obj_game_manager.button_interact))
		{
			mouse_click_noise(false);
			instance_destroy(self);
		}
	}
	draw_sprite_stretched(
		spr_close,
		_close_spr_index,
		_close_x,
		_close_y,
		16,
		16
	);

	// Draw the header
	draw_text_scribble(self.x + 60, self.y + 20, "Grow in the garden");

	// Draw the things that the player can grow
	var _grow_text_y = self.y + 90;


	for (var _i = 0; _i < array_length(self.things_that_can_grow); ++_i;) {
		var _item = self.things_that_can_grow[_i]
	
		draw_text_scribble(
			self.x + 40,
			_grow_text_y,
			_item.name
		);
	
		// Draw the item image that will be grown
		draw_sprite_stretched(
			_item.spr,
			0,
			self.x + 140,
			_grow_text_y - 10,
			32,
			32
		);
	
		// Draw the sprite for the grow button
		var _grow_x = self.x + 188;
		var _grow_y = _grow_text_y - 10;
		self.mouse_on_grow = point_in_rectangle(
			mouse_x,
			mouse_y,
			_grow_x,
			_grow_y,
			_grow_x + 64,
			_grow_y + 32
		);
	
		if obj_player_inventory.show_settings
			or obj_player_inventory.inventory_open
		{
			self.mouse_on_grow = false;
		}
	
		if self.mouse_on_grow 
		{
			self.active_grow_index = _i;
		}
		else {
			self.active_grow_index = -1;
		}
	
		// Create the plants that were to be grown
		if mouse_check_button_pressed(mb_left)
			and !obj_player_inventory.show_settings
			and !obj_player_inventory.inventory_open
			and self.active_grow_index != -1
			and !self.playing_mini_game
			and self.click_cooldown = 0
		{
			self.playing_mini_game = true;
			self.can_continue_mini_game = true;
		
			// Simon says
			if _i == 0 {
				self.current_mini_game = "Simon Says";
				self.must_match_array = -1;
			}
			
			// Rabitts
			if _i == 1 {
				spawn_the_successful_grown_items(3, obj_carrot_full);
				self.current_mini_game = "Rabbits";
			}
		}
	
		draw_sprite_stretched(
			spr_garden_grow,
			self.mouse_on_grow,
			_grow_x,
			_grow_y,
			64,
			32
		);

		_grow_text_y += 64;
	}
}
else {
	// Assumes a mini game is in progress
	switch self.current_mini_game {
		case "Simon Says":
			simon_says();
		
		case "Rabbits":
			rabbits_mini_game();
	}
}
