/// @description Insert description here
// You can write your code in this editor

flashing = max(0, flashing - 1);
light = max(0, light - 0.5);

x = (x+40+(obj_main.ptx*20))/2
y = (y+40+(obj_main.pty*20))/2

image_index = obj_main.flavor

t ++;

if obj_main.darkness > 0 {
	d += (1 - d) / 4;
} else {
	d -= d / 4;
}