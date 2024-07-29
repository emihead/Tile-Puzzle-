/// @description Insert description here
// 40u can write 40ur code in this editor

cpresent = false;
showhp = false;
if instance_exists(obj_editor) {
	editing = true;
	xs = obj_editor.xs;
	ys = obj_editor.ys;
	
	tiles = obj_editor.etiles;
	
	for (var l = 1; l < xs+1; l += 1) {
		for (var m = 0; m < ys; m += 1) {
			if tiles[l][m] = 17 or tiles[l][m] = 20 cpresent = true;
			if tiles[l][m] = 2 or tiles[l][m] = 9 or tiles[l][m] = 10 or tiles[l][m] = 11 or tiles[l][m] = 12 or tiles[l][m] = 15 showhp = true;
		}
	}
	
	psy = obj_editor.psy;
	
	instance_deactivate_object(obj_editor);
} else {
	editing = false;
	if loading {
		audio_group_stop_all(ag_music);
		switch (bgm) {
			case 0:
			audio_play_sound(mus_puzzle1,10,true);
			break;
			case 1:
			audio_play_sound(mus_puzzle2,10,true);
			break;
			case 2:
			audio_play_sound(mus_nhh,10,true);
			break;
			case 3:
			audio_play_sound(mus_menu,10,true);
			break;
		}
		for (var i = 0; i < xs+1; i += 1) {
			for (var k = 0; k < ys; k += 1) {
				tiles[i+1][k] = ord(string_char_at(level, (i*ys)+k+1))-68;
				if tiles[i+1][k] = 17 or tiles[i+1][k] = 20 cpresent = true;
				if tiles[i+1][k] = 2 or tiles[i+1][k] = 9 or tiles[i+1][k] = 10 or tiles[i+1][k] = 11 or tiles[i+1][k] = 12 or tiles[i+1][k] = 15 showhp = true;
			}
		}
	} else {
		var _preset = global.preset;
		for (var i = 1; i < xs+1; i += 1) {
			for (var k = 0; k < ys; k += 1) {
// 0 red 1 orange 2 green 3 purple 4 pink 5 yellow 6 blue 7 brown 8 plaid 9 white 10 black
// 11 grey 12 d green 13 crimson 14 magenta 15 beige 16 indigo 17/20 cyan 18 lavender 19 polka
				switch (_preset) {
					case 0: default: // DEFAULT
					tiles[i][k] = weighted_choose([0,4],[1,2],[2,2],[3,2],[4,3],[5,2],[6,4],[7,2],[8,1],
					[9,2],[10,1],[11,2],[12,2],[13,1],[14,1],[15,1],[16,1],[17,1],[18,1],[19,1],[20,1]);
					break;
					case 1: // LOTS OF BOMBS
					tiles[i][k] = weighted_choose([0,4],[1,2],[2,2],[3,2],[4,3],[5,2],[6,4],[7,2],[8,1],
					[9,2],[10,1],[11,2*4],[12,2*4],[13,1*4],[14,1*4],[15,1],[16,1],[17,1],[18,1],[19,1],[20,1]);
					break;
					case 2: // SWAMP
					tiles[i][k] = weighted_choose([0,4],[1,2],[2,2],[3,2],[4,3],[5,2],[6,4*4],[7,2*4],[8,1],
					[9,2],[10,1],[11,2],[12,2],[13,1],[14,1],[15,1],[16,1],[17,1],[18,1],[19,1],[20,1]);
					break;
					case 3: // DAMAGE CONTROL
					tiles[i][k] = weighted_choose([0,4],[1,2],[2,2*4],[3,2],[4,3],[5,2],[6,4],[7,2],[8,1],
					[9,2*2],[10,1*2],[11,2*4],[12,2*4],[13,1*4],[14,1],[15,1*4],[16,1],[17,1],[18,1],[19,1],[20,1]);
					break;
					case 4: // ALL BAD
					tiles[i][k] = weighted_choose([0,4],[1,2],[2,2],[3,2],[5,2],[6,4],
					[10,1],[11,2],[12,2],[13,1],[14,1],[15,1],[16,1],[17,1],[20,1]);
					break;
					case 5: // ALL GOOD
					tiles[i][k] = weighted_choose([1,2],[4,3],[7,2],[8,1],[9,2],[18,1],[19,1]);
					break;
					case 6: // FLAVORTOWN
					tiles[i][k] = weighted_choose([0,4],[1,2*4],[2,2],[3,2*4],[4,3],[5,2],[6,4*2],[7,2*4],[8,1],
					[9,2],[10,1],[11,2],[12,2],[13,1],[14,1],[15,1*2],[16,1],[17,1],[18,1],[19,1],[20,1]);
					break;
					case 7: // WARM COLORS
					tiles[i][k] = weighted_choose([0,4],[1,2],[4,3],[5,2],[7,2],[8,1],
					[9,2],[11,2],[13,1],[14,1],[15,1],[19,1]);
					break;
					case 8: // COOL COLORS
					tiles[i][k] = weighted_choose([2,2],[3,2],[6,4],
					[10,1],[12,2],[16,1],[17,1],[18,1],[20,1]);
					break;
					case 9: // VANILLA MODE
					tiles[i][k] = weighted_choose([0,4],[1,2],[2,2],[3,2],[4,3],[5,2],[6,4]);
					break;
				}
				if tiles[i][k] = 17 or tiles[i][k] = 20 cpresent = true;
				if tiles[i][k] = 2 or tiles[i][k] = 9 or tiles[i][k] = 10 or tiles[i][k] = 11 or tiles[i][k] = 12 or tiles[i][k] = 15 showhp = true;
			}
		}

		for (var l = 1; l < xs+1; l += 1) {
			for (var m = 0; m < ys; m += 1) {
				if tiles[l][m] = 6 {
					if l > 1 {if tiles[l-1][m] = 5 {tiles[l][m] = -2}}
					if m > 0 {if tiles[l][m-1] = 5 {tiles[l][m] = -2}}
					if l < xs {if tiles[l+1][m] = 5 {tiles[l][m] = -2}}
					if m < ys-1 {if tiles[l][m+1] = 5 {tiles[l][m] = -2}}
				}
			}
		}
		psy = round(ys/2);
		
		level = "";
		for (var i = 1; i < xs+1; i += 1) {
			for (var k = 0; k < ys; k += 1) {
				level = string_concat(level, chr(tiles[i][k]+68));
			}
		}
		bgm = irandom(2);
		audio_group_stop_all(ag_music);
		switch (bgm) {
			case 0:
			audio_play_sound(mus_puzzle1,10,true);
			break;
			case 1:
			audio_play_sound(mus_puzzle2,10,true);
			break;
			case 2:
			audio_play_sound(mus_nhh,10,true);
			break;
			case 3:
			audio_play_sound(mus_menu,10,true);
			break;
		}
	}
	
	for (var n = 0; n < ys; n += 1) {
		tiles[0][n] = -1;
		tiles[xs+1][n] = -1;
	}
}

