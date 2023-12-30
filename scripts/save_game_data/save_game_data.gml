
function save_game() {
	// NOTE: I'm only going to allow one save. I don't want to have to manage many save files for now
	
	var _save_data = {};
	
	/////////// PLAYER /////////////
	_save_data.player_data = {
		room_name: room,
		pos_x: obj_player.x,
		pos_y: obj_player.y,
		recipe_quest_exit: obj_player.recipe_quest_exit,
		recipe_quest_progress: obj_player.recipe_quest_progress,
		quest_completed: obj_player.quest_completed,
		spawn_point_name_dest: obj_player.spawn_point_name_dest,
	}
	
	/////////// PLAYER INVENTORY /////////////
	_save_data.player_inventory_data = {
		inventory_recipe: obj_player_inventory.inventory_recipe,
		has_recipe_items: obj_player_inventory.has_recipe_items,
	}
	
	////////// CAULDRON /////////////
	_save_data.cauldron = {
		cur_rec: obj_cauldron.current_recipe,
		cur_rec_index: obj_cauldron.current_recipe_index,
	}
	
	////////// QUEST MANAGER /////////////
	_save_data.quest_manager = {
		current_day_in_game: obj_quest_manager.current_day_in_game,
		quest_tracker: obj_quest_manager.quest_tracker,
		last_witch_quest: obj_quest_manager.last_witch_quest,
		has_check_garden_board_once: obj_quest_manager.has_check_garden_board_once,
		has_checked_cave_entrance: obj_quest_manager.has_checked_cave_entrance,
		cave_entrance_open: obj_quest_manager.cave_entrance_open,
		has_offered_carrot: obj_quest_manager.has_offered_carrot,
		has_completed_simon_says_once: obj_quest_manager.has_completed_simon_says_once,
		has_completed_rabbits_once: obj_quest_manager.has_completed_rabbits_once,
	}
	
	////////// GAME MANAGER /////////////
	_save_data.game_manager = {
		vol_current: obj_game_manager.vol_current,
	}
	
	// Actual save
	var _filename = "savedata.sav";
	var _json = json_stringify(_save_data);
	
	// Create a buffer, write to it then delete it.
	var _buffer = buffer_create(string_byte_length(_json) + 1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _json);
	buffer_save(_buffer, _filename);
	buffer_delete(_buffer);
	
	//show_debug_message("#### Game Saved ####");
	//show_debug_message(_save_data);
	// TODO: Make a pop up that says "Game saved or some shit"
	if obj_player_inventory.show_settings {
		obj_player_inventory.show_settings = false;
	}
}

function load_game() {
	// Loading saved data
	var _filename = "savedata.sav";
	if !file_exists(_filename) {
		exit;
	}
	
	// Load the buffer, get the JSON, delete the buffer
	var _buffer = buffer_load(_filename);
	var _json = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	
	// Load the JSON string into array data
	var _load_data = json_parse(_json);
	
	//show_debug_message("#### Load Saved Data ####");
	//show_debug_message(_load_data);
	
	// Load all the objs
	var _player = _load_data.player_data;
	var _player_inventory = _load_data.player_inventory_data;
	var _cauldrdon = _load_data.cauldron;
	var _quest_manager = _load_data.quest_manager;
	var _game_manager = _load_data.game_manager;
	
	// Move to the saved room and then load all the stuff
	room_goto(_player.room_name);
	
	/////////// PLAYER ////////////////
	// This doesn't work exactly but can adjust later. I need to get the rest of the stuff saved
	obj_player.x = _player.pos_x;
	obj_player.y = _player.pos_y;
	obj_player.spawn_point_name_dest = _player.spawn_point_name_dest;
	obj_player.recipe_quest_exit = _player.recipe_quest_exit;
	obj_player.recipe_quest_progress = _player.recipe_quest_progress;
	obj_player.quest_completed = _player.quest_completed;
	
	/////////// PLAYER INVENTORY /////////////
	obj_player_inventory.inventory_recipe = _player_inventory.inventory_recipe;
	obj_player_inventory.has_recipe_items = _player_inventory.has_recipe_items;
	
	////////// CAULDRON /////////////
	obj_cauldron.current_recipe = _cauldrdon.cur_rec;
	obj_cauldron.current_recipe_index = _cauldrdon.cur_rec_index;
		
	////////// QUEST MANAGER /////////////
	obj_quest_manager.current_day_in_game = _quest_manager.current_day_in_game;
	obj_quest_manager.quest_tracker = _quest_manager.quest_tracker;
	obj_quest_manager.last_witch_quest = _quest_manager.last_witch_quest;
	obj_quest_manager.has_check_garden_board_once = _quest_manager.has_check_garden_board_once;
	obj_quest_manager.has_checked_cave_entrance = _quest_manager.has_checked_cave_entrance;
	obj_quest_manager.cave_entrance_open = _quest_manager.cave_entrance_open;
	obj_quest_manager.has_offered_carrot = _quest_manager.has_offered_carrot;
	obj_quest_manager.has_completed_simon_says_once = _quest_manager.has_completed_simon_says_once;
	obj_quest_manager.has_completed_rabbits_once = _quest_manager.has_completed_rabbits_once;
	
	////////// GAME MANAGER /////////////
	obj_game_manager.vol_current = _game_manager.vol_current;
}