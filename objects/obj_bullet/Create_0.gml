/// @description Insert description here
// You can write your code in this editor

type = irandom(3);
t = 0;
spd = 2;

stop_play(choose(snd_hurtgirl,snd_ehurt1,snd_hurtloox,snd_hurtlaugh),1,1);

if instance_exists(obj_soul) { depth = obj_soul.depth - 1 }
else { depth = -100 }