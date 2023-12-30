/// @description 

// Only if the resource is ready to be collected
if self.can_collect 
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

