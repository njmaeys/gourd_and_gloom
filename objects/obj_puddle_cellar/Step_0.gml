/// @description Insert description here
// You can write your code in this editor


// Check for the mouse
self.mouse_on_puddle = mouse_hovering_object();
self.player_nearby = player_in_range(48);

if self.mouse_on_puddle
	and mouse_check_button_pressed(mb_left) 
	and !instance_exists(obj_decoration_interaction)
	and self.player_nearby
{
	// TODO: Figure out over time how this changes as the pumpkins decay
	var _text = "**You see your reflection** \n\nI sure do look a lot like those [c_orange]other things[/c]!";
	obj_interaction_popup(_text, false, {});
}





