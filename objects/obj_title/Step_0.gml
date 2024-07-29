/// @description Insert description here
// You can write your code in this editor

switch menu {
    case 0: case 4: case 5: options = 5; break;
    case 1: case 2: options = 3; break;
	case 3: options = 1; break;
} 

if t mod 20 = 0 && menu != 3 {
	p1 = irandom(19);
	p2 = irandom(19);
	p3 = irandom(19);
	p4 = irandom(19);
	p5 = irandom(19);
}
t ++;

if keyboard_check_pressed(vk_down) && menu != 3 {
	selected = (selected + 1) mod options;
	stop_play(snd_menumove, 1, 1);
}
if keyboard_check_pressed(vk_up) && menu != 3 {
	selected = (selected - 1 + options) mod options;
	stop_play(snd_menumove, 1, 1);
}

if keyboard_check_pressed(ord("Z")) {
	if menu = 0 {
		stop_play(snd_select, 1, 1);
		if selected = 0 {
			menu = 1;
			selected = 0;
		} else if selected = 1 {
			menu = 2;
			selected = 0;
		} else if selected = 2 {
			menu = 3;
			selected = 0;
		} else if selected = 3 {
			menu = 4;
			selected = 0;
		} else if selected = 4 {
			game_end()
		}
	} else if menu = 1 {
		stop_play(snd_select, 1, 1);
		if selected = 0 {
			menu = 5;
			selected = 0;
		} else if selected = 1 {
			var _file = get_open_filename("*.tpp", "");
			if (_file != "") {
				var _file2 = file_text_open_read(_file);
				var data = json_parse(file_text_read_string(_file2));
				file_text_close(_file2);
				if data.info.type != 0 or data.info.xs > 100 or data.info.ys > 100 or
				data.info.ys < 1 or data.info.xs < 1 or data.info.psy < 0 or data.info.psy > data.info.ys-1 or
				data.info.bgm < 0 or data.info.bgm > 3 {
					stop_play(snd_error,1,1);
					invalid = 60;
				} else {
					room_goto(rm_main);
					instance_create_depth(0,0,0,obj_main,
					{
						xs: data.info.xs,
						ys: data.info.ys,
						psy: data.info.psy,
						bgm: data.info.bgm,
						loading: true,
						loadopt: true,
						level: data.level
					});
				}
			}
		} else if selected = 2 {
			selected = menu - 1;
			menu = 0;
		}
	} else if menu = 2 {
		stop_play(snd_select, 1, 1);
		if selected = 0 {
			room_goto(rm_editor);
			instance_create_depth(0,0,0,obj_editor);
		} else if selected = 1 {
			var _file = get_open_filename("*.tpp", "");
			if (_file != "") {
				var _file2 = file_text_open_read(_file);
				var data = json_parse(file_text_read_string(_file2));
				file_text_close(_file2);
				if data.info.type != 0 or data.info.xs > 100 or data.info.ys > 100 or
				data.info.ys < 1 or data.info.xs < 1 or data.info.psy < 0 or data.info.psy > data.info.ys-1 or
				data.info.bgm < 0 or data.info.bgm > 3 {
					stop_play(snd_error,1,1);
					invalid = 60;
				} else {
					room_goto(rm_editor);
					instance_create_depth(0,0,0,obj_editor,
					{
						xs: data.info.xs,
						ys: data.info.ys,
						psy: data.info.psy,
						selbgm: data.info.bgm,
						loading: true,
						level: data.level
					});
				}
			}
		} else if selected = 2 {
			selected = menu - 1;
			menu = 0;
		}
	} else if menu = 3 {
		stop_play(snd_select, 1, 1);
		selected = menu - 1;
		menu = 0;
	} else if menu = 4 {
		if selected = 0 {
			global.music = (global.music + 1) mod 11;
			audio_group_set_gain(ag_music,global.music/10,0);
			stop_play(snd_menumove, 1, 1);
		} else if selected = 1 {
			global.sfx = (global.sfx + 1) mod 11;
			audio_group_set_gain(ag_sfx,global.sfx/10,0);
			stop_play(snd_menumove, 1, 1);
		} else if selected = 2 {
			global.colorblind = 1 - global.colorblind;
			stop_play(snd_menumove, 1, 1);
		} else if selected = 3 {
			global.ws ++;
			window_set_size(global.ws*320, global.ws*240);
			alarm[0] = 1;
			stop_play(snd_menumove, 1, 1);
		} else if selected = 4 {
			stop_play(snd_select, 1, 1);
			selected = menu - 1;
			menu = 0;
			ini_open("config.ini");
			ini_write_real("config", "music", global.music);
			ini_write_real("config", "sfx", global.sfx);
			ini_write_real("config", "colorblind", global.colorblind);
			ini_write_real("config", "ws", global.ws);
			ini_close();
		}
	} else if menu = 5 {
		if selected = 0 { // GENERATE
			room_goto(rm_main);
			instance_create_depth(0,0,0,obj_main,
			{
				xs,
				ys
			});
		} else if selected = 1 { // X SIZE
			xs ++;
			if xs = 101 xs = 3;
			stop_play(snd_menumove, 1, 1);
		} else if selected = 2 { // Y SIZE
			ys ++;
			if ys = 101 ys = 3;
			stop_play(snd_menumove, 1, 1);
		} else if selected = 3 { // PRESETS
			global.preset ++;
			global.preset = (global.preset + 10) mod 10;
			stop_play(snd_menumove, 1, 1);
		} else if selected = 4 { // BACK
			stop_play(snd_select, 1, 1);
			selected = 0;
			menu = 1;
		}
	}
}

