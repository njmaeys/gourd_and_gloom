/// @description 


draw_self();


//if (self.player_at_desk or self.mouse_hovering)
if self.player_at_desk
	and self.create_text_cooldown == 0
{
	image_index = 1;
	if self.can_play_book_sound 
		and !instance_exists(obj_decoration_interaction)
		and obj_player_inventory.inventory_open == false
		and obj_player_inventory.show_settings == false
	{
		audio_play_sound(snd_book_open, 0, false, obj_game_manager.vol_current);
		self.can_play_book_sound = false;
	}
	
	if (keyboard_check_pressed(ord(obj_game_manager.button_interact)) 
		or mouse_check_button_pressed(mb_left))
		and self.mouse_hovering
	{	
		if array_length(obj_player.recipe_quest_exit) > 0 {
			self.text_to_display = "Potions to craft:";
		}
		else {
			self.text_to_display = "There are currently no potions to craft.";
		}
		
		obj_interaction_popup(self.text_to_display);
	}

}
else {
	image_index = 0;
	self.can_play_book_sound = true;
}



