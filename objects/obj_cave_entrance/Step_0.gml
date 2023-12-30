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