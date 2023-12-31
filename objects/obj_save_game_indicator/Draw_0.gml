/// @description


// Keep track of where to draw camera relative things
self.camera_x = camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) - 80);
self.camera_y = camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0]) - 80);

draw_self();

draw_sprite(
	spr_save_indicator,
	-1,
	self.camera_x,
	self.camera_y
);


