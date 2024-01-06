/// @description 

image_alpha = 0;
self.player_nearby = false;
self.player_in_area = false;


// If the player has done carrot juice for the first time then they can
// interact with this area
self.can_offer_carrot = obj_quest_manager.quest_tracker.day_two_carrot_juice.completed;
self.draw_indicator_for_player = false;