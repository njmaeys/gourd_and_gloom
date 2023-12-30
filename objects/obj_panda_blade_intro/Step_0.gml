/// @description 

if self.intro_cooldown > 0 {
	self.intro_cooldown -= 1;
}
else {
	// Send the player to the menu after the intro
	room_goto(rm_menu);
}



