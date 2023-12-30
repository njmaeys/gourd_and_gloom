/// @description

//////////// I DONT KOOW WHY BUT THIS MAKES THE MOUSE DISSAPEAK IN GAME ?????/////////
var _mouse_x_ui = device_mouse_x_to_gui(0);
var _mouse_y_ui = device_mouse_y_to_gui(0);

if self.show_settings {
	draw_settings_menu(
		1000,
		550,
		0,
		0,
		980,
		10,
		32,
		32,
		_mouse_x_ui,
		_mouse_y_ui
	);
}

