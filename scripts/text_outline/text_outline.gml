// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function text_outline(_x,_y,_str) {
	draw_text(_x-1,_y,_str);
	draw_text(_x,_y-1,_str);
	draw_text(_x+1,_y,_str);
	draw_text(_x,_y+1,_str);
}