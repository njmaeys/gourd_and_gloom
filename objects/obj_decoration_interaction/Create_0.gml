/// @description 



// Keep track of where to draw camera relative things
self.x = camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) / 2);
self.y = camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0]) / 2);


self.draw_next_text = false;
self.draw_text_cooldown = 20;
	
self.text_to_display = "";
self.current_char_index = 0;
self.chars_to_display = 0;
self.partial_text = "";
self.display_speed = 1;
self.text_offset_x = self.x - 230;
self.text_offset_y = self.y - 50;

// Mouse check
self.mouse_on_close = 0;

function draw_text_one_char_at_a_time(_text) {
	self.text_to_display = _text;
	
	if self.draw_text_cooldown >= 0 {
		draw_text(self.text_offset_x, self.text_offset_y, self.partial_text);

		self.draw_text_cooldown -= 1;
		return;
	}
	
	self.draw_text_cooldown = 1;
	
	var _str_len = string_length(self.text_to_display);
	
	self.chars_to_display += 1;
	self.partial_text = string_copy(self.text_to_display, 1, self.chars_to_display);

	draw_text(self.text_offset_x, self.text_offset_y, self.partial_text);

}