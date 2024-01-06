/// @description

// Check for the mouse on door thing
self.mouse_on_coffee_table = mouse_hovering_object();
self.player_nearby = player_in_range(48);

if self.mouse_on_coffee_table
	and mouse_check_button_pressed(mb_left) 
	and !instance_exists(obj_decoration_interaction)
	and self.player_nearby
{
	var _text = "Arcane potions and weathered parchment. \n\nYou can't quite make out the writing on the \nparchment.";
	obj_interaction_popup(_text, false, {});
}



// Depth sorting
if self.depth_sort {
	depth =- y;
}