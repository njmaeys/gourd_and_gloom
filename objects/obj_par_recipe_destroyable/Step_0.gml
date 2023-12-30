/// @description

// Mouse check
self.mouse_hovering = mouse_hovering_object();

// Check if the player is nearby so they can do something
if distance_to_object(obj_player) <= 64 {
	self.player_is_nearby = true;
}
else {
	self.player_is_nearby = false;
}


// Destroy the instance and create a new collectable one
if self.mouse_hovering 
	and mouse_check_button_pressed(mb_left) 
	and self.player_is_nearby
{
	if self.garden_spawn_index != -1 {
		obj_garden_area.current_garden[self.garden_spawn_index].item_to_spawn = 0;
	}
	
	// Create the collectable
	instance_create_layer(
		self.x,
		self.y,
		"Instances",
		self.obj_to_spawn,
		{can_collect: true}
	);
	
	instance_destroy(self);
}



// Depth sort
depth =- y;
