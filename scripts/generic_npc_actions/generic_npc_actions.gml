
function reset_dialogue(_obj_npc){
	_obj_npc.current_dialogue = "";
	_obj_npc.current_dialogue_array_val = -1;
	_obj_npc.current_dialogue_data = -1;
}


function player_has_needed_item(_item_name) {
	// _item is just the string name ie; Carrot
	
	var _has_item = false;
	for (var _i = 0; _i < array_length(obj_player_inventory.inventory_recipe); _i += 1) {
		var _hi = obj_player_inventory.inventory_recipe[_i]
		
		if _hi.rec_name == _item_name and _hi.cur_count > 0 {
			_has_item = true;
		}
	}
	
	return _has_item;
}