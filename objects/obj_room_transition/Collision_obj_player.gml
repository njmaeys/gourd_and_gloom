/// @description Send the player to the next room

if mouse_check_button_pressed(mb_left)
	and instance_exists(obj_exterior_door)
	and obj_exterior_door.mouse_on_door
	and !obj_player_inventory.inventory_open
	and !obj_player_inventory.show_settings
{
	self.can_use = true;
}


if can_use {
	if self.play_door_sound
	{
		 self.play_door_sound = false;
		 audio_play_sound(snd_door_open, 0, false, obj_game_manager.vol_current);
	}
	
	instance_create_depth(
		0,
		0,
		-60000,
		obj_warp,
		{room_to_warp_to: self.room_name}
	);
}


obj_player.spawn_point_name_dest = self.spawn_point_to_go_to;