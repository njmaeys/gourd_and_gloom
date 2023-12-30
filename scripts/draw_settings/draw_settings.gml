function draw_settings_menu(_width, _height, _cam_x_offset, _cam_y_offset, _close_x_set_offset, _close_y_set_offset, _close_x_offset, _close_y_offset, _mouse_x, _mouse_y) {
	// Keep track of where to draw camera relative things
	var _camera_x = (view_xview[0] + view_wview[0] / 2) - _cam_x_offset;
	var _camera_y = (view_yview[0] + view_hview[0] / 2) - _cam_y_offset;

	// Initial size of inventory
	draw_sprite_stretched(
		spr_inventory,
		0,
		_camera_x,
		_camera_y,
		_width,
		_height
	);
	
	// Draw the close button
	var _close_x = _camera_x + _close_x_set_offset;
	var _close_y = _camera_y - _close_y_set_offset;
	self.mouse_on_close = point_in_rectangle(
		_mouse_x,
		_mouse_y,
		_close_x,
		_close_y,
		_close_x + _close_x_offset,
		_close_y + _close_y_offset
	);

	var _close_spr_index = 0;
	if self.mouse_on_close {
		_close_spr_index = 1;
	}
	draw_sprite_stretched(
		spr_close,
		_close_spr_index,
		_close_x,
		_close_y,
		_close_x_offset,
		_close_y_offset
	);
	
	if self.mouse_on_close
		and mouse_check_button_pressed(mb_left) 
	{	
		mouse_click_noise(false);
		
		// Reset the ability to click the buttons
		if instance_exists(obj_par_button) {
			obj_par_button.can_click = true;
		}

		self.show_settings = false;
	}
	
	// Draw the fullscreen
	var _fulllscreen_index = 0;
	var _fulllscreen_x = _camera_x + 30;
	var _fulllscreen_y = _camera_y + 10;

	self.mouse_on_fullscreen = point_in_rectangle(
		_mouse_x,
		_mouse_y,
		_fulllscreen_x,
		_fulllscreen_y,
		_fulllscreen_x + 256,
		_fulllscreen_y + 64
	);
	draw_sprite_stretched(
		spr_fullscreen,
		obj_game_manager.full_screen,
		_fulllscreen_x,
		_fulllscreen_y,
		256,
		64
	);
	
	// Draw the volume level
	var _volume_scale_x = _camera_x + 60;
	var _volume_scale_y = _camera_y + 110;

	draw_sprite_stretched(
		spr_volume,
		obj_game_manager.vol_current,
		_volume_scale_x,
		_volume_scale_y,
		64,
		400
	);
	
	// Draw the volume controll buttons
	var _volume_control_spr_index = 0;
	var _volume_control_x = _camera_x + 60;
	var _volume_contron_y = _camera_y + 60;

	var _mouse_on_vol_up = point_in_rectangle(
		_mouse_x,
		_mouse_y,
		_volume_control_x + 24,
		_volume_contron_y + 24,
		_volume_control_x + 24 + 32,
		_volume_contron_y + 24 + 32
	);
	
	var _mouse_on_vol_down = point_in_rectangle(
		_mouse_x,
		_mouse_y,
		_volume_control_x + 24,
		_volume_contron_y + 434,
		_volume_control_x + 24 + 32,
		_volume_contron_y + 434 + 32
	);
	
	if _mouse_on_vol_up {
		_volume_control_spr_index = 1;
		if mouse_check_button_pressed(mb_left) 
			and obj_game_manager.vol_current < obj_game_manager.vol_max
		{
			obj_game_manager.vol_current += 1;
			mouse_click_noise(false);
		}
	}
	
	if _mouse_on_vol_down {
		_volume_control_spr_index = 2;
		if mouse_check_button_pressed(mb_left) 
			and obj_game_manager.vol_current > obj_game_manager.vol_min 
		{
			obj_game_manager.vol_current -= 1;
			mouse_click_noise(false);
		}
	}
	// Set and manage the actual game volume
	// NOTE: I would much pref to have audio groups but some reason not working
	var _game_vol_scale = 1 + (obj_game_manager.vol_current / 10)
	if obj_game_manager.vol_current == 0 {
		_game_vol_scale = 0;
	}
	audio_group_set_gain(audiogroup_default, _game_vol_scale, 0);
	
	draw_sprite_stretched(
		spr_volume_controll_buttons,
		_volume_control_spr_index,
		_volume_control_x,
		_volume_contron_y,
		64,
		500
	);
	
	// Manage toggling the full screen
	if self.mouse_on_fullscreen 
		and mouse_check_button_pressed(mb_left)
	{
		mouse_click_noise(false);
		obj_game_manager.full_screen = !obj_game_manager.full_screen;
		window_set_fullscreen(obj_game_manager.full_screen);
	}
	
	// Draw save game button
	var _save_game_index = 0;
	var _save_game_x = _camera_x + 400;
	var _save_game_y = _camera_y + 100;
	
	self.mouse_on_save_game = point_in_rectangle(
		_mouse_x,
		_mouse_y,
		_save_game_x,
		_save_game_y,
		_save_game_x + 128,
		_save_game_y + 64
	);
	
	if self.mouse_on_save_game {
		// _save_game_index = 1; // TODO: Remove when save game is working
		if mouse_check_button_pressed(mb_left) {
			// TODO: Save the game 
		}
	}
	
	draw_sprite_stretched(
		spr_menu_save_game,
		_save_game_index,
		_save_game_x,
		_save_game_y,
		128,
		64
	);
	
	// Draw the exit to menu button
	var _exit_to_menu_index = 0;
	var _exit_to_menu_x = _camera_x + 400;
	var _exit_to_menu_y = _camera_y + 200;
	
	self.mouse_on_exit_to_menu = point_in_rectangle(
		_mouse_x,
		_mouse_y,
		_exit_to_menu_x,
		_exit_to_menu_y,
		_exit_to_menu_x + 128,
		_exit_to_menu_y + 64
	);
	
	if self.mouse_on_exit_to_menu {
		_exit_to_menu_index = 1;
		if mouse_check_button_pressed(mb_left) {
			// Remove the player if it exists
			mouse_click_noise(true);
			if instance_exists(obj_player) {
				instance_destroy(obj_player);
			}
			
			room_goto(rm_menu);
			self.show_settings = false;
		}
	}
	
	draw_sprite_stretched(
		spr_menu_exit_to_menu,
		_exit_to_menu_index,
		_exit_to_menu_x,
		_exit_to_menu_y,
		128,
		64
	);
	
	// Draw the exit game button
	var _exit_game_index = 0;
	var _exit_game_x = _camera_x + 400;
	var _exit_game_y = _camera_y + 300;
	
	self.mouse_on_exit_game = point_in_rectangle(
		_mouse_x,
		_mouse_y,
		_exit_game_x,
		_exit_game_y,
		_exit_game_x + 128,
		_exit_game_y + 64
	);
	
	if self.mouse_on_exit_game {
		_exit_game_index = 1;
		if mouse_check_button_pressed(mb_left) {
			// End the game
			mouse_click_noise(true);
			game_end();
		}
	}
	
	draw_sprite_stretched(
		spr_menu_exit_game,
		_exit_game_index,
		_exit_game_x,
		_exit_game_y,
		128,
		64
	);
	
	// Draw the movement and control info
	var _movement_x = _camera_x + 650;
	var _movement_y = _camera_y + 10;
	draw_sprite_stretched(
		spr_movement,
		0,
		_movement_x,
		_movement_y,
		256,
		512
	);
}



