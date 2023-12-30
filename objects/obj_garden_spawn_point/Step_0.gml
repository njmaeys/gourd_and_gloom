/// @description 


// TODO: Ensure that there is a check if the spawn point has an item
// TODO: Create the garden board to choose what to grow

if self.create_new_obj
	and self.current_item_spawn != -1
{
	instance_create_layer(
		self.x + 10,
		self.y + 10,
		"Instances",
		self.current_item_spawn,
		{garden_spawn_index: self.spawn_index}
	);
	
	self.create_new_obj = false;
}