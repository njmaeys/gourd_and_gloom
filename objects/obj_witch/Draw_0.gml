/// @description 

draw_self();

// Set the indicator that the NPC has something for the player
if self.speech_bubble_state >= 0 {
	draw_sprite(
		spr_npc_intention_indicator,
		self.speech_bubble_state,
		self.x,
		self.y-70
	);
}



