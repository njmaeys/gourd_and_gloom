/// @description 

if self.intro_cooldown <= 30 
	and !instance_exists(obj_warp)
	and (mouse_check_button_pressed(mb_left) or keyboard_check_pressed(vk_space))
{
	instance_create_depth(
		0,
		0,
		-60000,
		obj_warp,
		{room_to_warp_to: self.room_name}
	);
}

if self.intro_cooldown > 0 {
	self.intro_cooldown -= 1;
}




