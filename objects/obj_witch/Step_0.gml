/// @description 


// Check if the player is nearby
self.player_nearby = player_in_range(self.look_distance);

// Set the exclaim
if self.has_new_quest {
	// NOTE: I originally had player proximity but that seems to be a bit confusing
	self.speech_bubble_state = set_indicator("exclaim");
}

// Mouse check
self.mouse_hovering = mouse_hovering_object();

// Garden specific interaction(s)
// Initially tell what the garden is
if self.run_garden_dialogue
	and path_position == 1 
	and !instance_exists(obj_dialogue_box)
	and !self.garden_dialogue_over
{
	self.current_dialogue_data = [
		"I see you found the garden board.",
		"I've enchanted the garden to grow items very \nquickly.",
		"However, it takes a bit of [c_orange]skill[/c] to successfully \ngrow things here!",
		"Each item requires a different skill set... \nGood luck"
	]
	
	if self.mouse_hovering
		and mouse_check_button_pressed(mb_left) 
	{
		create_dialogue_box(self);
	}
	
	// TODO: Deal with this. I'm running into issues where the witch shows up and then stuck
	// in the dialogue box because of variables and how I made the stuff work.
}
else { 
	if self.current_dialogue_data == -1
		and self.current_dialogue != "" 
		and !self.run_garden_dialogue
	{
		self.current_dialogue_data = dialogue_witch(self.current_dialogue);
	}
}


//show_debug_message(self.current_dialogue);

// Track anything that has to happen on path actions
if self.garden_dialogue_over 
{
	if !path_index {
		path_start(pth_witch_board_return, 2, path_action_stop, false);
		path_set_closed(pth_witch_board_interaction, true);
	}
	
	// Fade out... it's "good enough" for now
	if path_position >= 0.94 {
		self.image_alpha -= 0.1;
	}
	
	if path_position >= 0.99 {
		audio_play_sound(snd_door_open, 0, false, obj_game_manager.vol_current);
		path_set_closed(pth_witch_board_return, true);
		instance_destroy(self);
	}
}




// Depth sorting
depth =- y;


