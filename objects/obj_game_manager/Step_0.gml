/// @description 


// TODO: REMOVE
// For now give me an easy way to leave a room
if keyboard_check_pressed(ord("O")) {
	obj_room_transition.can_use = true;
}

// TODO: REMOVE
if keyboard_check_pressed(ord("N")) {
	if file_exists("savedata.sav") {
			file_delete("savedata.sav");
	}
}