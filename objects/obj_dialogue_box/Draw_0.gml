/// @description 


// Create the effect to darken the screen a bit
dialogue_darken();


draw_self();

// Try and set any quest specific things
quest_operations(self.current_npc_interacting_with.current_dialogue);

// Set the dialogue box 
var _len_current_dialogue = array_length(self.current_npc_interacting_with.current_dialogue_data) - 1; // -1 because 0 index


if keyboard_check_pressed(ord(obj_game_manager.button_interact)) 
	or mouse_check_button_pressed(mb_left)
	or keyboard_check_pressed(vk_space)
{
	// Stop the player from fully skipping text
	if string_length(self.text_to_display) != t {
		// This sets the text to full and returns out so next loop into this on the next frame has full text
		t = string_length(self.text_to_display);
		return;
	}
	
	
	if self.current_npc_interacting_with.current_dialogue_array_val < _len_current_dialogue {
		self.current_npc_interacting_with.current_dialogue_array_val += 1;
		self.text_to_display = "";
		self.current_char_index = 0;
		self.chars_to_display = 0;
		self.partial_text = "";
		self.t = 0;
	}
	else {
		// NOTE: This is less than ideal and should probably move to a function
		// I have certain interactions that just need to set other variables
		if self.current_npc_interacting_with.object_index == obj_witch {
			if self.current_npc_interacting_with.run_garden_dialogue {
				self.current_npc_interacting_with.garden_dialogue_over = true;
				obj_witch.has_new_quest = false;
				obj_quest_manager.has_check_garden_board_once = true;
			}
		}
		
		// If there is no more dialoge then destroy the instance of the dialogue box
		instance_destroy(self);
		// Reset the NPC dialogue defaults at this point. External triggers should set the new stuff
		self.current_npc_interacting_with.current_dialogue_array_val = -1;
		self.current_npc_interacting_with.current_dialogue_data = -1;
		self.current_npc_interacting_with.has_new_quest = false;
		self.current_npc_interacting_with.speech_bubble_state = -1;
	}

}

// Draw the indicator to move on
if t == string_length(self.text_to_display) 
{
	draw_sprite_stretched(
		spr_text_complete,
		-1,
		self.x + 210,
		self.y + 25,
		16,
		16
	);
}

if self.current_npc_interacting_with.current_dialogue_array_val >= 0
{
	if self.text_to_display == "" {
		self.text_to_display = self.current_npc_interacting_with.current_dialogue_data[self.current_npc_interacting_with.current_dialogue_array_val];
	}
	
	//draw_text_one_char_at_a_time();
	if t != string_length(self.text_to_display) {
		t ++;
	}
	draw_text_scribble(self.text_offset_x, self.text_offset_y, self.text_to_display, t);
}







