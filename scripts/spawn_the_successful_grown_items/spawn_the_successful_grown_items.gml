
function spawn_the_successful_grown_items(_num_to_grow, _obj_to_grow) {	
	///////// Clean up any sounds from mini games ///////////
	// Simon says
	audio_stop_sound(snd_simon_says_beep);
	audio_stop_sound(snd_simon_says_beep_click);
	
	// Rabbits
	// TODO: ...
	////////////////////////////////////////////////////////
	
	// If the spawned stuff has already happened then just exit out
	if self.have_spawned_items {
		return;
	}
	
	// Based on the outcome of the mini game this grows the obj and number successfully grown
	for (var _sc = 0; _sc < _num_to_grow; ++_sc;) {
		grow_successful_plants(_obj_to_grow);
	}
	
	// Ensure that the mini game knows it's done
	self.have_spawned_items = true;
}