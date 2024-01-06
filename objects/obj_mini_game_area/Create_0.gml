/// @description 


// Sizes
self.play_area_height = 500;
self.play_area_width = 300;


// Keep track of where to draw camera relative things
self.x = camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) / 2);
self.y = camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0]) / 2);

self.x = self.x - (self.play_area_width / 2);
self.y = self.y - (self.play_area_height / 2);


// Track mouse in play area
self.mouse_in_play_area = false;
self.click_cooldown = 10;

// Track starting the mini games
self.start_mini_game = false;
self.have_spawned_items = false;


// Set vars for the bounding box of the play area
self.x_left = self.x;
self.x_right = self.x + self.play_area_width;
self.y_left = self.y;
self.y_right = self.y + self.play_area_height;



// Set the known things that we can get in the garden
self.playing_mini_game = false;
self.current_mini_game = -1;
self.can_continue_mini_game = true;
self.mouse_on_grow = 0;
self.active_grow_index = -1;
self.count_grown_successful = 0;
self.things_that_can_grow = [
	{
		name: "Sunflower",
		obj: obj_sunflower_full,
		spr: spr_sunflower_full
	},
	{
		name: "Carrot",
		obj: obj_carrot_full,
		spr: spr_carrot_full
	},
]


////////////// Manage specific mini game related things //////////////
// Simon Says
self.simon_says_mouse_click_audio_cooldown = 0;
self.simon_says_len = 6; // 6 is needed as 12 seemed too tedious
self.simon_says_must_match_array = -1;
self.simon_says_current_progress = 0; // 0 - 7 Tracks how far the player has made it
self.simon_says_player_progress = 0;
self.simon_says_cycle_cooldown = 40;
self.simon_says_play_next_set = true;
self.simon_says_player_check = -1;
self.simon_says_temp_compare = 0;
self.simon_says_temp_compare_len = 1;
self.first_click_cooldown = true;
self.simon_says_loop_initialize_cooldown = 0;
self.simon_says_show_success_message = false;

// Rabbits
self.rabbits_show_success_message = false;
self.rabbits_row_count = 6;
self.rabbits_is_running = false;
self.rabbits_starting_count = 6; // Use this to decrease as the rabbits get them
self.rabbits_timer = 20;
self.rabbits_timer_interval = 60;
