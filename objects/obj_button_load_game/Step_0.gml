/// @description 

// Just exit out if the button is not allowed to click
if !self.can_click {
	return;
}

// Mouse check
self.mouse_hovering = mouse_hovering_object();

if self.mouse_hovering {
	self.image_index = 1;
	
	if mouse_check_button_pressed(mb_left) {
		load_game();
	}
}
else {
	self.image_index = 0;
}