/*
TODO:
	- Draw the rest of the stuff
		- Exit to menu
		- Exit game in normal menu
		- Volume
*/

function draw_temp_game_end(_width, _height, _cam_x_offset, _cam_y_offset, _close_x_set_offset, _close_y_set_offset, _close_x_offset, _close_y_offset, _mouse_x, _mouse_y) {
	// Keep track of where to draw camera relative things
	var _camera_x = (view_xview[0] + view_wview[0] / 2) - _cam_x_offset;
	var _camera_y = (view_yview[0] + view_hview[0] / 2) - _cam_y_offset;

	// Initial size of inventory
	draw_sprite_stretched(
		spr_inventory,
		0,
		_camera_x,
		_camera_y,
		_width,
		_height
	);
	
	// Draw the close button
	var _close_x = _camera_x + _close_x_set_offset;
	var _close_y = _camera_y - _close_y_set_offset;
	self.mouse_on_close = point_in_rectangle(
		_mouse_x,
		_mouse_y,
		_close_x,
		_close_y,
		_close_x + _close_x_offset,
		_close_y + _close_y_offset
	);

	var _close_spr_index = 0;
	if self.mouse_on_close {
		_close_spr_index = 1;
	}
	draw_sprite_stretched(
		spr_close,
		_close_spr_index,
		_close_x,
		_close_y,
		_close_x_offset,
		_close_y_offset
	);
	
	// Draw the temp thank you message
	draw_text_transformed_color(
		_camera_x + 300,
		_camera_y + 50,
		"That's all for now. \nThanks for playing!",
		2,
		2,
		0,
		c_white,
		c_white,
		c_white,
		c_white,
		1
	);
	draw_sprite_stretched(
		spr_basic_health_potion,
		0,
		_camera_x + 320,
		_camera_y + 150,
		64*5,
		64*5
	);
	
	if self.mouse_on_close
		and mouse_check_button_pressed(mb_left) 
	{		
		// Reset the ability to click the buttons
		mouse_click_noise(false);
		if instance_exists(obj_par_button) {
			obj_par_button.can_click = true;
		}

		self.temp_game_end = false;
	}
}