/// @description 

image_xscale = 0.75;
image_yscale = 0.75;


// Track anything for the actual game
randomize();
self.move_speed = random_range(0.3, 0.9); // Let each rabbit start out slightly different
self.game_start_x = self.x;
self.game_start_y = self.y;
self.knock_back_distance = 50;
self.start_running = false;
self.speed_multiplier = 1.1; // Tweak this and use it to increase the rabbit speed


