/// @description Insert description here
// You can write your code in this editor
if flashing = 0 or t mod 2 = 0 {
	draw_self();
	if obj_main.plaid > 0 {
		draw_set_alpha(obj_main.plaid / 6);
		draw_sprite(spr_soul, 4, x, y);
		draw_set_alpha(1);
	}
	if light > 0 {
		draw_set_alpha(light/10);
		draw_sprite(spr_soul, 5, x, y);
		draw_set_alpha(1);
	}
}

cx = obj_main.cx;
cy = obj_main.cy;

if d > 0.01 {
	draw_set_color(c_black);
	draw_rectangle(cx,cy,cx+320,lerp(cy,y-21,d),false);
	draw_rectangle(cx,lerp(cy+240,y+40,d),cx+320,cy+240,false);
	draw_rectangle(cx,cy,lerp(cx,x-21,d),cy+240,false);
	draw_rectangle(lerp(cx+320,x+40,d),cy,cx+320,cy+240,false);
	draw_set_color(c_white);
}