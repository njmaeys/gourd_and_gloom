/// @description



// Check for the mouse on door thing
self.mouse_on_cauldron_instructions = mouse_hovering_object();
self.player_nearby = player_in_range(48);

if self.mouse_on_cauldron_instructions
	and mouse_check_button_pressed(mb_left) 
	and !instance_exists(obj_decoration_interaction)
	and self.player_nearby
{
	self.show_instructions = true;
}




