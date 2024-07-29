/// @description Insert description here
// You can write your code in this editor

for (var i = 0; i < xs+2; i += 1) {
	for (var k = 0; k < ys; k += 1) {
		if i = 0 {
			draw_sprite(spr_sf,0,40+(i*20),40+(k*20))
		} else if i = xs+1 {
			draw_sprite(spr_sf,1,40+(i*20),40+(k*20))
		} else if etiles[i][k] = 20 {
			draw_sprite(spr_tiles,44+(global.colorblind),40+(i*20),40+(k*20))
		} else if etiles[i][k] = -2 {
			draw_sprite(spr_tiles,42+(floor(t/3) mod 2),40+(i*20),40+(k*20))
		} else {
			draw_sprite(spr_tiles,etiles[i][k]+(global.colorblind*20),40+(i*20),40+(k*20))
		}
	}
}

draw_sprite(spr_soul,0,40,40+(psy*20));

if mtx > 0 && mty >= 0 && mtx < xs+1 && mty < ys && msy >= 44 { 
	draw_set_alpha(0.5);
	draw_sprite(spr_tiles,sel+(global.colorblind*20),40+mtx*20,40+mty*20);
	if etiles[mtx][mty] = 17 or etiles[mtx][mty] = 20 { draw_sprite(spr_rclick,0,40+mtx*20,40+mty*20) }
	draw_set_alpha(1);
}

draw_set_color(c_white);
draw_sprite(spr_editorhud, 0, cx, cy);
draw_set_font(global.fnt_numbers);
draw_set_halign(fa_center);
draw_text(65+cx, 6+cy, xs);
draw_text(65+cx, 28+cy, ys);
draw_sprite(spr_tiles,sel+(global.colorblind*20),117+cx,13+cy);
draw_text(172+cx, 28+cy, psy+1);

draw_set_font(global.fnt_screenb);
draw_set_halign(fa_right);
draw_text(259+cx, 13+cy, bgmauthor);
draw_set_font(global.fnt_screena);
draw_set_halign(fa_left);
draw_text(203+cx, 7+cy, bgmtitle);
draw_set_font(fnt_dtm);

if ys > 8 {
	if cy > -20 {draw_sprite(spr_arrow,0,160+cx,46+cy)}
	if cy < (20*(ys-8))-20 {draw_sprite_ext(spr_arrow,0,160+cx,238+cy,1,1,180,c_white,1)}
}
if xs > 10 {
	if cx > 0 {draw_sprite_ext(spr_arrow,0,2+cx,142+cy,1,1,90,c_white,1)}
	if cx < 20*(xs-10) {draw_sprite_ext(spr_arrow,0,318+cx,142+cy,1,1,270,c_white,1)}
}