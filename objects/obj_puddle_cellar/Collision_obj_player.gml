/// @description 

// Animate the water when the player walks across
self.can_animate = true;

if self.can_animate 
	and (obj_player.vx != 0 or obj_player.vy != 0)
{
	self.image_speed = 1;
}

