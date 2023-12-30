function set_indicator(_interaction_state) {
	/*
	0: Exclaim
	1: Question
	2: Elipse
	*/
	switch (_interaction_state) {
		case "exclaim":
			return 0;
		case "question":
			return 1;
		case "elipse":
			return 2;
	}
}


function player_in_range(_look_distance) {
	// Check if the player is within a given range of the obj
	if distance_to_object(obj_player) <= _look_distance {
		return true;
	}
	
	// Default to false if not within range
	return false
}

function create_dialogue_box(_npc) {
	var _set_depth = -30000;
	instance_create_depth(_npc.x, _npc.y, _set_depth, obj_dialogue_box);
	obj_dialogue_box.image_xscale = 15;
	obj_dialogue_box.image_yscale = 3;
	obj_dialogue_box.current_npc_interacting_with = _npc;
}