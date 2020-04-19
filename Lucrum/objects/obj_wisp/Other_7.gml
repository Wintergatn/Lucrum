///Switch animations
if ((movement == ATTACK1 && alarm[0] == -1) || movement == ATTACK2) {
	face = NEUTRAL;
	face_set = false;
	state = scr_wisp_idle_state;
}