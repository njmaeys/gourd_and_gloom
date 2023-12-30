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