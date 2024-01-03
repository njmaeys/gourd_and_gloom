/// @description 

self.mouse_hovering = mouse_hovering_object();
if distance_to_object(obj_player) <= 16 {
	self.player_nearby = true;
}
else {
	self.player_nearby = false;
}

if self.can_use
	and self.player_nearby
	and mouse_check_button_pressed(mb_left) 
{
	warp_with_transition(rm_witches_home);
}



// TODO REMOVE
if keyboard_check_pressed(ord("T")) {
	self.can_use = !self.can_use;
}

