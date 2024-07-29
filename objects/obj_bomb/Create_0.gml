/// @description Insert description here
// You can write your code in this editor

timer = 2;
t = 0;
type = 0;

function tick() {
	timer --;
	instance_create_depth(x,y,depth-1,obj_tileflash);
	if timer = 0 {
		instance_create_depth(x+10,y+10,-100,obj_explosion);
		stop_play(snd_badexplosion,1,1);
		with obj_main {react_explosion(other.tx, other.ty, 1)}
		if abs(tx - obj_main.ptx) < 2 && abs(ty - obj_main.pty) < 2 {
			with obj_main {damage(2)}
		}
		instance_destroy();
	} else {
		audio_play_sound(snd_bombfall,10,false);
	}
}