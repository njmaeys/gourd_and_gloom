/// @description

// Current day
self.current_day_in_game = 1;

self.quest_tracker = known_quests();

// Witch
self.last_witch_quest = "";
self.has_used_cauldron_once = true; // Initialize as true so it doesn't pop up but then set to true on first quest and then false after first quest
self.lock_cellar_on_next_entry = false;

// Garden board
self.has_check_garden_board_once = false;


// Cave entrance
self.has_checked_cave_entrance = false;
self.cave_entrance_open = false;

// Rabbit carrot offering
self.can_offer_carrot = false;
self.has_offered_carrot = false;

// Mini game area
// I want to make it so that the player can skip the mini game if they offer an aracane potion to it
self.has_completed_simon_says_once = false;
self.has_completed_rabbits_once = false;