if menu = 3 {
	if keyboard_check_pressed(vk_left) {
		vtile --;
		if vtile < 0 vtile = 19;
		stop_play(snd_menumove, 1, 1);
	}
	if keyboard_check_pressed(vk_right) {
		vtile ++;
		if vtile > 19 vtile = 0;
		stop_play(snd_menumove, 1, 1);
	}
}

if menu = 4 {
	if keyboard_check_pressed(vk_left) {
		if selected = 0 {
			global.music = (global.music + 10) mod 11;
			audio_group_set_gain(ag_music,global.music/10,0);
		}
		if selected = 1 {
			global.sfx = (global.sfx + 10) mod 11;
			audio_group_set_gain(ag_sfx,global.sfx/10,0);
		}
		if selected = 2 {
			global.colorblind = 1 - global.colorblind;
		}
		if selected = 3 {
			if global.ws > 1 {global.ws --}
			window_set_size(global.ws*320, global.ws*240);
			alarm[0] = 1;
		}
		if selected != 4 stop_play(snd_menumove, 1, 1);
	}
	if keyboard_check_pressed(vk_right) {
		if selected = 0 {
			global.music = (global.music + 1) mod 11;
			audio_group_set_gain(ag_music,global.music/10,0);
		}
		if selected = 1 {
			global.sfx = (global.sfx + 1) mod 11;
			audio_group_set_gain(ag_sfx,global.sfx/10,0);
		}
		if selected = 2 {
			global.colorblind = 1 - global.colorblind;
		}
		if selected = 3 {
			global.ws ++;
			window_set_size(global.ws*320, global.ws*240);
			alarm[0] = 1;
		}
		if selected != 4 stop_play(snd_menumove, 1, 1);
	}
}

if menu = 5 {
	if keyboard_check_pressed(vk_left) {
		if selected = 1 {
			xs --;
			if xs = 2 xs = 100;
		}
		if selected = 2 {
			ys --;
			if ys = 2 ys = 100;
		}
		if selected = 3 {
			global.preset --;
			global.preset = (global.preset + 10) mod 10;
		}
		if selected != 4 && selected != 0 stop_play(snd_menumove, 1, 1);
	}
	if keyboard_check_pressed(vk_right) {
		if selected = 1 {
			xs ++;
			if xs = 101 xs = 3;
		}
		if selected = 2 {
			ys ++;
			if ys = 101 ys = 3;
		}
		if selected = 3 {
			global.preset ++;
			global.preset = (global.preset + 10) mod 10;
		}
		if selected != 4 && selected != 0 stop_play(snd_menumove, 1, 1);
	}
}


if keyboard_check_pressed(ord("X")) {
	if menu = 5 {
		selected = 0;
		menu = 1;
		stop_play(snd_select, 1, 1);
	} else if menu != 0 {
		selected = menu - 1;
		menu = 0;
		stop_play(snd_select, 1, 1);
	}
	if menu = 4 {
		ini_open("config.ini");
		ini_write_real("config", "music", global.music);
		ini_write_real("config", "sfx", global.sfx);
		ini_write_real("config", "colorblind", global.colorblind);
		ini_write_real("config", "ws", global.ws);
		ini_close();
	}
}

if invalid > 0 invalid --;