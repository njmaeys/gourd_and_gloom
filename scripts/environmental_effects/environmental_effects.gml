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


function obj_interaction_popup(_text) {
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
	}
}