if global.preset = 9 vanillamode = true;
if vanillamode showhp = false;

ptx = 0;
pty = psy;

t = 0;

alarm[1] = 1;

flavor = 0;
hp = 3;
dir = 0;
stype = 0;
plaid = 0;
ctimer = 5;
darkness = 0;
bx = 0;
by = 0;
looking = false;
cx = 0;
cy = -20;
cs = 5;
ctx = 0;
cty = 0;
msx = 0;
msy = 0;
_a = false;
turns = 0;
hudlerp1 = 0;
hudlerp2 = 0;
hudlerp3 = 0;
if cpresent {hudlerp4 = 100} else {hudlerp4 = 0}
lerpspd = 4;
menu = false;
dead = false;
opt = 0;
optct = 3;
shocks = 0;
turnsbroken = false;
_confetti = -1;

function tile_meet() {
	if tiles[ptx][pty] = 1 { 
		flavor = 1;
		stop_play(snd_bell, 1, 1);
		instance_create_depth(40+(ptx*20),40+(pty*20),depth-1,obj_tileflash);
		with obj_soul {light = 10}
	}
	if tiles[ptx][pty] = 3 { 
		flavor = 2;
		stop_play(snd_bell, 1, 1);
		instance_create_depth(40+(ptx*20),40+(pty*20),depth-1,obj_tileflash);
		with obj_soul {light = 10}
	}
	if tiles[ptx][pty] = 7 { 
		flavor = 3;
		stop_play(snd_splat, 1, 1);
		instance_create_depth(40+(ptx*20),40+(pty*20),depth-1,obj_tileflash);
		with obj_soul {light = 10}
	}
	if tiles[ptx][pty] = 2 && plaid = 0 && !vanillamode {
		stop_play(snd_b, 1, 1);
		instance_create_depth(40+(ptx*20),40+(pty*20),depth-1,obj_tileflash);
		switch (irandom(3)) {
			case 0: instance_create_depth(cx+irandom(320),cy-16,0,obj_bullet) break;
			case 1: instance_create_depth(cx+irandom(320),cy+256,0,obj_bullet) break;
			case 2: instance_create_depth(cx-16,cy+irandom(240),0,obj_bullet) break;
			case 3: instance_create_depth(cx+336,cy+irandom(240),0,obj_bullet) break;
		}
	}
	if tiles[ptx][pty] = 8 {
		plaid = 5;
		stop_play(snd_bell, 1, 1);
		instance_create_depth(40+(ptx*20),40+(pty*20),depth-1,obj_tileflash);
		with obj_soul {light = 10}
	}
	if tiles[ptx][pty] = 9 {
		if flavor = 3 {
			stop_play(snd_splat, 1, 1);
		} else {
			hp = min(3, hp + 1);
			stop_play(snd_power, 0.9, 1);
			var inst = instance_create_depth(40+(ptx*20)+10,40+(pty*20)+10,-150,obj_damagenumber);
			with inst {
				val = 1;
				col = c_lime;
			}
			with obj_soul {light = 10}
		}
		tiles[ptx][pty] = 4;
		instance_create_depth(40+(ptx*20),40+(pty*20),depth-1,obj_tileflash);
	}
	if tiles[ptx][pty] = 10 {
		hp = 3 - hp;
		stop_play(snd_weirdeffect, 1.2, 0.75);
		instance_create_depth(40+(ptx*20),40+(pty*20),depth-1,obj_tileflash);
	}
	if tiles[ptx][pty] = 11 {
		var inst = instance_create_depth(40+(ptx*20),40+(pty*20),depth-1,obj_bomb);
		with inst {
			tx = other.ptx;
			ty = other.pty;
		}
		tiles[ptx][pty] = 4;
	}
	if tiles[ptx][pty] = 12 {
		damage(2);
		instance_create_depth(40+(ptx*20),40+(pty*20),depth-1,obj_tileflash);
		var inst = instance_create_depth(40+(ptx*20)+10,40+(pty*20)+10,-100,obj_explosion);
		with inst {image_xscale = 0.5; image_yscale = 0.5;}
		stop_play(snd_badexplosion, 1.5, 0.5);
		react_explosion(ptx, pty, 0);
		tiles[ptx][pty] = 4;
	}
	if tiles[ptx][pty] = 16 {
		darkness = 5;
		stop_play(snd_bell, 1, 1);
		instance_create_depth(40+(ptx*20),40+(pty*20),depth-1,obj_tileflash);
		with obj_soul {light = 10}
	}
	if tiles[ptx][pty] = 19 && plaid = 0 {
		var foundself = false;
		var done = false;
		repeat(2) {
			for (var m = 0; m < ys; m += 1) {
				for (var l = 1; l < xs+1; l += 1) {
					if tiles[l][m] = 19 {
						if foundself {
							if l = ptx && m = pty break;
							instance_create_depth(40+(ptx*20),40+(pty*20),depth-1,obj_tileflash);
							instance_create_depth(40+(l*20),40+(m*20),depth-1,obj_tileflash);
							with obj_soul {
								light = 10;
								x = 40+(other.ptx*20);
								y = 40+(other.pty*20);
							}
							instance_create_depth(40+(lerp(ptx,l,0.25)*20),40+(lerp(pty,m,0.25)*20),depth-1,obj_soulfade,{fade: 2});
							instance_create_depth(40+(lerp(ptx,l,0.5)*20),40+(lerp(pty,m,0.5)*20),depth-1,obj_soulfade,{fade: 4});
							instance_create_depth(40+(lerp(ptx,l,0.75)*20),40+(lerp(pty,m,0.75)*20),depth-1,obj_soulfade,{fade: 6});
							ptx = l;
							pty = m;
							done = true;
							stop_play(snd_magicsprinkle, 1, 1);
							break;
						}
						if l = ptx && m = pty { foundself = true }
					}
				}
				if done break;
			}
			if done break;
		}
	}
}

