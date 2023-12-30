/// @description

// Ensure that the garden index is reset if it was made in the garden
if self.garden_spawn_index != -1 {
	obj_garden_area.current_garden[self.garden_spawn_index].item_to_spawn = 0;
	obj_garden_area.current_garden[self.garden_spawn_index].garden_spawn_instance.create_new_obj = true;
	obj_garden_area.current_garden[self.garden_spawn_index].garden_spawn_instance.current_item_spawn = -1;
}

audio_play_sound(snd_break_resource, 0, false, obj_game_manager.vol_current);