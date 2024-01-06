/// @description 


// Proximity checks
self.mouse_hovering = mouse_hovering_object();
self.player_nearby = player_in_range(32);


if self.player_nearby
	and self.mouse_hovering
	and mouse_check_button_pressed(mb_left)
{
	if !self.can_use {
		// TODO: Play a chain jangle sound
		if !audio_is_playing(snd_chain_rattle) {
			audio_play_sound(snd_chain_rattle, 0, false, obj_game_manager.vol_current);
		}
		var _text = "It's locked"
		obj_interaction_popup(_text, false, {});
	}
	else {
		warp_with_transition(rm_witch_cellar);
	}
}

// TODO REMOVE
if keyboard_check_pressed(ord("T")) {
	self.can_use = !self.can_use;
}