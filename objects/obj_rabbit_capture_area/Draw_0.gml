/// @description Insert description here
// You can write your code in this editor


draw_self();

if self.draw_indicator_for_player 
	and self.player_in_area
{
	// Give the prompt for the player to leave a carrot
	depth = -50000;
	draw_sprite(
		spr_npc_intention_indicator,
		1,
		obj_player.x,
		obj_player.y - 60
	);
	
	if obj_player.mouse_is_hovering
		and mouse_check_button(mb_left) 
		and !instance_exists(obj_decoration_interaction)
	{
		// TODO: Make sure to create the ability for interactive prompts
		var _text = "Maybe if I leave a [c_orange]carrot[/c] they would stay";
		var _player_interaction_prompt = {
			header: "Leave a carrot?",
			options: [
				"Yes",
				"No",
			]
		}
		obj_interaction_popup(_text, true, _player_interaction_prompt);
	}
}




