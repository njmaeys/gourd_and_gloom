/// @description 

draw_self();


draw_text_scribble(self.text_offset_x, self.text_offset_y, self.text_to_display);

var _item_x = self.x - 210;
var _item_y = self.y - 20;

// Only show the potions if the player is in the witches hut where the desk is
if room == rm_witches_home 
	and obj_desk.player_at_desk
{
	for (var _i = 0; _i < array_length(obj_player.recipe_quest_progress); _i += 1) {
		var _item = obj_player.recipe_quest_progress[_i];
	
		var _pot_image_index = 0;
		// If it's the active potion make it highlighted
		if _i == obj_cauldron.current_recipe_index {
			_pot_image_index = 1;
		}
	
		// If the potion is completed grey it out and green border
		if obj_player.recipe_quest_progress[_i].potion_count > 0 {
			_pot_image_index = 2;
		}
	
		draw_sprite(
			_item.potion_spr,
			_pot_image_index,
			_item_x-20,
			_item_y
		);
	
		_item_x += 64;
	}
}

// Draw the close button
var _close_x = self.x + 230;
var _close_y = self.y - 64
self.mouse_on_close = point_in_rectangle(
	mouse_x,
	mouse_y,
	_close_x,
	_close_y,
	_close_x + 16,
	_close_y + 16
);

var _close_spr_index = 0;
if self.mouse_on_close {
	_close_spr_index = 1;
}
draw_sprite(
	spr_close,
	_close_spr_index,
	_close_x,
	_close_y
);
	
