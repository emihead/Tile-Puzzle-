/// @description Insert description here
// You can write your code in this editor

function change_song(song) {
	audio_group_stop_all(ag_music);
	switch (song) {
		case 0:
		audio_play_sound(mus_puzzle1,10,true);
		bgmtitle = "PUZZLE 1";
		bgmauthor = "EMIHEAD";
		break;
		case 1:
		audio_play_sound(mus_puzzle2,10,true);
		bgmtitle = "PUZZLE 2";
		bgmauthor = "EMIHEAD";
		break;
		case 2:
		audio_play_sound(mus_nhh,10,true);
		bgmtitle = "PUZZLE 3";
		bgmauthor = "EMIHEAD";
		break;
		case 3:
		audio_play_sound(mus_menu,10,true);
		bgmtitle = "MENU";
		bgmauthor = "EMIHEAD";
		break;
	}
}

if loading {
	change_song(selbgm);
	for (var i = 0; i < xs+1; i += 1) {
		for (var k = 0; k < ys; k += 1) {
			etiles[i+1][k] = ord(string_char_at(level, (i*ys)+k+1))-68;
		}
	}
} else {
	xs = 10;
	ys = 8;
	psy = round(ys/2);
	selbgm = 0;
	change_song(0);
	for (var i = 1; i < xs+1; i += 1) {
		for (var k = 0; k < ys; k += 1) {
			etiles[i][k] = 4;
		}
	}
}

cx = 0;
cy = -20;
cs = 5;
sel = 0;
mtx = 0;
mty = 0;
msx = 0;
msy = 0;
held_start = 20;
mbheld = held_start;
held_total = 0;
hold_interval = 8;

for (var n = 0; n < ys; n += 1) {
	etiles[0][n] = -1;
	etiles[xs+1][n] = -1;
}

t = 0;