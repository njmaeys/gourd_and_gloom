function end_of_day_dialogues() {
	
	switch obj_quest_manager.current_day_in_game {
		case 1:
			// If the first day end quest has not completed then kick back out
			if !obj_quest_manager.quest_tracker.bed_day_one.completed {
				return -1;
			}
		
			return [
				"Why did I have to come back down [slant]here[/slant]?",
				"At least I've got the others down here \nto keep me company.",
			]
	}
	
	// If the switch doesn't find anything then just default to -1
	return -1;
}
