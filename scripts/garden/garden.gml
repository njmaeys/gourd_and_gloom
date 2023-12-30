
function grow_successful_plants(_obj_to_grow) {
	for (var _i = 0; _i < array_length(obj_garden_area.current_garden); ++_i;) {
		var _item = obj_garden_area.current_garden[_i];
			
		if _item.garden_spawn_instance != -1 
			and _item.item_to_spawn == 0
		{
			obj_garden_area.current_garden[_i].item_to_spawn = _obj_to_grow;
			obj_garden_area.current_garden[_i].garden_spawn_instance.current_item_spawn = _obj_to_grow;
			break;
		}
	}
}