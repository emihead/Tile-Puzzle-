/// @description Insert description here
// You can write your code in this editor
if instance_exists(obj_soul) {
	dir = point_direction(x,y,obj_soul.x+10,obj_soul.y+10);
	x += lengthdir_x(spd,dir);
	y += lengthdir_y(spd,dir);

	if abs(x - obj_soul.x - 10) < 5 && abs(y - obj_soul.y - 10) < 5 {
		with obj_main {damage(1)}
		instance_destroy();
	}
} else {
	x += x - obj_main.cx- 160;
	y += y - obj_main.cy - 120;
	alarm[0] = 120;
}

t += 0.2;
spd = min(5,spd+0.1);