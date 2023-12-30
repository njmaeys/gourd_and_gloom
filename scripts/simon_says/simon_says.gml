function simon_says() {
	// Exit out if it's not the right game
	if self.current_mini_game != "Simon Says" {
		return;
	}
	
	// Set the final array that they player must fullfil
	// I think I may need to have a while loop with failure counts
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
	
	if self.simon_says_show_success_message {
		// Show the success message when reset called
		draw_text_scribble(self.x + 50, self.y + 70, $"You grew [c_yellow]{floor(self.simon_says_player_progress)}[/c] Sunflowers!");
	}

	var _close_spr_index = 0;
	if self.mouse_on_close {
		_close_spr_index = 1;
		
		// If the player closes with simon says open then grow whatever they have gotten
		if mouse_check_button_pressed(mb_left) {
			reset_simon_says();
				
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
	
	// Draw the progress
	var _progress_shown = self.simon_says_player_progress * 2;
	if self.simon_says_show_success_message {
		_progress_shown = 0;
	}
	draw_sprite_stretched(
		spr_sunflower_simon_says_progress,
		_progress_shown,
		_x + 60,
		_y - 80,
		194,
		32
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
	
	if !self.simon_says_show_success_message {
		draw_sprite_stretched(
			spr_mini_game_start,
			_start_index,
			_start_x,
			_start_y,
			64,
			32
		);
	}
	
	while !obj_mini_game_area.start_mini_game {
		// Don't let the game start until the player clicks the start
		draw_sprite_stretched(
			spr_sunflower_simon_says,
			0,
			_x,
			_y,
			320,
			320
		);
		return;
	}

	// If the must match Simon says array is not set then go and set it
	if self.simon_says_must_match_array == -1 {
		self.simon_says_must_match_array = [];
		for (var _i = 0; _i < self.simon_says_len; ++_i;) {
			var _rn = irandom_range(1, 8);
			while _rn == array_last(self.simon_says_must_match_array) {
				_rn = irandom_range(1, 8);
			}
			array_push(self.simon_says_must_match_array, _rn); 
		}
	}


	// Cycle through the current array of expected
	if self.simon_says_play_next_set 
		and self.simon_says_player_progress <= self.simon_says_len
	{	
		if audio_is_playing(snd_simon_says_beep_click) {
			draw_sprite_stretched(
				spr_sunflower_simon_says,
				self.simon_says_must_match_array[self.simon_says_player_progress - 1],
				_x,
				_y,
				320,
				320
			);
			return;
		}
		
		if self.simon_says_loop_initialize_cooldown > 0 {
			self.simon_says_loop_initialize_cooldown -= 1;
			var _draw_index = self.simon_says_must_match_array[self.simon_says_player_progress - 1]
			if self.simon_says_loop_initialize_cooldown <= 20 {
				_draw_index = 0;
			}
			draw_sprite_stretched(
				spr_sunflower_simon_says,
				_draw_index,
				_x,
				_y,
				320,
				320
			);
			return;
		}
		
		if self.simon_says_cycle_cooldown < 12 {
			draw_sprite_stretched(
				spr_sunflower_simon_says,
				0,
				_x,
				_y,
				320,
				320
			);
		}
		else {
			draw_sprite_stretched(
				spr_sunflower_simon_says,
				self.simon_says_must_match_array[self.simon_says_current_progress],
				_x,
				_y,
				320,
				320
			);
			
			
			var _snd_pitch = 0.08 + (self.simon_says_must_match_array[self.simon_says_current_progress] / 10)
			if !audio_is_playing(snd_simon_says_beep) {
				audio_play_sound(snd_simon_says_beep, 0, false, obj_game_manager.vol_current, 0, _snd_pitch);
			}
		}
				
		if self.simon_says_cycle_cooldown == 0 {
			audio_stop_sound(snd_simon_says_beep);
			audio_stop_sound(snd_simon_says_beep_click);
			self.simon_says_cycle_cooldown = 40;
			self.simon_says_current_progress += 1;
			

		}
		else {
			self.simon_says_cycle_cooldown -= 1;
		
			if self.simon_says_current_progress >= self.simon_says_player_progress
				and self.simon_says_cycle_cooldown == 0
			{
				audio_stop_sound(snd_simon_says_beep);
				audio_stop_sound(snd_simon_says_beep_click);
				self.simon_says_loop_initialize_cooldown = 30;
				self.simon_says_play_next_set = false;
			}
		}

		return;
	}
			
	// Track the mouse and the stuff that it is hovering
	var _flower_display_index = 0;
	var _flower_center_x = _x + 148;
	var _flower_center_y = _y + 70;
	
	var _1_x = _flower_center_x;
	var _1_y = _flower_center_y + 50;
	var _mouse_in_1 = point_in_rectangle(
		mouse_x,
		mouse_y,
		_1_x,
		_1_y,
		_1_x + 24,
		_1_y + 36
	);
	if _mouse_in_1 
		and !self.simon_says_play_next_set
	{
		_flower_display_index = 1;
		if mouse_check_button_pressed(mb_left) {
			self.simon_says_mouse_click_audio_cooldown = 30;
			play_click_beeper_tone(_flower_display_index);
			check_click_matches_expected(_flower_display_index);
		}
	}

	
	var _2_x = _flower_center_x - 30;
	var _2_y = _flower_center_y + 40;
	var _mouse_in_2 = point_in_rectangle(
		mouse_x,
		mouse_y,
		_2_x,
		_2_y,
		_2_x + 24,
		_2_y + 36
	);
	if _mouse_in_2 
		and !self.simon_says_play_next_set
	{
		_flower_display_index = 2;
		if mouse_check_button_pressed(mb_left) {
			self.simon_says_mouse_click_audio_cooldown = 30;
			play_click_beeper_tone(_flower_display_index);
			check_click_matches_expected(_flower_display_index);
		}
	}	
		
	var _3_x = _flower_center_x - 45;
	var _3_y = _flower_center_y;
	var _mouse_in_3 = point_in_rectangle(
		mouse_x,
		mouse_y,
		_3_x,
		_3_y,
		_3_x + 24,
		_3_y + 36
	);
	if _mouse_in_3 
		and !self.simon_says_play_next_set
	{
		_flower_display_index = 3;
		if mouse_check_button_pressed(mb_left) {
			self.simon_says_mouse_click_audio_cooldown = 30;
			play_click_beeper_tone(_flower_display_index);
			check_click_matches_expected(_flower_display_index);
		}
	}	
	
	var _4_x = _flower_center_x - 30;
	var _4_y = _flower_center_y - 45;
	var _mouse_in_4 = point_in_rectangle(
		mouse_x,
		mouse_y,
		_4_x,
		_4_y,
		_4_x + 24,
		_4_y + 36
	);
	if _mouse_in_4 
		and !self.simon_says_play_next_set
	{
		_flower_display_index = 4;
		if mouse_check_button_pressed(mb_left) {
			self.simon_says_mouse_click_audio_cooldown = 30;
			play_click_beeper_tone(_flower_display_index);
			check_click_matches_expected(_flower_display_index);
		}
	}	
	
	var _5_x = _flower_center_x;
	var _5_y = _flower_center_y - 55;
	var _mouse_in_5 = point_in_rectangle(
		mouse_x,
		mouse_y,
		_5_x,
		_5_y,
		_5_x + 24,
		_5_y + 36
	);
	if _mouse_in_5 
		and !self.simon_says_play_next_set
	{
		_flower_display_index = 5;
		if mouse_check_button_pressed(mb_left) {
			self.simon_says_mouse_click_audio_cooldown = 30;
			play_click_beeper_tone(_flower_display_index);
			check_click_matches_expected(_flower_display_index);
		}
	}
	
	var _6_x = _flower_center_x + 30;
	var _6_y = _flower_center_y - 45;
	var _mouse_in_6 = point_in_rectangle(
		mouse_x,
		mouse_y,
		_6_x,
		_6_y,
		_6_x + 24,
		_6_y + 36
	);
	if _mouse_in_6 
		and !self.simon_says_play_next_set
	{
		_flower_display_index = 6;
		if mouse_check_button_pressed(mb_left) {
			self.simon_says_mouse_click_audio_cooldown = 30;
			play_click_beeper_tone(_flower_display_index);
			check_click_matches_expected(_flower_display_index);
		}
	}
	
	var _7_x = _flower_center_x + 45;
	var _7_y = _flower_center_y;
	var _mouse_in_7 = point_in_rectangle(
		mouse_x,
		mouse_y,
		_7_x,
		_7_y,
		_7_x + 24,
		_7_y + 36
	);
	if _mouse_in_7 
		and !self.simon_says_play_next_set
	{
		_flower_display_index = 7;
		if mouse_check_button_pressed(mb_left) {
			self.simon_says_mouse_click_audio_cooldown = 30;
			play_click_beeper_tone(_flower_display_index);
			check_click_matches_expected(_flower_display_index);
		}
	}
	
	var _8_x = _flower_center_x + 30;
	var _8_y = _flower_center_y + 40;
	var _mouse_in_8 = point_in_rectangle(
		mouse_x,
		mouse_y,
		_8_x,
		_8_y,
		_8_x + 24,
		_8_y + 36
	);
	if _mouse_in_8 
		and !self.simon_says_play_next_set
	{
		_flower_display_index = 8;
		if mouse_check_button_pressed(mb_left) {
			self.simon_says_mouse_click_audio_cooldown = 30;
			play_click_beeper_tone(_flower_display_index);
			check_click_matches_expected(_flower_display_index);
		}
	}
	
	// Now I need to track player interaction. Start by setting the sprite back to basic state.
	// 1 - 8 where 1 starts at the bottom middle and works it's way around the circle
	draw_sprite_stretched(
		spr_sunflower_simon_says,
		_flower_display_index,
		_x,
		_y,
		320,
		320
	);

}

function check_click_matches_expected (_click_index) {
	self.simon_says_player_check = _click_index;
	
	if self.first_click_cooldown {
		self.first_click_cooldown = false;
		
		var _t = 30;
		while _t > 0 {
			_t -= 1;
		}
	}	
	
	if _click_index == self.simon_says_must_match_array[self.simon_says_temp_compare] {
		
		if self.simon_says_temp_compare == self.simon_says_current_progress {
			// Exit out if the player makes it to the last simon says
			if self.simon_says_len == self.simon_says_current_progress + 1 {
				self.simon_says_player_progress += 1;
				self.simon_says_play_next_set = false;
				reset_simon_says();
				return;
			}
			
			self.simon_says_cycle_cooldown = 40;
			self.simon_says_current_progress = 0;
			self.simon_says_player_progress += 1;
			self.simon_says_play_next_set = true;
			self.simon_says_temp_compare = 0;
			self.simon_says_temp_compare_len = 1;
		}
		else {
			self.simon_says_temp_compare += 1;
			self.simon_says_temp_compare_len += 1;
		}
	}
	else {
		// Player Messed up. I need to now check how much they got right and set some indicator to help
		// visualize this. For now just kick out
		reset_simon_says();
	}
}

function reset_simon_says() {
	var _player_successfully_grew = floor(self.simon_says_player_progress);
	self.first_click_cooldown = true;
	self.simon_says_show_success_message = true;

	spawn_the_successful_grown_items(_player_successfully_grew, obj_sunflower_full);
}


function play_click_beeper_tone(_index) {
	var _snd_pitch = 0.08 + (_index / 10)
	if audio_is_playing(snd_simon_says_beep_click) {
		audio_stop_sound(snd_simon_says_beep_click);
	}
	audio_play_sound(snd_simon_says_beep_click, 0, false, obj_game_manager.vol_current, 0, _snd_pitch);
}