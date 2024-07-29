/// @description Insert description here
// You can write your code in this editor

t = 0;
selected = 0;
options = 5;
menu = 0;
vtile = 0;
xs = 8;
ys = 6;
invalid = 0;
global.preset = 0;
p1 = irandom(19);
p2 = irandom(19);
p3 = irandom(19);
p4 = irandom(19);
p5 = irandom(19);

ipreset[0][0] = "Default";
ipreset[0][1] = "(Mostly) balanced tile weights";
ipreset[1][0] = "Lots of Bombs";
ipreset[1][1] = "For the gamer who enjoys getting blown to smithereens";
ipreset[2][0] = "Swamp";
ipreset[2][1] = "Wet and gross";
ipreset[3][0] = "Damage Control";
ipreset[3][1] = "Watch your HP";
ipreset[4][0] = "All Bad";
ipreset[4][1] = "This is about to suck";
ipreset[5][0] = "All Good";
ipreset[5][1] = "This is about to... be kinda boring probably";
ipreset[6][0] = "Flavortown";
ipreset[6][1] = "I just can't decide what to wear";
ipreset[7][0] = "Warm Colors";
ipreset[7][1] = "Danger! Passion! Energy!";
ipreset[8][0] = "Cool Colors";
ipreset[8][1] = "Peace... Tranquility.... Security........";
ipreset[9][0] = "Vanilla Mode";
ipreset[9][1] = "No new tiles. Green tile does nothing";

audio_group_stop_all(ag_music);
audio_play_sound(mus_menu,10,true);