function elec_removal(_tx, _ty) {
	if _ty > 0 {if tiles[_tx][_ty-1] = -2 tiles[_tx][_ty-1] = 6}
	if _ty < ys-1 {if tiles[_tx][_ty+1] = -2 tiles[_tx][_ty+1] = 6}
	if _tx > -1 {if tiles[_tx-1][_ty] = -2 tiles[_tx-1][_ty] = 6}
	if _tx < xs {if tiles[_tx+1][_ty] = -2 tiles[_tx+1][_ty] = 6}
}

function tile_passable(tile) {
	if tile = 0 or tile = 14 or tile = 17 { return false }
	else { return true }
}

function tile_passable2(tile) {
	if tile = 0 or tile = 14 or tile = 17 or tile = 5 or tile = -2 or (tile = 6 && flavor = 1 && plaid < 2) { return false }
	else { return true }
}

function slide(dir) {
	var _a = 0;
	if dir = 0 {
		while tiles[ptx][pty] = 3 && pty > 0 && tile_passable(tiles[ptx][pty-1]) && flavor != 3 {
			if _a = 0 stop_play(snd_bell, 1, 1);
			instance_create_depth(40+(ptx*20),40+(pty*20),depth-1,obj_tileflash);
			_a ++;
			with obj_soul {light = 10}
			pty --;
			flavor = 2;
		}
	} else if dir = 1 {
		while tiles[ptx][pty] = 3 && ptx < xs+1 && tile_passable(tiles[ptx+1][pty]) && flavor != 3 {
			if _a = 0 stop_play(snd_bell, 1, 1);
			instance_create_depth(40+(ptx*20),40+(pty*20),depth-1,obj_tileflash);
			_a ++;
			with obj_soul {light = 10}
			ptx ++;
			flavor = 2;
		}
	} else if dir = 2 {
		while tiles[ptx][pty] = 3 && pty < ys-1 && tile_passable(tiles[ptx][pty+1]) && flavor != 3 {
			if _a = 0 stop_play(snd_bell, 1, 1);
			instance_create_depth(40+(ptx*20),40+(pty*20),depth-1,obj_tileflash);
			_a ++;
			with obj_soul {light = 10}
			pty ++;
			flavor = 2;
		}
	} else {
		while tiles[ptx][pty] = 3 && ptx > 0 && tile_passable(tiles[ptx-1][pty]) && flavor != 3 {
			if _a = 0 stop_play(snd_bell, 1, 1);
			instance_create_depth(40+(ptx*20),40+(pty*20),depth-1,obj_tileflash);
			_a ++;
			with obj_soul {light = 10}
			ptx --;
			flavor = 2;
		}
	}
}

