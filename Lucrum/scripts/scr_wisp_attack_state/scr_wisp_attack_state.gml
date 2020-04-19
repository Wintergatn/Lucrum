///scr_attack_state
movement = ATTACK1;
if (face_set == false) {
	face = obj_player.dir;
	face_set = true;
}
//face = obj_player.dir;

switch (face) {
	case RIGHT:
		x += ((obj_player.x + x_offset2) - x) * 0.1;
		break;
	case LEFT:
		x += ((obj_player.x - x_offset2) - x) * 0.1;
		break;
}
y += ((obj_player.y - y_offset) - y);

//Create damage hitbox

//Chain to next attack
if (obj_input.attack_key) {
	//if (image_index == 3) state = scr_attack2_state;
	//else count = 0;
	//alarm[0] = chain_frames - sprite_index;
	if (image_index != 3) {
		alarm[0] = 10;	
	} else state = scr_wisp_attack_state_2;
	//alarm[0] = (4 - (image_index + 1));
	show_debug_message("alarm: " + string(alarm[0]));
}

//show_debug_message("alarm: " + string(alarm[0]));
