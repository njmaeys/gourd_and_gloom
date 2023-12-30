/// @description

image_alpha = 0;

// Check if player is in the garden area
self.player_in_garden = false;

// TODO: Need to have a persisten tracker... maybe in the game manager
// I'm going to have the garden hold at most 6 things
self.current_garden = [
	{
		item_to_spawn: 0,
		garden_spawn_instance: -1,
	},
	{
		item_to_spawn: 0,
		garden_spawn_instance: -1,
	},
	{
		item_to_spawn: 0,
		garden_spawn_instance: -1,
	},
	{
		item_to_spawn: 0,
		garden_spawn_instance: -1,
	},
	{
		item_to_spawn: 0,
		garden_spawn_instance: -1,
	},
	{
		item_to_spawn: 0,
		garden_spawn_instance: -1,
	},
]

// Find all the garden spawn points so I can set them in the garden
self.last_spawned_index = -1;

