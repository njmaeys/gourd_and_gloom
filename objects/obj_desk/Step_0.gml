
// Depth sorting
if self.depth_sort {
	depth =- y;
}

// Ren the clock down on the text creation if it was just interacted with
if self.create_text_cooldown > 0 {
	self.create_text_cooldown -= 1;
}

// Check if the player is nearby so they can do something with the cauldron
if distance_to_object(obj_player) <= 16 {
	self.player_at_desk = true;
}
else {
	self.player_at_desk = false;
}


// Mouse check
self.mouse_hovering = mouse_hovering_object();
