/// @description 

if distance_to_object(obj_player) <= 32 {
	self.player_nearby = true;
}
else {
	self.player_nearby = false;
}


self.player_in_area = point_in_rectangle(
	obj_player.x,
	obj_player.y,
	self.bbox_left,
	self.bbox_top,
	self.bbox_right,
	self.bbox_bottom
);
show_debug_message($"Player in area: {self.player_in_area}");






