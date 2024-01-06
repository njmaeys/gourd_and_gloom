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

// Check if the mouse is on the player
self.mouse_is_hovering = false;

// Move between rooms
self.spawn_point_name_dest = "witchs_house_brew"; // Original new game spot

// Really block player movement
// TODO: Make sure I start utilizing this more
self.not_allowed_to_move = false;


// Current recipe quest
self.recipe_quest_exit = [];
self.recipe_quest_progress = [];
self.quest_completed = false;

