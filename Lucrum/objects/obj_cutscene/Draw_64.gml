///Draw black bars

draw_sprite_ext(spr_cutscenebar, 0, 0, 0, 384, bandx, 0, c_black, 1);

//if (cutsceneActive) {
	//top bar
	//instance_create_depth(0, 0, -200, obj_cutscene_bar);
	
	//bottom bar
	//instance_create_depth(0, 187, -200, obj_cutscene_bar);
//}

draw_sprite_ext(spr_cutscenebar, 0, 0, 216, 384, -bandx, 0, c_black, 1);