function gametick() {
	shocks = 0;
	turns ++;
	plaid = max(0, plaid - 1);
	darkness = max(0, darkness - 1);
	ctimer --;
	if ctimer = 0 {
		for (var l = 1; l < xs+1; l += 1) {
			for (var m = 0; m < ys; m += 1) {
				if tiles[l][m] = 17 {
					tiles[l][m] = 20;
					instance_create_depth(40+(l*20),40+(m*20),depth-1,obj_tileflash);
				} else if tiles[l][m] = 20 {
					tiles[l][m] = 17;
					instance_create_depth(40+(l*20),40+(m*20),depth-1,obj_tileflash);
				}
			}
		}
		ctimer = 5;
		if cpresent stop_play(snd_bell, 1, 1);
	}
	with obj_bomb {tick()}
	tile_meet();
}

function react_explosion(_x, _y, size) {
	for (var l = _x-1-size; l < _x+2+size; l += 1) {
		if l > -1 && l < xs {
			for (var m = _y-1-size; m < _y+2+size; m += 1) {
				if m > -1 && m < ys {
					if tiles[l][m] = 14 {
						instance_create_depth(40+(l*20),40+(m*20),depth-1,obj_tileflash);
						tiles[l][m] = 4;
					} else if tiles[l][m] = 13 {
						bx = l;
						by = m;
						var inst = instance_create_depth(40+(l*20),40+(m*20),depth-1,obj_bomb);
						with inst {
							tx = other.bx;
							ty = other.by;
							timer = 1;
							type = 1;
						}
						tiles[l][m] = 4;
					}
				}
			}
		}
	}
}

