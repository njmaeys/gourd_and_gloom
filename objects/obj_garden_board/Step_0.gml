
// Depth sorting
if self.depth_sort {
	depth =- y;
}


// Check if the player is nearby so they can do something with the cauldron
if distance_to_object(obj_player) <= 24 {
	self.player_at_garden_board = true;
}
else {
	self.player_at_garden_board = false;
}


// Mouse check
var _board_x = self.x - 50
var _board_y = self.y - 100
self.mouse_hovering = point_in_rectangle(
	mouse_x,
	mouse_y,
	_board_x,
	_board_y,
	_board_x + 100,
	_board_y + 100
);


// Create the stuff in the garden
if self.player_at_garden_board 
	and self.mouse_hovering
{
	if (keyboard_check_pressed(ord(obj_game_manager.button_interact)) 
		or mouse_check_button_pressed(mb_left))
		and !instance_exists(obj_mini_game_area)
	{	
		// If first time playe ris interacting with board then spawn the witch to talk
		// Otherwise open up the mini game stuff
		if !obj_quest_manager.has_check_garden_board_once 
			and !instance_exists(obj_witch)
		{
			instance_create_layer(
				path_get_point_x(pth_witch_board_interaction, 0),
				path_get_point_y(pth_witch_board_interaction, 0),
				"Instances",
				obj_witch,
				{
					follow_garden_path: true,
					has_new_quest: true,
				}
			);
			
			audio_play_sound(snd_door_open, 0, false, obj_game_manager.vol_current);
		}
		else {
			if !instance_exists(obj_dialogue_box) 
				and obj_quest_manager.has_check_garden_board_once
			{
				instance_create_depth(
					0,
					0,
					-50000,
					obj_mini_game_area
				);
			}
		}
	}

}