/// @description Insert description here
// You can write your code in this editor

for (var i = 0; i < xs+2; i += 1) {
	for (var k = 0; k < ys; k += 1) {
		if i = 0 {
			draw_sprite(spr_sf,0,40+(i*20),40+(k*20))
		} else if i = xs+1 {
			draw_sprite(spr_sf,1,40+(i*20),40+(k*20))
		} else if tiles[i][k] = 20 {
			draw_sprite(spr_tiles,44+(global.colorblind),40+(i*20),40+(k*20))
		} else if tiles[i][k] = -2 {
			draw_sprite(spr_tiles,42+(floor(t/3) mod 2),40+(i*20),40+(k*20))
		} else {
			draw_sprite(spr_tiles,tiles[i][k]+(global.colorblind*20),40+(i*20),40+(k*20))
		}
	}
}

//if !looking or menu {
//	draw_sprite(spr_hud_dark,0,cx-round(0.74*(100-hudlerp1)),cy+2);
//	draw_sprite(spr_hud_plaid,0,cx-round(0.74*(100-hudlerp2)),cy+24);
//	if showhp {
//		draw_sprite(spr_hud_hp,0,cx+101,cy);
//		draw_set_color(#ed1c24);
//		for (var i = 0; i < hp; i += 1) {
//			draw_rectangle(118+cx+(i*5),17+cy,121+cx+(i*5),28+cy,false);
//		}
//		draw_set_color(c_white);
//	}
//	draw_sprite(spr_hud_flavor,0,cx+171,cy-round(0.33*(100-hudlerp3)));
//	if flavor > 0 draw_sprite(spr_hud_flavoricons,flavor-1,cx+199,cy+16-round(0.33*(100-hudlerp3)));
//	if !turnsbroken draw_sprite(spr_hud_turns,0,cx+245,cy+2);
//	draw_sprite(spr_hud_cyanflip,0,cx+245+round(0.75*(100-hudlerp4)),cy+24);

//	draw_set_font(fnt_dtm);
//	draw_set_halign(fa_center);
//	if editing {
//		draw_set_color(c_black);
//		text_outline(160+cx,220+cy,"Press X to return to editor");
//		draw_set_color(c_white);
//		draw_text(160+cx,220+cy,"Press X to return to editor");
//	}
//	if menu {
//		var _opt0 = "Resume";
//		if _a {
//			if loadopt {_opt0 = "Retry"} else {_opt0 = "New Level"}
//		} else if !dead {_opt0 = "Resume"} else {_opt0 = "Retry"}
//		draw_set_color(c_black);
//		text_outline(80+cx,220+cy,_opt0)
//		text_outline(240+cx,220+cy,"Back to Menu");
//		if opt = 0 {draw_set_color(c_yellow)} else {draw_set_color(c_white)}
//		draw_text(80+cx,220+cy,_opt0)
//		if opt = 0 {draw_set_color(c_white)} else {draw_set_color(c_yellow)}
//		draw_text(240+cx,220+cy,"Back to Menu");
//	}
//	draw_set_color(c_white);
//	draw_set_font(global.fnt_numbers);
//	draw_text(48+cx-round(0.74*(100-hudlerp1)),6+cy,darkness);
//	draw_text(48+cx-round(0.74*(100-hudlerp2)),28+cy,plaid);
//	if showhp draw_text(139+cx,17+cy,hp);
//	if !turnsbroken draw_text(287+cx,6+cy,turns);
//	draw_text(278+cx+round(0.75*(100-hudlerp4)),28+cy,ctimer);
//	draw_set_font(fnt_dtm);
//	draw_set_halign(fa_left);
//}

//if ys > 8 && looking && !menu {
//	if cy > -20 {draw_sprite(spr_arrow,0,160+cx,2+cy)}
//	if cy < (20*(ys-8))-20 {draw_sprite_ext(spr_arrow,0,160+cx,238+cy,1,1,180,c_white,1)}
//}
//if xs > 10 && looking && !menu {
//	if cx > 0 {draw_sprite_ext(spr_arrow,0,2+cx,120+cy,1,1,90,c_white,1)}
//	if cx < 20*(xs-10) {draw_sprite_ext(spr_arrow,0,318+cx,120+cy,1,1,270,c_white,1)}
//}

