/// @description 

self.mouse_hovering = mouse_hovering_object();


if self.start_running {
	self.y += self.move_speed;

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

