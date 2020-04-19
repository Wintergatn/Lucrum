///scr_wisp_idle_state
movement = IDLE;
face = NEUTRAL;

//Follow player
if (obj_following == obj_player) {
	/*if (obj_attack_radius.attackMode) {
		switch (obj_player.dir) {
			case RIGHT:
				x += ((obj_player.x + x_offset2) - x) * 0.2;
				break;
			case LEFT:
				x += ((obj_player.x - x_offset2) - x) * 0.2;
				break;
		}
	//y += ((obj_player.y - y_offset) - y) * 0.1;
	y += (obj_player.y - y_offset) - y;
	} else {*/
		switch (obj_player.dir) {
			case RIGHT:
				//x += ((obj_player.x - (3 * x_offset)) - x) * 0.1;
				x += ((obj_player.x - x_offset) - x) * 0.1;
				break;
			case LEFT:
				x += ((obj_player.x + x_offset) - x) * 0.1;
				break;
		}
	y += (obj_player.y - y) * 0.1;
	//}
	
}
else {
	x += (obj_following.x - x) * 0.1;
	y += (obj_following.y - y) * 0.1;
}

//Change size based on health
switch (obj_player_stats.cHealth) {
	case 4:
		face = NEUTRAL4;
		size = 4;
		x_offset = 20;
		break;
	
	case 3:
		face = NEUTRAL3;
		size = 3;
		x_offset = 18;
		break;
	
	case 2:
		face = NEUTRAL2;
		size = 2;
		x_offset = 16;
		break;
	
	case 1:
		face = NEUTRAL1;
		size = 1;
		x_offset = 14;
		break;
}

if (obj_player.embered && obj_input.attack_key) {
	image_index = 0;
	face_set = false;
	state = scr_wisp_attack_state;
}

//show_debug_message("wispx: " + string(x));
//show_debug_message("wispy: " + string(y));