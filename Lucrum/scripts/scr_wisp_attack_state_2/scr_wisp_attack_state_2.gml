///scr_wisp_attack_state_2
movement = ATTACK2;

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