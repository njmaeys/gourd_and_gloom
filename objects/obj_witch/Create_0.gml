/// @description 

// Image scale up
image_xscale = 1.5;
image_yscale = 1.5;

// Track path things
self.run_garden_dialogue = false;
self.garden_dialogue_over = false;
if self.follow_garden_path {
	//path_start(pth_witch_board_interaction, 1, path_action_stop, false);
	path_start(pth_witch_board_interaction, 10, path_action_stop, false);
	self.run_garden_dialogue = true;
}

// Follow the path in the house
// TODO: Set up "pause_movement" objects to check for collision with thing and start a pause timer
//path_start(pth_witch, 1, path_action_restart, false);



// Go through all known quests for the Witch and set the quest to the next one that has not been completed.
// NOTE: This may bite me in the ass and require a bit more configuration. Maybe check if there is already progress ???
if obj_quest_manager.quest_tracker.introduction.completed == 0
	and obj_quest_manager.quest_tracker.introduction.started == 0
{
	// This is the default that if no progress has been made then the player is at the beginning
	self.has_new_quest = true;
	self.current_dialogue = "Introduction"
	obj_quest_manager.last_witch_quest = self.current_dialogue;
	
	// Prevent the player from leaving the witch hut until introduction completed
	obj_room_transition.can_use = false;
}
else if obj_quest_manager.quest_tracker.first_potions.completed == 0
	and obj_quest_manager.quest_tracker.first_potions.started == 0
{
	self.has_new_quest = true;
	self.current_dialogue = "First Potions"
	obj_quest_manager.last_witch_quest = self.current_dialogue;
	obj_quest_manager.quest_tracker.first_potions.started = true;
}
else {
	// Default to the last known thing for the witch
	self.current_dialogue = obj_quest_manager.last_witch_quest;
}



self.mouse_hovering = false;