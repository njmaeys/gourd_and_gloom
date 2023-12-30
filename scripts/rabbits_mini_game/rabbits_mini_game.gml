
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
	
	// TODO: Show the rabbits success message
	draw_text_scribble(self.x + 90, self.y + 70, "Coming soon!");
	//if self.simon_says_show_success_message {
	//	// Show the success message when reset called
	//	draw_text_scribble(self.x + 50, self.y + 70, $"You grew {floor(self.simon_says_player_progress)} Sunflowers!");
	//}

	var _close_spr_index = 0;
	if self.mouse_on_close {
		_close_spr_index = 1;
		
		// If the player closes with simon says open then grow whatever they have gotten
		if mouse_check_button_pressed(mb_left) {
			// TODO: Reset rabbits
			//reset_simon_says();
				
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
			self.start_mini_game = true;
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