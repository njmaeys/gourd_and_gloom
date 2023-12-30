/// @description

// Keep track of where to draw camera relative things
self.camera_x = view_xview[0] + view_wview[0] / 2;
self.camera_y = view_yview[0] + view_hview[0] / 2;


// Potion complete animation
if self.potion_complete_cooldown > 0 {
	self.potion_complete_cooldown -= 1;
}


if keyboard_check_pressed(vk_tab) 
	and !instance_exists(obj_dialogue_box)
	and !instance_exists(obj_decoration_interaction)
{
	self.inventory_open = !self.inventory_open;
}

if (keyboard_check_pressed(vk_escape) 
	or (self.mouse_on_close == 1 and mouse_check_button_pressed(mb_left)))
	and self.inventory_open == true
	and self.potion_complete_cooldown == 0
{
	mouse_click_noise(false);
	self.inventory_open = false;
}

if keyboard_check_pressed(vk_escape) 
	and self.potion_complete_cooldown == 0
{
	self.show_settings = !self.show_settings;
}


// Add items to the cauldron 
if self.mouse_at_add_to_cauldron
	and obj_cauldron.player_at_cauldron
	and obj_cauldron.current_recipe != -1
	and mouse_check_button_pressed(mb_left) 
	and self.potion_complete_cooldown == 0
	and self.mouse_at_add_to_cauldron
{
	var _r = obj_cauldron.current_recipe.recipe_requirements;
	for (var _i = 0; _i < array_length(_r); _i += 1) {
		var _nm = _r[_i].item_name;
		add_item_to_cauldron(_nm);
	}
}