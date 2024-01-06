/// @description

draw_self();



if self.show_instructions {
	// Prevent the player from moving
	obj_player.not_allowed_to_move = true;

	depth = -50000;
	draw_sprite(
		spr_cauldron_instructions_pop_up,
		0,
		instructions_x,
		instructions_y
	);
	
	// Draw the close button
	var _close_x = instructions_x + 288;
	var _close_y = instructions_y - 2;
	self.mouse_on_close = point_in_rectangle(
		mouse_x,
		mouse_y,
		_close_x,
		_close_y,
		_close_x + 16,
		_close_y + 16
	);

	var _close_spr_index = 0;
	if self.mouse_on_close {
		_close_spr_index = 1;
		if mouse_check_button_pressed(mb_left) {
			self.show_instructions = false;
			obj_player.not_allowed_to_move = false;
			self.depth = self.initial_depth;
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
}





