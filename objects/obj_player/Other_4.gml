/// @description 


// Set the player down at the start point of the room
if room == rm_menu {
	self.x = -5000;
	self.y = -5000;
}
else {
	self.x = obj_player_spawn_points.x;
	self.y = obj_player_spawn_points.y;
}

// Find all the instances of player spawn point
var _foo = instance_number(obj_player_spawn_points);

for (var _i = 0; _i < _foo; ++_i;) {
	var _inst = instance_find(obj_player_spawn_points, _i);
	
	// Move the player to the spawn point that matches their expected dest
	if _inst.spawn_point_name == obj_player.spawn_point_name_dest {
		self.x = _inst.x;
		self.y = _inst.y;
	}
}
