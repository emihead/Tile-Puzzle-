/// @description Insert description here
// You can write your code in this editor

draw_sprite(spr_controls,0,283,227);
if menu != 3 {
	draw_sprite(spr_logo,0,50,49);
	draw_sprite(spr_smallies,p1,256,49);
	draw_sprite(spr_smallies,p2,250,55);
	draw_sprite(spr_smallies,p3,256,55);
	draw_sprite(spr_smallies,p4,262,55);
	draw_sprite(spr_smallies,p5,256,61);
}

draw_set_font(fnt_dtm);
draw_set_halign(fa_center);
if invalid > 0 {
	draw_set_color(c_red);
	draw_text(160,80,"Invalid level data!");
	draw_set_color(c_white);
}
if menu = 0 {
	if selected = 0 {draw_set_color(c_yellow)} else {draw_set_color(c_white)}
	draw_text(160,100,"Play");
	if selected = 1 {draw_set_color(c_yellow)} else {draw_set_color(c_white)}
	draw_text(160,120,"Create");
	if selected = 2 {draw_set_color(c_yellow)} else {draw_set_color(c_white)}
	draw_text(160,140,"Tiles");
	if selected = 3 {draw_set_color(c_yellow)} else {draw_set_color(c_white)}
	draw_text(160,160,"Options");
	if selected = 4 {draw_set_color(c_yellow)} else {draw_set_color(c_white)}
	draw_text(160,180,"Quit");
} else if menu = 1 {
	if selected = 0 {draw_set_color(c_yellow)} else {draw_set_color(c_white)}
	draw_text(160,120,"Generate");
	if selected = 1 {draw_set_color(c_yellow)} else {draw_set_color(c_white)}
	draw_text(160,140,"Load");
	if selected = 2 {draw_set_color(c_yellow)} else {draw_set_color(c_white)}
	draw_text(160,160,"Back");
} else if menu = 2 {
	if selected = 0 {draw_set_color(c_yellow)} else {draw_set_color(c_white)}
	draw_text(160,120,"New");
	if selected = 1 {draw_set_color(c_yellow)} else {draw_set_color(c_white)}
	draw_text(160,140,"Load");
	if selected = 2 {draw_set_color(c_yellow)} else {draw_set_color(c_white)}
	draw_text(160,160,"Back");
} else if menu = 3 {
	if selected = 0 {draw_set_color(c_yellow)} else {draw_set_color(c_white)}
	draw_text(160,208,"Back");
} else if menu = 4 {
	if selected = 0 {draw_set_color(c_yellow)} else {draw_set_color(c_white)}
	draw_text(160,95,"Music: " + string(floor(global.music * 10)) + "%");
	if selected = 1 {draw_set_color(c_yellow)} else {draw_set_color(c_white)}
	draw_text(160,115,"SFX: " + string(floor(global.sfx * 10)) + "%");
	if selected = 2 {draw_set_color(c_yellow)} else {draw_set_color(c_white)}
	if global.colorblind {draw_text(160,135,"Visibility mode: ON")} else {draw_text(160,135,"Visibility mode: OFF")}
	draw_set_font(fnt_mars);
	draw_set_color(c_gray);
	draw_text(160,152,"gives tiles icons that hint at their effect");
	draw_set_font(fnt_dtm);
	if selected = 3 {draw_set_color(c_yellow)} else {draw_set_color(c_white)}
	draw_text(160,165,"Window size: x" + string(global.ws));
	if selected = 4 {draw_set_color(c_yellow)} else {draw_set_color(c_white)}
	draw_text(160,185,"Back");
	if selected < 4 {
		draw_set_color(c_yellow);
		if selected = 3 {
			draw_text(160,165,"<                      >");
		} else {
			draw_text(160,95 + (selected*20),"<                      >");
		}
	}
} else if menu = 5 {
	if selected = 0 {draw_set_color(c_yellow)} else {draw_set_color(c_white)}
	draw_text(160,95,"Generate");
	if selected = 1 {draw_set_color(c_yellow)} else {draw_set_color(c_white)}
	draw_text(160,115,"Width: " + string(floor(xs)));
	if selected = 2 {draw_set_color(c_yellow)} else {draw_set_color(c_white)}
	draw_text(160,135,"Height: " + string(floor(ys)));
	if selected = 3 {draw_set_color(c_yellow)} else {draw_set_color(c_white)}
	draw_text(160,155,"Preset: " + ipreset[global.preset][0]);
	draw_set_color(c_gray);
	draw_set_font(fnt_mars);
	draw_text(160,173,ipreset[global.preset][1]);
	draw_set_font(fnt_dtm);
	if selected = 4 {draw_set_color(c_yellow)} else {draw_set_color(c_white)}
	draw_text(160,185,"Back");
	if selected < 4 && selected > 0 {
		draw_set_color(c_yellow);
		draw_text(160,95 + (selected*20),"<                        >");
	}
}


if menu = 3 {
	if vtile = 17 {
		draw_sprite_ext(spr_tiles,17+(global.colorblind*20),36,28,2,2,0,c_white,1);
		draw_sprite_ext(spr_tiles,44+global.colorblind,76,68,2,2,0,c_white,1);
	} else {
		draw_sprite_ext(spr_tiles,vtile+(global.colorblind*20),56,48,2,2,0,c_white,1);
	}
	draw_sprite(spr_tileinfo,vtile,30,9);
	draw_set_color(c_gray);
	draw_text(160,2,string(vtile+1) + "/20");
	draw_set_color(c_white);
	draw_text(160,116,"<                                     >");
}

draw_set_halign(fa_left);
draw_set_font(fnt_mars);
draw_set_color(c_gray);
draw_text(2,218,"v1.0");
draw_text(2,225,"tile puzzle+ by emihead");
draw_text(2,232,"based on undertale by toby fox");
if menu = 5 {
	draw_set_halign(fa_middle);
	draw_text(160,80,"random levels may be impossible!");
	draw_set_halign(fa_left);
}

draw_set_color(c_white);