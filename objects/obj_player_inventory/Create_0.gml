/// @description 

// Settings
settings_open = false;

// Inventory configs
inventory_open = false;
inventory_width = 1000;
inventory_height = 500;

ingredients_offset_x = 50;
ingredients_offset_y = 50;
ingredients_width = 300;
ingredients_height = 400;

current_recipe_offset_x = ingredients_width + 50;
current_recipe_offset_y = 50;
equipment_width = 600;
equipment_height = 400;


// Track the mouse for certain things
mouse_at_add_to_cauldron = false;

// Track mouse on settings stuff
mouse_on_close = 0;
mouse_on_fullscreen = false;
mouse_on_exit_to_menu = false;
mouse_on_exit_game = false;
mouse_on_save_game = false;

// Set and later track viewport stuff
camera_x = 0;
camera_y = 0;

// Set the starting recipe items
// This will be a limited amount of things for fetch quests and other
inventory_recipe = recipe_items();
inventory_recipe_count_min = 0;
inventory_recipe_count_max = 15;
has_recipe_items = false;
potion_just_completed = -1;
potion_complete_cooldown = 0;

// Draw the settings
self.show_settings = false;

// TODO: Remove
self.temp_game_end = false;