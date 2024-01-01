/// @description 

/// @description

// Check for the mouse on door thing
self.mouse_on_bookcase = mouse_hovering_object();
self.player_nearby = player_in_range(16);

if self.mouse_on_bookcase
	and mouse_check_button_pressed(mb_left) 
	and !instance_exists(obj_decoration_interaction)
	and self.player_nearby
	and !obj_desk.player_at_desk
{
	var _text = "So many books and trinkets! \n\nHow can she find anything here?";
	obj_interaction_popup(_text);
}



// Depth sorting
if self.depth_sort {
	depth =- y;
}

