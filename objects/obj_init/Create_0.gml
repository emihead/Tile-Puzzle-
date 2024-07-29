/// @description Insert description here
// You can write your code in this editor

randomize();

ini_open("config.ini");
global.music = ini_read_real("config", "music", 10);
global.sfx = ini_read_real("config", "sfx", 10);
global.colorblind = ini_read_real("config", "colorblind", 0);
global.ws = ini_read_real("config", "ws", -1);
ini_close();

audio_group_load(ag_music);
audio_group_load(ag_sfx);
audio_group_set_gain(ag_music,global.music/10,0);
audio_group_set_gain(ag_sfx,global.sfx/10,0);

if global.ws = -1 {
	global.ws = 1;
	dh = display_get_height() * 0.75;
	while (1+global.ws) * 240 < dh { global.ws ++ }
	ini_open("config.ini");
	ini_write_real("config", "music", global.music);
	ini_write_real("config", "sfx", global.sfx);
	ini_write_real("config", "colorblind", global.colorblind);
	ini_write_real("config", "ws", global.ws);
	ini_close();
}

global.fnt_screena = font_add_sprite_ext(bmf_a, "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.!?,'-\"/:; ", true, 1);
global.fnt_screenb = font_add_sprite_ext(bmf_b, "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.!?,'-\"/:; ", true, 1);
global.fnt_numbers = font_add_sprite_ext(bmf_numbers, "0123456789", false, 1);

window_set_size(global.ws*320, global.ws*240);
alarm[0] = 1;
