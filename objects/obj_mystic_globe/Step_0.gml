/// @description 

/// @description

// Check for the mouse on door thing
self.mouse_on_mystic_globe = mouse_hovering_object();
self.player_nearby = player_in_range(48);

if self.mouse_on_mystic_globe
	and mouse_check_button_pressed(mb_left) 
	and self.player_nearby
{
	self.image_speed = 1;
}



// Depth sorting
if self.depth_sort {
	depth =- y;
}

