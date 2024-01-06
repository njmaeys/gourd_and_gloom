function forest_overlay(){
	if room == rm_forest {
		draw_sprite_stretched(
			spr_forest_overlay,
			0,
			0,
			0,
			10000,
			10000
		);
	}
}

function dialogue_darken(){
	draw_sprite_stretched(
		spr_dialogue_overlay,
		0,
		0,
		0,
		10000,
		10000
	);
}


function obj_interaction_popup(_text, _has_player_interaction, _player_interaction_prompts) {
	if !instance_exists(obj_decoration_interaction) {
		instance_create_depth(
			self.x, 
			self.y, 
			-30000, 
			obj_decoration_interaction
		);
		obj_decoration_interaction.text_to_display = _text;
		obj_decoration_interaction.image_xscale = 15;
		obj_decoration_interaction.image_yscale = 3.5;
		obj_decoration_interaction.has_player_interaction =  _has_player_interaction;
		obj_decoration_interaction.player_interation_prompts = _player_interaction_prompts;
	}
}

function create_the_interaction_prompts() {
	/*
	The incoming data needs to be a struct to tell the player
	what the prompt is and their options to select
	
	NOTE: I'm currently unsure what else I may need to make this interaction work
	
	{
		header: "Foobar",
		options: [
			"Yes",
			"No",
		]
	}
	*/
	
	// NOTE: Could get real fance and determine the size of this by the number of elements in the options + header...
	// only if I want to get wild tho
	
	if !obj_decoration_interaction.has_player_interaction {
		return;
	}
	
	var _x_offset = obj_decoration_interaction.x - 240;
	var _y_offset = obj_decoration_interaction.y + 56;
	var _width = 192;
	var _height = 96;
	
	draw_sprite_stretched(
		spr_inventory,
		0,
		_x_offset,
		_y_offset,
		_width,
		_height
	);
	

	// Draw the text
	var _text_x_offset = _x_offset + 5;
	var _text_y_offset = _y_offset + 5;
	var _header = obj_decoration_interaction.player_interation_prompts.header;
	var _options = obj_decoration_interaction.player_interation_prompts.options;
	
	// Header
	draw_text_scribble(_text_x_offset, _text_y_offset, _header);
	
	// Options
	var _options_y_offset = _text_y_offset + 20;
	
	for (var _i = 0; _i < array_length(_options); _i += 1) {
		var _item = _options[_i];
		draw_text_scribble(_text_x_offset, _options_y_offset, _item);
		
		_options_y_offset += 20;
	}
}