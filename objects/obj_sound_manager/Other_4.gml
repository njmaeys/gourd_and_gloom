/// @description 

// Any sounds/music that need to run for the given room can be initialized here
// But first stop all other sounds
//audio_stop_all();

// TODO: I should create a list of tracks that can loop a few times and then switch to the next song.
// Then after it hits the end of the loop it just starts back over
if room == rm_menu {
	audio_stop_all();
	
	if !audio_is_playing(snd_menu) {
		audio_play_sound(snd_menu, 0, true, obj_game_manager.vol_current);
	}
}

if room == rm_forest
	or room == rm_witches_home
	or room == rm_wtiches_garden
{
	if !audio_is_playing(snd_placeholder_track) {
		audio_play_sound(snd_placeholder_track, 0, true, obj_game_manager.vol_current);
	}
}

