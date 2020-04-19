///Switch to moving during cutscene
if (movement == OTHER) {
	obj_view.camera_following = "none";
	state = scr_enemy_move_state;
	move = 1;
	alarm[0] = 240;
}