/// @description 

// Keep track of where to draw camera relative things
self.instruction_x_offset = 100;
self.instruction_y_offset = 250;
self.instructions_x = camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) / 2);
self.instructions_y = camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0]) / 2);
self.instructions_x = self.instructions_x - instruction_x_offset;
self.instructions_y = self.instructions_y - instruction_y_offset;


self.mouse_on_close = false;
self.mouse_on_cauldron_instructions = false;
self.show_instructions = false;

// Feels hacky but oh well
self.initial_depth = self.depth;


