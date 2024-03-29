/// @description 

var _mouse_x_ui = device_mouse_x_to_gui(0);
var _mouse_y_ui = device_mouse_y_to_gui(0);



// Initial size of inventory
if self.inventory_open {
	draw_sprite_stretched(
		spr_inventory,
		0,
		self.camera_x,
		self.camera_y,
		self.inventory_width,
		self.inventory_height
	);
	
	// Ingredients section
	draw_sprite_stretched(
		spr_inventory,
		0,
		self.camera_x + self.ingredients_offset_x,
		self.camera_y + self.ingredients_offset_y,
		self.ingredients_width,
		self.ingredients_height
	);
	
	draw_text_color(
		self.camera_x + self.ingredients_offset_x + 10,
		self.camera_y + self.ingredients_offset_y + 10,
		"Recipe Ingredients",
		c_white,
		c_white,
		c_white,
		c_white,
		1
	);
	
	// Draw the recipe data
	var _r_y = self.camera_y + self.ingredients_offset_y + 60;
	for (var _i = 0; _i < array_length(self.inventory_recipe); _i += 1)
	{
		var _item = self.inventory_recipe[_i]
		
		// Set the name of the ingredient
	    draw_text(
			self.camera_x + self.ingredients_offset_x + 10, 
			_r_y,
			$"{_item.rec_name} - {_item.cur_count}"	
		);
		
		// Draw the sprites and add btns
		var _r_x = self.camera_x + self.ingredients_offset_x + 25;
		
		var _btn_x = _r_x + 210;
		var _btn_y = _r_y + 20;
		var _mouse_on_add_btn = point_in_rectangle(
			_mouse_x_ui,
			_mouse_y_ui,
			_btn_x,
			_btn_y,
			_btn_x + 40,
			_btn_y + 24
		);
		
		var _btn_spr_index = 0;
		if room == rm_witches_home // Ensure player can ONLY add in the hut
			and _mouse_on_add_btn 
			and _item.cur_count > 0
		{
			_btn_spr_index = 1;
			if mouse_check_button_pressed(mb_left) {
				add_item_to_cauldron(_item.rec_name);
			}
		}
		
		draw_sprite_stretched(
			spr_add_to_cauldron,
			_btn_spr_index,
			_btn_x,
			_btn_y,
			40,
			24
		);
		
		// Divider
		draw_sprite_stretched(
			spr_hover_box,
			0,
			_r_x-15,
			_r_y+57,
			280,
			1
		);
		
		for (var _a = 0; _a < _item.cur_count; _a += 1) {
			draw_sprite(
				_item.rec_spr,
				0,
				_r_x,
				_r_y+50
			);
			
			_r_x += 15;
		}

		_r_y += 70;
	}
	
	// Player cauldron stuff
	draw_sprite_stretched(
		spr_inventory,
		0,
		self.camera_x + self.current_recipe_offset_x,
		self.camera_y + self.current_recipe_offset_y,
		self.equipment_width,
		self.equipment_height
	);
	
	if self.potion_complete_cooldown == 0 {
		self.potion_just_completed = -1;
		
		var _cauldron_header = "There is no recipe active.";
		if obj_cauldron.current_recipe != -1 {
			_cauldron_header = "The recipe needs ingredients:";
			draw_text_color(
				self.camera_x + self.current_recipe_offset_x + 10,
				self.camera_y + self.current_recipe_offset_y + 40,
				obj_cauldron.current_recipe.recipe_name,
				c_red,
				c_red,
				c_red,
				c_red,
				1
			);
		}
		draw_text_color(
			self.camera_x + self.current_recipe_offset_x + 10,
			self.camera_y + self.current_recipe_offset_y + 10,
			_cauldron_header,
			c_white,
			c_white,
			c_white,
			c_white,
			1
		);

		if room == rm_witches_home {
			// Draw the cauldron
			draw_sprite_stretched(
				spr_cauldron,
				0,
				self.camera_x + self.current_recipe_offset_x + 150,
				self.camera_y + self.current_recipe_offset_y + 130,
				300,
				250
			);
		}
	
		// Draw the needed items of the cauldron
		if obj_cauldron.current_recipe != -1 {
			var _it_offset_x = self.camera_x + self.current_recipe_offset_x + 30;
			var _it_offset_y = self.camera_y + self.current_recipe_offset_y + 120;
			for (var _i = 0; _i < array_length(obj_cauldron.current_recipe.recipe_requirements); _i += 1) {
				var _it = obj_cauldron.current_recipe.recipe_requirements[_i]
		
				draw_sprite(
					_it.item_spr,
					0,
					_it_offset_x,
					_it_offset_y-10
				);
		
				draw_text_color(
					_it_offset_x+20,
					_it_offset_y-25,
					$"{_it.current}/{_it.needed}",
					c_white,
					c_white,
					c_white,
					c_white,
					1
				);
		
				_it_offset_x += 75;
			}
		}
	}
	else {
		// Draw the potion complete animation stuffs
		var _msg = scribble($"Potion completed!");
		var _msg_spr = self.potion_just_completed.potion_spr;
		var _msg_x = self.camera_x + self.current_recipe_offset_x + 130;
		if !potion_completed_successfully {
			_msg = scribble($"[c_red]Potion failed![/c]");
			_msg_spr = spr_potion_failure;
			_msg_x = _msg_x + 50;
		}
		_msg.scale(2);
		
		_msg.draw(
			_msg_x, 
			self.camera_y + self.current_recipe_offset_y + 40
		);
		
		draw_sprite_stretched(
			_msg_spr,
			0,
			self.camera_x + self.current_recipe_offset_x + 180,
			self.camera_y + self.current_recipe_offset_y + 110,
			64*4,
			64*4
		);
	}
	
	// Draw the close button
	var _close_x = self.camera_x + 980;
	var _close_y = self.camera_y - 10
	self.mouse_on_close = point_in_rectangle(
		_mouse_x_ui,
		_mouse_y_ui,
		_close_x,
		_close_y,
		_close_x + 32,
		_close_y + 32
	);

	var _close_spr_index = 0;
	if self.mouse_on_close 
		and self.potion_complete_cooldown == 0
	{
		_close_spr_index = 1;
	}
	draw_sprite_stretched(
		spr_close,
		_close_spr_index,
		_close_x,
		_close_y,
		32,
		32
	);
}


if self.show_settings {
	// If we are in the menu then just kick out
	if room == rm_menu {
		instance_destroy(self);
	}
	
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

if self.temp_game_end {
	self.inventory_open = false;
	draw_temp_game_end(
		1000,
		500,
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

