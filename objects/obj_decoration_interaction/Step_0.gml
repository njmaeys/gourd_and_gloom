/// @description

if self.mouse_on_close == 1 {
	if mouse_check_button_pressed(mb_left) {
		obj_par_environment.create_text_cooldown = 2;
		mouse_click_noise(false);
		instance_destroy(self);
	}
}

if keyboard_check_pressed(vk_escape) {
	instance_destroy(self);
}

