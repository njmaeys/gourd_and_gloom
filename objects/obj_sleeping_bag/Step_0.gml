/// @description 

self.mouse_on_sleeping_bag = mouse_hovering_object();
self.player_nearby = player_in_range(48);


if self.mouse_on_sleeping_bag
	and mouse_check_button_pressed(mb_left) 
	and !instance_exists(obj_decoration_interaction)
	and self.player_nearby
{
	// Check if there is end of day text to use
	if obj_quest_manager.end_of_day_text == -1 {
		var _text = "I don't need to sleep just yet.";
		obj_interaction_popup(_text);
	}
	else {
		warp_with_transition(rm_end_of_day);
	}
}




