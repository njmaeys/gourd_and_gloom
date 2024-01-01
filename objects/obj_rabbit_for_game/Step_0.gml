/// @description 

self.mouse_hovering = mouse_hovering_object();


if self.start_running {
	// Using the speed multiplier here to offset how fast they were moving.
	self.y += self.move_speed * self.speed_multiplier;

}

if self.mouse_hovering 
	and self.start_running
	and mouse_check_button_pressed(mb_left)
{
	self.y -= self.knock_back_distance;
	if self.y < self.game_start_y {
		self.y = self.game_start_y;
	}
}

