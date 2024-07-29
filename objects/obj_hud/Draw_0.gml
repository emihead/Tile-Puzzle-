/// @description Insert description here
// You can write your code in this editor

looking = obj_main.looking;
menu = obj_main.menu;
showhp = obj_main.showhp;
hp = obj_main.hp;
cx = obj_main.cx;
cy = obj_main.cy;
hudlerp1 = obj_main.hudlerp1;
hudlerp2 = obj_main.hudlerp2;
hudlerp3 = obj_main.hudlerp3;
hudlerp4 = obj_main.hudlerp4;
flavor = obj_main.flavor;
turnsbroken = obj_main.turnsbroken;
editing = obj_main.editing;
_a = obj_main._a;
loadopt = obj_main.loadopt;
dead = obj_main.dead;
opt = obj_main.opt;
optct = obj_main.optct;
turns = obj_main.turns;
ctimer = obj_main.ctimer;
ys = obj_main.ys;
xs = obj_main.xs;
darkness = obj_main.darkness;
plaid = obj_main.plaid;

var _b;

if ((_a or dead) && loadopt) {_b = 1} else {_b = 0}

if !looking or menu {
	draw_sprite(spr_hud_dark,0,cx-round(0.74*(100-hudlerp1)),cy+2);
	draw_sprite(spr_hud_plaid,0,cx-round(0.74*(100-hudlerp2)),cy+24);
	if showhp {
		draw_sprite(spr_hud_hp,0,cx+101,cy);
		draw_set_color(#ed1c24);
		for (var i = 0; i < hp; i += 1) {
			draw_rectangle(118+cx+(i*5),17+cy,121+cx+(i*5),28+cy,false);
		}
		draw_set_color(c_white);
	}
	draw_sprite(spr_hud_flavor,0,cx+171,cy-round(0.33*(100-hudlerp3)));
	if flavor > 0 draw_sprite(spr_hud_flavoricons,flavor-1,cx+199,cy+16-round(0.33*(100-hudlerp3)));
	if !turnsbroken draw_sprite(spr_hud_turns,0,cx+245,cy+2);
	draw_sprite(spr_hud_cyanflip,0,cx+245+round(0.75*(100-hudlerp4)),cy+24);

	draw_set_font(fnt_dtm);
	draw_set_halign(fa_center);
	if editing {
		draw_set_color(c_black);
		text_outline(160+cx,220+cy,"Press X to return to editor");
		draw_set_color(c_white);
		draw_text(160+cx,220+cy,"Press X to return to editor");
	}
	if menu {
		var _opt0 = "Resume";
		var _opt1 = "New Level";
		var _opt2 = "Menu";
		if _a {
			if loadopt {
				_opt0 = "Retry";
			} else {
				_opt0 = "New Level";
				_opt1 = "Retry";
			}
		} else if dead {_opt0 = "Retry"} else {
			_opt0 = "Resume";
			if loadopt {_opt1 = "Retry"}
		}
		draw_set_color(c_black);
		text_outline((_b*20)+60+cx,220+cy,_opt0)
		if opt = 0 {draw_set_color(c_yellow)} else {draw_set_color(c_white)}
		draw_text((_b*20)+60+cx,220+cy,_opt0)
		if _b = 0 {
			draw_set_color(c_black);
			text_outline(160+cx,220+cy,_opt1);
			if opt = 1 {draw_set_color(c_yellow)} else {draw_set_color(c_white)}
			draw_text(160+cx,220+cy,_opt1);
		}
		draw_set_color(c_black);
		text_outline(260+cx-(_b*20),220+cy,_opt2);
		if opt = 2 {draw_set_color(c_yellow)} else {draw_set_color(c_white)}
		draw_text(260+cx-(_b*20),220+cy,_opt2);
	}
	draw_set_color(c_white);
	draw_set_font(global.fnt_numbers);
	draw_text(48+cx-round(0.74*(100-hudlerp1)),6+cy,darkness);
	draw_text(48+cx-round(0.74*(100-hudlerp2)),28+cy,plaid);
	if showhp draw_text(139+cx,17+cy,hp);
	if !turnsbroken draw_text(287+cx,6+cy,turns);
	draw_text(278+cx+round(0.75*(100-hudlerp4)),28+cy,ctimer);
	draw_set_font(fnt_dtm);
	draw_set_halign(fa_left);
}

if ys > 8 && looking && !menu {
	if cy > -20 {draw_sprite(spr_arrow,0,160+cx,2+cy)}
	if cy < (20*(ys-8))-20 {draw_sprite_ext(spr_arrow,0,160+cx,238+cy,1,1,180,c_white,1)}
}
if xs > 10 && looking && !menu {
	if cx > 0 {draw_sprite_ext(spr_arrow,0,2+cx,120+cy,1,1,90,c_white,1)}
	if cx < 20*(xs-10) {draw_sprite_ext(spr_arrow,0,318+cx,120+cy,1,1,270,c_white,1)}
}

if !looking && !menu && (xs > 10 or ys > 8) {
	draw_set_alpha(0.5);
	draw_sprite(spr_freecam,0,cx+318,cy+238);
	draw_set_alpha(1);
}