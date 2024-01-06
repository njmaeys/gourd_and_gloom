/// @description Insert description here
// You can write your code in this editor


draw_self();

if self.draw_indicator_for_player 
	and self.player_in_area
{
	show_debug_message("Player could leave carrot");
	// Give the prompt for the player to leave a carrot
	depth = -50000;
	draw_sprite(
		spr_npc_intention_indicator,
		1,
		obj_player.x,
		obj_player.y - 60
	);
}




