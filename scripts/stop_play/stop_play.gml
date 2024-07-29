// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function stop_play(sound, pitch, gain) {
	audio_stop_sound(sound);
	audio_play_sound(sound, 10, false, gain, 0, pitch);
}