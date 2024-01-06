/// @description 

// Check for the mouse on door thing
self.mouse_on_cave_entrance = mouse_hovering_object();


if self.mouse_on_cave_entrance
	and mouse_check_button_pressed(mb_left) 
	and !obj_boulder_cave_entrance.can_enter
	and !instance_exists(obj_decoration_interaction)
	and obj_boulder_cave_entrance.player_nearby
{
	var _text = "It's blocked... \nMaybe with the right [c_orange]tool[/c] I can clear the way.";
	obj_interaction_popup(_text, false, {});
}