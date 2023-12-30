function mouse_size(_size) {
	switch (_size) {
		case 0:
			cursor_sprite = spr_mouse_small;
			break;
		case 1:
			cursor_sprite = spr_mouse_medium;
			break;
		case 2:
			cursor_sprite = spr_mouse_large;
			break;
	}
}


function mouse_hovering_object()
{
	var _mx = mouse_x;
	var _my = mouse_y;
	
	if point_in_rectangle(
		_mx,
		_my,
		self.bbox_left,
		self.bbox_top,
		self.bbox_right,
		self.bbox_bottom
	) {
		return true;
	}
	else {
		return false;
	}
}

function mouse_click_noise(_wait_snd_finish) {
	audio_play_sound(snd_mouse_click, 0, false, obj_game_manager.vol_current);
	if _wait_snd_finish {
		while audio_is_playing(snd_mouse_click) {
			// Do nothing, just wait for the audio to finish.
		};
	}
}