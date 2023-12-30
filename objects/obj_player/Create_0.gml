/// @description 

// Vars
walk_speed = 3;
vx = 0;
vy = 0;
dir = 3; // Used to control player facing direction 0:r 1:u 2:l 3:d
move_right = 0;
move_left = 0;
move_up = 0;
move_down = 0;


// Move between rooms
self.spawn_point_name_dest = "witchs_house_brew"; // Original new game spot


// Current recipe quest
self.recipe_quest_exit = [];
self.recipe_quest_progress = [];
self.quest_completed = false;

