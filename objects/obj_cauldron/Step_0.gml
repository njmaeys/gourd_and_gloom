/// @description 


// TODO: Make this dynamic and based on other triggers
if keyboard_check_pressed(ord("R")) {
	current_recipe = known_recipes("Basic Health Potion");
}

if self.current_recipe != -1 {
	sprite_index = spr_cauldron_fire;
}
else {
	sprite_index = spr_cauldron;
}

// Mouse check
self.mouse_hovering = mouse_hovering_object();
if self.mouse_hovering 
	and self.player_at_cauldron
	and mouse_check_button_pressed(mb_left)
	and !instance_exists(obj_dialogue_box)
{
	obj_player_inventory.inventory_open = true;
}

// If the player is in the witches room I'll allow the cauldron use
if room == rm_witches_home {
	self.player_at_cauldron = true;
}
else {
	self.player_at_cauldron = false;
}


// Depth sorting
if self.depth_sort {
	depth =- y;
}
