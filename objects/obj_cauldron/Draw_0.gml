/// @description 

self.x = self.orig_x;
self.y = self.orig_y;

if room != rm_witches_home {
	self.x = -5000;
	self.y = -5000;
}

draw_self();


// Set the indicator sprite for mouse click to show that the player needs to use the cauldron
//show_debug_message(obj_quest_manager.has_used_cauldron_once);
if !obj_quest_manager.has_used_cauldron_once {
	show_debug_message("Draw the sprite for clicker");
	draw_sprite_stretched(
		spr_mouse_indicator,
		-1,
		self.x - 10,
		self.y - 75,
		24,
		32
	);
}

