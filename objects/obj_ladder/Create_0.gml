/// @description 


self.can_use = true;
if obj_quest_manager.lock_cellar_on_next_entry {
	self.can_use = false;
}
self.mouse_hovering = false;
self.player_nearby = false;

// There is only one place the player can go to from the cellar
obj_player.spawn_point_name_dest = "witchs_house_cellar";

