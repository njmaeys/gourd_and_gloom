/// @description 

// Just exit out if the button is not allowed to click
if !self.can_click {
	return;
}

// Mouse check
self.mouse_hovering = mouse_hovering_object();

// TODO: Implement the hover and mouse click action when ready
if self.mouse_hovering {
	self.image_index = 1;
	
	if mouse_check_button_pressed(mb_left) {
		// End the game
		game_end();
	}
}
else {
	self.image_index = 0;
}

