/// @description Insert description here
// You can write your code in this editor

if keyboard_check(vk_left) cx -= cs;
if keyboard_check(vk_right) cx += cs;
if keyboard_check(vk_up) cy -= cs;
if keyboard_check(vk_down) cy += cs;

if xs < 11 {
	cx = (10-xs)*(-10);
} else {
	cx = max(0,min(20*(xs-10),cx));
}

if ys < 9 {
	cy = ((8-ys)*(-10))-20;
} else {
	cy = max(-20,min((20*(ys-8))-20,cy));
}

camera_set_view_pos(view_camera[0],cx,cy);

mtx = floor(mouse_x/20)-2;
mty = floor(mouse_y/20)-2;
msx = mouse_x - cx;
msy = mouse_y - cy;

if mouse_check_button_pressed(mb_left) {
	mbheld = held_start;
	held_total = 0;
}

if mouse_check_button(mb_left) {
	if mtx > 0 && mty >= 0 && mtx < xs+1 && mty < ys && msy >= 44 {
		if etiles[mtx,mty] = 5 {
			if mty > 0 {if etiles[mtx][mty-1] = -2 etiles[mtx][mty-1] = 6}
			if mty < ys-1 {if etiles[mtx][mty+1] = -2 etiles[mtx][mty+1] = 6}
			if mtx > -1 {if etiles[mtx-1][mty] = -2 etiles[mtx-1][mty] = 6}
			if mtx < xs {if etiles[mtx+1][mty] = -2 etiles[mtx+1][mty] = 6}
		}
		etiles[mtx,mty] = sel;
		if sel = 5 {
			if mty > 0 {if etiles[mtx][mty-1] = 6 etiles[mtx][mty-1] = -2}
			if mty < ys-1 {if etiles[mtx][mty+1] = 6 etiles[mtx][mty+1] = -2}
			if mtx > -1 {if etiles[mtx-1][mty] = 6 etiles[mtx-1][mty] = -2}
			if mtx < xs {if etiles[mtx+1][mty] = 6 etiles[mtx+1][mty] = -2}
		} else if sel = 6 {
			if mty > 0 {if etiles[mtx][mty-1] = 5 etiles[mtx][mty] = -2}
			if mty < ys-1 {if etiles[mtx][mty+1] = 5 etiles[mtx][mty] = -2}
			if mtx > -1 {if etiles[mtx-1][mty] = 5 etiles[mtx][mty] = -2}
			if mtx < xs {if etiles[mtx+1][mty] = 5 etiles[mtx][mty] = -2}
		}
	} else if mbheld = 0 or mbheld = held_start {
		if mbheld = 0 {mbheld = max(2,round(hold_interval/(1 + (held_total/50))))}
		if point_in_rectangle(msx,msy,49,8,53,17) { // WIDTH DOWN
			stop_play(snd_menumove,1,1);
			xs = max(3, xs-1);
			for (var n = 0; n < ys; n += 1) {
				etiles[xs+1][n] = -1;
			}
		} else if point_in_rectangle(msx,msy,75,8,79,17) { // WIDTH UP
			stop_play(snd_menumove,1,1);
			xs = min(100, xs+1);
			for (var n = 0; n < ys; n += 1) {
				etiles[xs][n] = 4;
				etiles[xs+1][n] = -1;
			}
		} else if point_in_rectangle(msx,msy,49,29,53,38) { // HEIGHT DOWN
			stop_play(snd_menumove,1,1);
			ys = max(3, ys-1);
			for (var n = 0; n < xs+2; n += 1) {
				etiles[n][ys] = -1;
			}
			psy = min(ys-1,psy);
		} else if point_in_rectangle(msx,msy,75,29,79,38) { // HEIGHT UP
			stop_play(snd_menumove,1,1);
			ys = min(100, ys+1);
			etiles[0][ys-1] = -1;
			etiles[xs+1][ys-1] = -1;
			for (var n = 1; n < xs+1; n += 1) {
				etiles[n][ys-1] = 4;
			}
		} else if point_in_rectangle(msx,msy,110,19,114,28) { // TILE DOWN
			stop_play(snd_menumove,1,1);
			sel = (sel+19) mod 20;
		} else if point_in_rectangle(msx,msy,139,19,143,28) { // TILE UP
			stop_play(snd_menumove,1,1);
			sel = (sel+21) mod 20;
		} else if point_in_rectangle(msx,msy,156,29,160,38) { // START POS DOWN
			stop_play(snd_menumove,1,1);
			psy = max(0,psy-1);
		} else if point_in_rectangle(msx,msy,182,29,186,38) { // START POS UP
			stop_play(snd_menumove,1,1);
			psy = min(ys-1,psy+1);
		} else if point_in_rectangle(msx,msy,196,9,200,18) { // SONG DOWN
			stop_play(snd_select,1,1);
			selbgm = (selbgm+3) mod 4;
			change_song(selbgm);
		} else if point_in_rectangle(msx,msy,260,9,264,18) { // SONG UP
			stop_play(snd_select,1,1);
			selbgm = (selbgm+5) mod 4;
			change_song(selbgm);
		} else if point_in_rectangle(msx,msy,241,27,269,42) { // TEST
			stop_play(snd_select,1,1);
			instance_create_depth(0,0,0,obj_main);
		} else if point_in_rectangle(msx,msy,274,27,302,42) { // SAVE
			stop_play(snd_select,1,1);
			var file;
			file = get_save_filename("*.tpp", ".tpp");
			if (file != "")
			{
				var _level = "";
				for (var i = 1; i < xs+1; i += 1) {
					for (var k = 0; k < ys; k += 1) {
						_level = string_concat(_level, chr(etiles[i][k]+68));
					}
				}
				var _data = 
				{
					info:
					{
						type: 0,
						xs,
						ys,
						psy,
						bgm: selbgm
					},
					level: _level
				}
				var _json_string = json_stringify(_data); 
				var file2;
				file2 = file_text_open_write(file);
				file_text_write_string(file2, _json_string);
				file_text_close(file2);
				stop_play(snd_save,1,1);
			}
		} else if point_in_rectangle(msx,msy,274,6,302,20) { // EXIT
			stop_play(snd_select,1,1);
			room_goto(rm_title);
			instance_destroy();
		} else { mbheld = -1}
	}
	mbheld --;
	held_total ++;
}

if mouse_check_button_pressed(mb_right) && mtx > 0 && mty >= 0 && mtx < xs+1 && mty < ys && msy >= 44 {
	if etiles[mtx,mty] = 17 {
		etiles[mtx,mty] = 20;
		stop_play(snd_bell,1,1);
	} else if etiles[mtx,mty] = 20 {
		etiles[mtx,mty] = 17;
		stop_play(snd_bell,1,1);
	}
}