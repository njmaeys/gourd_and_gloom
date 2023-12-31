/// @description 


// Make the rabbits run away if the player has not offered them a carrot
if !obj_quest_manager.has_offered_carrot 
	and obj_rabbit_capture_area.player_nearby
{
	// TODO: I need a run away mechanic timer once they are there eating
	image_xscale = -0.75;
	sprite_index = spr_rabbit;
	move_towards_point(
		obj_rabbit_run_away_location.x,
		obj_rabbit_run_away_location.y,
		2
	);
}
else {
	// Keep the rabbits in the expected area and move them around
	if self.move_cooldown <= 0 {
		self.move_cooldown = 300;
		
		
		var _xm = irandom_range(-1,1);
		var _ym = irandom_range(-1,1);
		while _xm == 0 {
			_xm = irandom_range(-1,1);
		}

	
		if !self.is_hopping {
			_xm += self.x + (_xm * 8);
			_ym += self.y + (_ym * 8);
			
			self.move_to_x = _xm;
			self.move_to_y = _ym;
			sprite_index = spr_rabbit;
			if self.move_to_x > self.x {
				image_xscale = -0.75;
			}
			else {
				image_xscale = 0.75;
			}
			
			move_towards_point(
				_xm,
				_ym,
				1
			);
			
			self.is_hopping = true;
		}
	}
	else {
		self.move_cooldown -= irandom(5);
		
		var _distance = point_distance(
			self.x,
			self.y,
			self.move_to_x,
			self.move_to_y
		);

		if _distance <= 1 {
			speed = 0;
			self.is_hopping = false;
		}
	}
}





// Depth sorting
depth =- y;

