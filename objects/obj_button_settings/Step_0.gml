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
		mouse_click_noise(false);
		self.show_settings = true;
		// Disable the ability to click anything else
		obj_par_button.can_click = false;
	}
}
else {
	self.image_index = 0;
}

