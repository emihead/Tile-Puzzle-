/// @description Insert description here
// You can write your code in this editor

i = floor(t);
if type < 2 {
	switch floor(t) {
		case 4: i = 0; break;
		case 5: case 7: case 9: case 11: i = 4; break;
		case 6: case 8: case 10: case 12: i = 5; break;
		case 13: i = 6; break;
		case 14: i = 7; break;
		case 15: instance_destroy(); break;
	}
} else {
	switch floor(t) {
		case 1: case 12: i = 0; break;
		case 2: case 3: case 4: case 11: i = 1; break;
		case 5: case 10: i = 2; break;
		case 6: case 8: i = 3; break;
		case 7: case 9: i = 4; break;
		case 13: instance_destroy(); break;
	}
}

image_index = i + (global.colorblind * 21) + (type * 8)

t += 1/3