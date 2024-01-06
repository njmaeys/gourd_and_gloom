/// @description 


// Check for the mouse
self.mouse_on_pumpkin = mouse_hovering_object();
self.player_nearby = player_in_range(48);

if self.mouse_on_pumpkin
	and mouse_check_button_pressed(mb_left) 
	and !instance_exists(obj_decoration_interaction)
	and self.player_nearby
{
	var _text = "Hmmm these look a bit like I do. \n\nWhat are they? \n\nAre they me?";
	obj_interaction_popup(_text);
}



// Depth sorting
depth =- y;


