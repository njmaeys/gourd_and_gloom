function player_walk(_vx, _vy) {
	data = {
		spr_index: 0,
		dir: 0,
	}
	// right
	if (_vx > 0) {
		data.spr_index = spr_pumpkin_player_walk_right;
		data.dir = 0;
	}
	
	// left
	if (_vx < 0) {
		data.spr_index =  spr_pumpkin_player_walk_left;
		data.dir = 2;
	}
	
	// down
	if (_vy > 0) {
		data.spr_index = spr_pumpkin_player_walk_down;
		data.dir = 3;
	}
	
	// up
	if (_vy < 0) {
		data.spr_index = spr_pumpkin_player_walk_up;
		data.dir = 1;
	}
	
	return data;
}


function set_idle(_dir) {
	switch _dir {
		// right
		case 0:
			return spr_pumpkin_player_idle_right;
		// up
		case 1:
			return spr_pumpkin_player_idle_up;
		// left
		case 2:
			return spr_pumpkin_player_idle_left;
		// down
		case 3:
			return spr_pumpkin_player_idle_down;
	}
}


function warp_player(_room) {
	room_goto(_room);
}
