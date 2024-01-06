/// @description 


// Let's try and load just the witch in a sript
if room == rm_witches_home
	and !instance_exists(obj_witch)
{
	instance_create_layer(
		645,
		216,
		"Instances",
		obj_witch
	);
}



// TODO: REMOVE
// For now give me an easy way to leave a room
if keyboard_check_pressed(ord("O")) {
	obj_room_transition.can_use = true;
}

///////////////////////////////////////////////////////////
// TODO: REMOVE
// Delete save file
if keyboard_check_pressed(ord("N")) {
	if file_exists("savedata.sav") {
			file_delete("savedata.sav");
	}
}
// Add mushroom
if keyboard_check_pressed(ord("M")) {
	add_recipe_item_to_player_inventory("Red Mushroom");
}
// Add sunflower
if keyboard_check_pressed(ord("F")) {
	add_recipe_item_to_player_inventory("Sunflower");
}
// Add carrot
if keyboard_check_pressed(ord("C")) {
	add_recipe_item_to_player_inventory("Carrot");
}
// Increase the day
if keyboard_check_pressed(ord("0")) {
	obj_quest_manager.current_day_in_game += 1;
}
///////////////////////////////////////////////////////////

