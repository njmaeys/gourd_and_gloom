/// @description 


// Check if the mouse is hovering the player
self.mouse_is_hovering = point_in_rectangle(
	mouse_x,
	mouse_y,
	self.x - 32,
	self.y - 32,
	self.x + 64,
	self.y
);


// Check keys for movement
move_left = keyboard_check(ord("A"));
move_right = keyboard_check(ord("D"));
move_up = keyboard_check(ord("W")) * -1; // -1 otherwise inverted
move_down = keyboard_check(ord("S")) * -1; // -1 otherwise inverted

// Calc movement
if obj_player_inventory.inventory_open 
	or instance_exists(obj_dialogue_box) // Prevent player from moving when in dialogue
	or obj_player_inventory.show_settings // If settings are open don't move around
	or instance_exists(obj_mini_game_area) // If player is doing a garden mini game (or other) stop movement
	or room == rm_menu // No moving in the menu
	or room == rm_end_of_day // No moving in the end of day
	or self.not_allowed_to_move // Generic bool to stop player movement
{
	vx = 0;
	vy = 0;
}
else {
	vx = ((move_right - move_left) * walk_speed);
	vy = ((move_up - move_down) * walk_speed);
}


if (vx == 0 && vy == 0) {
	sprite_index = set_idle(dir);
	
	// Stop the walking sound... Also probably needs to just be in a function
	if audio_is_playing(snd_walking_default) {
		audio_stop_sound(snd_walking_default);
	}
}

// If moving
if (vx != 0 || vy != 0) {	
	// Walking sound probably needs to go to a function to handle diff terrain
	if !audio_is_playing(snd_walking_default) {
		audio_play_sound(snd_walking_default, 0, true, obj_game_manager.vol_current, 0, 0.85);
	}
	
	// Remove any popups that they player was interacting with
	if instance_exists(obj_decoration_interaction) {
		instance_destroy(obj_decoration_interaction);
	}
	
	// Handle collision for movement
	var _spr_x_increase = 10
	if vx < 0 {
		_spr_x_increase = _spr_x_increase * -1;
	}
	
	// Move player around but check for collisions with things in the world
	if !collision_point(x+vx+_spr_x_increase, y, obj_barrier_standard, true, true) 
		and !collision_point(x+vx+_spr_x_increase, y, obj_par_environment, true, true)
	{
		x += vx;
	}
	if !collision_point(x, y+vy, obj_barrier_standard, true, true) 
		and !collision_point(x, y+vy, obj_par_environment, true, true) 
	{
		y += vy;
	}
	
	// Change sprite based on direction
	var _move_data = player_walk(vx, vy);
	sprite_index = _move_data.spr_index;
	dir = _move_data.dir;
}


// Look for a nearby NPC that has dialogue
if distance_to_object(obj_par_npc) <= 30 
	and obj_par_npc.current_dialogue_data != -1 
{
	if keyboard_check_pressed(ord(obj_game_manager.button_interact)) 
		or mouse_check_button_pressed(mb_left)
	{
		// Player is interacting with an NPC that has dialogue for them
		if !instance_exists(obj_dialogue_box) 
			and obj_par_npc.mouse_hovering // Make sure the player is trying to interact with the NPC
		{
			create_dialogue_box(obj_par_npc);
		}
	}
}



// TODO: I think I should try to make an early quest where the player has to go off to bed as a recurring thing that they cannot go outside until eventually they can break the cycle
if instance_exists(obj_par_npc)
{
	quest_finished(self.recipe_quest_progress, self.recipe_quest_exit, obj_par_npc.current_dialogue);
}

// Depth sorting
depth =- y;


