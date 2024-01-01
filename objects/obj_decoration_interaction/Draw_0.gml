/// @description 

draw_self();


draw_text_scribble(self.text_offset_x, self.text_offset_y, self.text_to_display);

var _item_x = self.x - 230;
var _item_y = self.y - 20;

// Only show the potions if the player is in the witches hut where the desk is
if room == rm_witches_home 
	and obj_desk.player_at_desk
	// TODO: This causes an issue with my new bookcase placement
{
	for (var _i = 0; _i < array_length(obj_player.recipe_quest_progress); _i += 1) {
		var _item = obj_player.recipe_quest_progress[_i];
	
		var _pot_image_index = 0;
		// If it's the active potion make it highlighted
		if _i == obj_cauldron.current_recipe_index {
			_pot_image_index = 1;
		}
	
		// If the potion is completed grey it out
		if obj_player.recipe_quest_progress[_i].potion_count > 0 {
			_pot_image_index = 2;
		}
	
		//_item_x = _item_x;
		draw_sprite(
			_item.potion_spr,
			_pot_image_index,
			_item_x,
			_item_y
		);
		
		// Look for the mouse and do something if it's there
		var _mouse_on_potion = point_in_rectangle(
			mouse_x,
			mouse_y,
			_item_x,
			_item_y,
			_item_x + 64,
			_item_y + 64
		);
		
		if _mouse_on_potion {
			draw_sprite_stretched(
				spr_hover_box,
				0,
				_item_x - 16,
				_item_y + 64,
				96,
				32
			);
			
			var _text = _item.potion_name;
			var _scrib_obj = scribble($"[c_black]{_text}[/c]");
			_scrib_obj.wrap(96);
			_scrib_obj.align(fa_left);
			_scrib_obj.scale(0.75);
			_scrib_obj.draw(_item_x - 12, _item_y + 64);
		}
	
		_item_x += 72;
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
	
