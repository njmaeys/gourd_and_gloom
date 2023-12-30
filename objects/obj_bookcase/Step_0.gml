/// @description 

/// @description

// Check for the mouse on door thing
self.mouse_on_bookcase = mouse_hovering_object();
self.player_nearby = player_in_range(16);

if self.mouse_on_bookcase
	and mouse_check_button_pressed(mb_left) 
	and !instance_exists(obj_decoration_interaction)
	and self.player_nearby
{
	var _text = "So many books and trinkets! \n\nHow can she find anything here?";
	
	instance_create_depth(
		self.x, 
		self.y, 
		-30000, 
		obj_decoration_interaction
	);
	obj_decoration_interaction.text_to_display = _text;
	obj_decoration_interaction.image_xscale = 15;
	obj_decoration_interaction.image_yscale = 3.5;
}



// Depth sorting
if self.depth_sort {
	depth =- y;
}

