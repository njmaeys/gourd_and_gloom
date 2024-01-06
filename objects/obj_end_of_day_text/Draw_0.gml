/// @description 

// Check if the end of text array is over
if self.current_text_array_val + 1 > self.end_of_day_array_len {
	// Currently the end of the day is always in the cellar so just go back there
	obj_quest_manager.end_of_day_text = -1;
	obj_quest_manager.lock_cellar_on_next_entry = false;
	
	if self.increase_day_val {
		obj_quest_manager.current_day_in_game += 1;
		self.increase_day_val = false;
	}

	warp_with_transition(rm_witch_cellar);
	return;
}


if mouse_check_button_pressed(mb_left)
	or keyboard_check_pressed(vk_space) 
{
	// Stop the player from fully skipping text
	if string_length(self.text_to_display) != t {
		// This sets the text to full and returns out so next loop into this on the next frame has full text
		t = string_length(self.text_to_display);
		return;
	}
}


if self.current_text_array_val >= 0
{
	if self.text_to_display == "" {
		self.text_to_display = obj_quest_manager.end_of_day_text[self.current_text_array_val];
	}
	
	//draw_text_one_char_at_a_time();
	if t != string_length(self.text_to_display) {
		t ++;
	}
	
	// Manage moving on to the next text block
	if t >= string_length(self.text_to_display) 
		and mouse_check_button_pressed(mb_left)
	{
		self.text_to_display = "";
		self.t = 0;
		self.current_text_array_val += 1;
	}
	
	draw_text_scribble(self.x, self.y, self.text_to_display, t);
}



