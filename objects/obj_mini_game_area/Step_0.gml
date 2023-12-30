/// @description 




// Track the mouse in the play area
self.mouse_in_play_area = point_in_rectangle(
	mouse_x,
	mouse_y,
	self.x_left,
	self.y_left,
	self.x_right,
	self.y_right
);


if self.click_cooldown > 0 {
	self.click_cooldown -= 1;
}


// Keep track of the simon says beep clicker
if self.simon_says_mouse_click_audio_cooldown > 0 {
	self.simon_says_mouse_click_audio_cooldown -= 1;
}
if self.simon_says_mouse_click_audio_cooldown == 0 {
	if audio_is_playing(snd_simon_says_beep_click) {
		audio_stop_sound(snd_simon_says_beep_click);
	}
}
