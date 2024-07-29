/// @description Insert description here
// 40u can write 40ur code in this editor
if !menu {
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
		if tiles[ptx][pty] = 17 {
			var oldhp = hp;
			hp = 0;
			if pty > 0 {if tile_passable2(tiles[ptx][pty-1]) {pty --; hp = oldhp;
				slide(0)}}
			if ptx < xs {if tile_passable2(tiles[ptx+1][pty]) {ptx ++; hp = oldhp;
				slide(1)}}
			if pty < ys-1 {if tile_passable2(tiles[ptx][pty+1]) {pty ++; hp = oldhp;
				slide(2)}}
			if ptx > -1 {if tile_passable2(tiles[ptx-1][pty]) {ptx --; hp = oldhp;
				slide(3)}}
			tile_meet();
		} else if tiles[ptx][pty] = 5 or (tiles[ptx][pty] = -2 && flavor != 3) or (tiles[ptx][pty] = 6 && flavor = 1 && plaid = 0) or tiles[ptx][pty] = 15 {
			var inst = instance_place(40+(ptx*20),40+(pty*20),obj_shock)
			if inst != noone {instance_destroy(inst)}
			if tiles[ptx][pty] = 5 {
				stype = 0;
				stop_play(snd_shock, 1, 1);
			}
			if tiles[ptx][pty] = -2 {
				stype = 1;
				stop_play(snd_shock, 1, 1);
			}
			if tiles[ptx][pty] = 6 {
				stype = 2;
				stop_play(snd_b, 1, 1);
			}
			if tiles[ptx][pty] = 15 {
				if flavor = 2 {damage(2)} else {damage(1)}
				instance_create_depth(40+(ptx*20),40+(pty*20),depth-1,obj_tileflash);
				tiles[ptx][pty] = 4;
			}
			if tiles[ptx][pty] != 4 { 
				inst = instance_create_depth(40+(ptx*20),40+(pty*20),depth-1,obj_shock);
				with inst {
					type = other.stype
					image_index = (global.colorblind * 21) + (type * 8)
				}
			}
			if dir = 0 {
				pty ++;
				dir = 2;
				slide(2);
			} else if dir = 1 {
				ptx --;
				dir = 3;
				slide(3);
			} else if dir = 2 {
				pty --;
				dir = 0;
				slide(0);
			} else if dir = 3 {
				ptx ++;
				dir = 1;
				slide(1);
			}
			shocks++;
			if shocks >= 5 {
				damage(3);
				instance_create_depth(50+(ptx*20),50+(pty*20),-1001,obj_explosion);
				stop_play(snd_badexplosion, 1, 1);
			}
			tile_meet();
		} else if !looking {
			if keyboard_check_pressed(vk_left) && ptx > 0 && tile_passable(tiles[ptx-1][pty]) && ptx != xs+1 {
				if tiles[ptx][pty] = 18 {
					tiles[ptx][pty] = 4;
					if ptx < xs {
						if tiles[ptx+1][pty] = 5 elec_removal(ptx+1,pty);
						tiles[ptx+1][pty] = 4;
					}
					stop_play(snd_bell, 1, 1);
					instance_create_depth(40+(ptx*20),40+(pty*20),depth-1,obj_tileflash);
					instance_create_depth(40+((ptx+1)*20),40+(pty*20),depth-1,obj_tileflash);
				}
				ptx --;
				slide(3);
				dir = 3;
				gametick();
			} else if keyboard_check_pressed(vk_right) && ptx < xs+1 && tile_passable(tiles[ptx+1][pty]) && ptx != xs+1 {
				if tiles[ptx][pty] = 18 {
					tiles[ptx][pty] = 4;
					if ptx > 0 {
						if tiles[ptx-1][pty] = 5 elec_removal(ptx-1,pty);
						tiles[ptx-1][pty] = 4;
					}
					stop_play(snd_bell, 1, 1);
					instance_create_depth(40+(ptx*20),40+(pty*20),depth-1,obj_tileflash);
					instance_create_depth(40+((ptx-1)*20),40+(pty*20),depth-1,obj_tileflash);
				}
				ptx ++;
				slide(1);
				dir = 1;
				gametick();
			} else if keyboard_check_pressed(vk_up) && pty > 0 && tile_passable(tiles[ptx][pty-1]) && ptx != xs+1 {
				if tiles[ptx][pty] = 18 {
					tiles[ptx][pty] = 4;
					if pty < ys-1 {
						if tiles[ptx][pty+1] = 5 elec_removal(ptx,pty+1);
						tiles[ptx][pty+1] = 4;
					}
					stop_play(snd_bell, 1, 1);
					instance_create_depth(40+(ptx*20),40+(pty*20),depth-1,obj_tileflash);
					instance_create_depth(40+(ptx*20),40+((pty+1)*20),depth-1,obj_tileflash);
				}
				pty --;
				slide(0);
				dir = 0;
				gametick();
			} else if keyboard_check_pressed(vk_down) && pty < ys-1 && tile_passable(tiles[ptx][pty+1]) && ptx != xs+1 {
				if tiles[ptx][pty] = 18 {
					tiles[ptx][pty] = 4;
					if pty > 0 {
						if tiles[ptx][pty-1] = 5 elec_removal(ptx,pty-1);
						tiles[ptx][pty-1] = 4;
					}
					stop_play(snd_bell, 1, 1);
					instance_create_depth(40+(ptx*20),40+(pty*20),depth-1,obj_tileflash);
					instance_create_depth(40+(ptx*20),40+((pty-1)*20),depth-1,obj_tileflash);
				}
				pty ++;
				slide(2);
				dir = 2;
				gametick();
			}
		}

		px = 40+(ptx*20);
		py = 40+(pty*20);

		t ++
	}
	
	if ptx = xs+1 && !_a {
		if !editing {_confetti = part_system_create(ps_confetti)}
		stop_play(snd_won,1,1);
		_a = true;
		if editing { alarm[0] = 30 }
		else { menu = true }
	}
	
	if editing && keyboard_check_pressed(ord("X")) return_editor();
	if !editing && (keyboard_check_pressed(ord("X")) or keyboard_check_pressed(vk_enter) or keyboard_check_pressed(vk_escape)) {
		menu = true;
		opt = 0;
		looking = false;
		stop_play(snd_select,1,1);
	}
	

	if looking {
		if keyboard_check(vk_left) cx -= cs;
		if keyboard_check(vk_right) cx += cs;
		if keyboard_check(vk_up) cy -= cs;
		if keyboard_check(vk_down) cy += cs;
	} else {
		cx = ctx;
		cy = cty;
	}
	
	if !menu && (xs > 10 or ys > 8) && keyboard_check_pressed(ord("C")) looking = !looking

	if darkness > 0 {hudlerp1 += (100-hudlerp1) / lerpspd} else {hudlerp1 += (0-hudlerp1) / lerpspd}
	if plaid > 0 {hudlerp2 += (100-hudlerp2) / lerpspd} else {hudlerp2 += (0-hudlerp2) / lerpspd}
	if flavor > 0 {hudlerp3 += (100-hudlerp3) / lerpspd} else {hudlerp3 += (0-hudlerp3) / lerpspd}
	if cpresent {hudlerp4 += (100-hudlerp4) / lerpspd} else {hudlerp4 += (0-hudlerp4) / lerpspd}

	ctx += round(((ptx*20)-110-ctx) / 4);
	cty += round(((pty*20)-70-cty) / 4);

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

	msx = mouse_x - cx;
	msy = mouse_y - cy;
	
	if turns = 10000 && !turnsbroken {
		stop_play(snd_badexplosion,1,1);
		turnsbroken = true;
		var _inst = instance_create_depth(278,16,-100,obj_explosion);
		with _inst { locked = true }
	}
} else {
	if keyboard_check_pressed(vk_left){
		opt = (opt - 1 + optct) mod optct;
		if (_a or dead) && loadopt && opt = 1 opt = 0;
		stop_play(snd_menumove,1,1);
	} else if keyboard_check_pressed(vk_right) {
		opt = (opt + 1) mod optct;
		if (_a or dead) && loadopt && opt = 1 opt = 2;
		stop_play(snd_menumove,1,1);
	} else if keyboard_check_pressed(ord("Z")) {
		stop_play(snd_select,1,1);
		// GENERATING
		// WIN: NEW LEVEL - RETRY - MENU
		// DEAD: RETRY - NEW LEVEL - MENU
		// IDLE: RESUME - NEW LEVEL - MENU
		// LOADING
		// WIN: RETRY - SKIP - MENU
		// DEAD: RETRY - SKIP - MENU
		// IDLE: RESUME - RETRY - MENU
		if (_a and !loadopt and opt = 0) or (!_a and !loadopt and opt = 1) { // NEW LEVEL
			instance_create_depth(0,0,0,obj_main,
			{
				xs,
				ys
			});
			destroy_all();
			instance_destroy(obj_soul);
			instance_destroy();
		} else if (_a and loadopt and opt = 0) or (dead and opt = 0) or (!_a and !dead and opt = 1) or (_a and !loadopt and opt = 1) { // RETRY
			instance_create_depth(0,0,0,obj_main,
			{
				xs,
				ys,
				psy,
				bgm,
				loading: true,
				loadopt: loadopt,
				level
			});
			destroy_all();
			instance_destroy(obj_soul);
			instance_destroy();
		} else if (!dead and opt = 0) { // RESUME
			menu = false;
		} else { // MENU
			room_goto(rm_title);
			destroy_all();
			instance_destroy(obj_soul);
			instance_destroy();
		}
	} else if !dead and !_a and (keyboard_check_pressed(ord("X")) or keyboard_check_pressed(vk_enter) or keyboard_check_pressed(vk_escape)) {
		menu = false;
		opt = 0;
		stop_play(snd_select,1,1);
	}
}

if part_system_exists(_confetti) {
	part_system_position(_confetti,cx+160,cy);	
}