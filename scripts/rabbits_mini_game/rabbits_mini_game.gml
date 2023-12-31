
function rabbits_mini_game() {
	// Exit out if it's not the right game
	if self.current_mini_game != "Rabbits" {
		return;
	}
	
	var _x = self.x - 10;
	var _y = self.y + 100;
	
	// Draw the close button
	var _close_x = _x + 300;
	var _close_y = self.y - 5;
	self.mouse_on_close = point_in_rectangle(
		mouse_x,
		mouse_y,
		_close_x,
		_close_y,
		_close_x + 16,
		_close_y + 16
	);
	
	// Stop them text
	draw_text_scribble(
		self.x + 75, 
		self.y + 20, 
		"Stop the rabbits!"
	);


	var _close_spr_index = 0;
	if self.mouse_on_close {
		_close_spr_index = 1;
		
		// If the player closes with simon says open then grow whatever they have gotten
		if mouse_check_button_pressed(mb_left) {
			// TODO: Reset rabbits
			//reset_simon_says();
			instance_destroy(obj_carrot_for_game);
			instance_destroy(obj_rabbit_for_game);
				
			// I'm not sure why but there are times that the minigame is staying open
			if instance_exists(obj_mini_game_area) {
				instance_destroy(obj_mini_game_area);
			}
			return;
		}
	}
	
	draw_sprite(
		spr_close,
		_close_spr_index,
		_close_x,
		_close_y
	);

	
	// Draw the row of rabbits and carrots
	var _depth = -60000;
	var _rabbit_x = _x + 15;
	var _rabbit_y = _y - 20;
	
	var _carrot_x = _rabbit_x + 20;
	var _carrot_y = _rabbit_y + 310;

	
	if !obj_mini_game_area.rabbits_is_running 
		and instance_number(obj_rabbit_for_game) < self.rabbits_row_count
	{
		for (var _i = 0; _i < obj_mini_game_area.rabbits_row_count; ++_i;) {
			instance_create_depth(
				_rabbit_x,
				_rabbit_y,
				_depth,
				obj_rabbit_for_game
			);
			
			instance_create_depth(
				_carrot_x,
				_carrot_y,
				_depth,
				obj_carrot_for_game
			);
		
			// Increase the x value for each row
			_rabbit_x += 48;
			_carrot_x += 48;
		}
	}
	
	if !obj_mini_game_area.rabbits_is_running {
		// Start button
		var _start_x = _x + 130;
		var _start_y = _y + 340;
		var _start_index = 0;
		var _mouse_on_start = point_in_rectangle(
			mouse_x,
			mouse_y,
			_start_x,
			_start_y,
			_start_x + 64,
			_start_y + 32
		);
	
		if _mouse_on_start {
			_start_index = 1;
			if mouse_check_button_pressed(mb_left) {
				// Send the rabbits running
				obj_mini_game_area.rabbits_is_running = true;
				obj_rabbit_for_game.start_running = true;
			}
		}
			
		if !self.rabbits_show_success_message {
			draw_sprite_stretched(
				spr_mini_game_start,
				_start_index,
				_start_x,
				_start_y,
				64,
				32
			);
		}
	}

	// Draw the timer
	draw_text_scribble(
		self.x + 15, 
		self.y + 50, 
		$"Time left: {obj_mini_game_area.rabbits_timer}"
	);
	
	// Draw the number of carrots left
	var _carrot_message = $"There are [c_orange]{obj_mini_game_area.rabbits_starting_count}[/c] carrots left!";
	var _message_x = self.x + 35;
	if self.rabbits_show_success_message {
		_carrot_message = $"You saved [c_orange]{obj_mini_game_area.rabbits_starting_count}[/c] carrots!";
		_message_x = _message_x + 20;
	}
	draw_text_scribble(
		_message_x, 
		self.y + 410, 
		_carrot_message
	);
}


function rabbits_game_countdown() {
	// If all the carrots are gone I need to kick out and stop the rabbits
	if self.rabbits_starting_count == 0 {
		obj_rabbit_for_game.start_running = false;
		self.rabbits_show_success_message = true;

		return;
	}
	
	if self.rabbits_timer > 0 {
		if self.rabbits_timer_interval == 0 {
			self.rabbits_timer -= 1;
			self.rabbits_timer_interval = 60;
		}
		else {
			self.rabbits_timer_interval -= 1;
		}
	}
	else {
		// If the timer has ran out then set all the rabbits to stop moving
		obj_rabbit_for_game.start_running = false;
		self.rabbits_show_success_message = true;
		spawn_the_successful_grown_items(self.rabbits_starting_count, obj_carrot_full);
	}
}
