/// @description Insert description here
// You can write your code in this editor

draw_sprite(spr_tiles,11+(type*2)+(global.colorblind*20),x,y);

draw_set_color(c_red);
draw_set_alpha((1+sin(t*0.1))/4);
draw_rectangle(x-19,y-19,x+38,y+38,false);
draw_set_alpha(1);
draw_rectangle(x-19,y-19,x+38,y+38,true);

draw_set_color(c_black);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(x+9,y+10,timer);
draw_text(x+10,y+9,timer);
draw_text(x+11,y+10,timer);
draw_text(x+10,y+11,timer);
draw_set_color(c_white);
draw_text(x+10,y+10,timer);

draw_set_halign(fa_left);
draw_set_valign(fa_top);