function damage(count) {
	if _a {
		stop_play(snd_bell, 1, 1);
	} else {
		hp = max(0, hp - count);
		if hp = 0 {
			if instance_exists(obj_soul) {
				dead = true;
				stop_play(snd_break2, 1, 1);
				instance_destroy(obj_soul);
				audio_group_stop_all(ag_music);
				var inst = instance_create_depth(40+(ptx*20)+2,40+(pty*20)+8,-150,obj_shard);
				with inst {image_index = 1}
				var inst = instance_create_depth(40+(ptx*20)+2,40+(pty*20)+2,-150,obj_shard);
				with inst {image_index = 2}
				var inst = instance_create_depth(40+(ptx*20)+8,40+(pty*20)+8,-150,obj_shard);
				with inst {image_index = 3}
				var inst = instance_create_depth(40+(ptx*20)+8,40+(pty*20)+2,-150,obj_shard);
				with inst {image_index = 2}
				if editing alarm[0] = 30 else menu = true;
			}
		} else {
			stop_play(snd_hurt1, 1, 1);
			with obj_soul {flashing = 30}
			var inst = instance_create_depth(40+(ptx*20)+10,40+(pty*20)+10,-150,obj_damagenumber);
			with inst {val = count}
		}
	}
}

function destroy_all() {
	instance_destroy(obj_bomb);
	instance_destroy(obj_hud);
	instance_destroy(obj_explosion);
	instance_destroy(obj_shock);
	instance_destroy(obj_damagenumber);
	instance_destroy(obj_tileflash);
	instance_destroy(obj_bullet);
	if part_system_exists(_confetti) part_system_destroy(_confetti);
}

function return_editor() {
	destroy_all();
	instance_activate_object(obj_editor);
	if !instance_exists(obj_soul) {
		switch (obj_editor.selbgm) {
			case 0:
			audio_play_sound(mus_puzzle1,10,true);
			break;
			case 1:
			audio_play_sound(mus_puzzle2,10,true);
			break;
			case 2:
			audio_play_sound(mus_nhh,10,true);
			break;
			case 3:
			audio_play_sound(mus_menu,10,true);
			break;
		}
	}
	instance_destroy(obj_soul);
	instance_destroy();
}