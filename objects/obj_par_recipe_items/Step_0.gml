/// @description



// Mouse check
self.mouse_hovering = mouse_hovering_object();

// Allow clicking on a collectable item
if self.mouse_hovering 
	and mouse_check_button_pressed(mb_left) 
	and self.can_collect
	and !obj_player_inventory.inventory_open
	and !instance_exists(obj_dialogue_box)
	and !instance_exists(obj_decoration_interaction)
	and !obj_player_inventory.show_settings
{
	// Add the resource to the player inventory
	add_recipe_item_to_player_inventory(self.resource_name);

	// Destroy it
	instance_destroy(self);
}


// Depth sort
depth =- y;
