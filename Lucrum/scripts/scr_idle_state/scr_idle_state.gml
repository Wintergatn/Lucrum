///scr_idle_state
movement = IDLE;

if (obj_input.right_key || obj_input.left_key == -1 || obj_input.jump_key || obj_input.down_key_pressed || obj_input.ember_key) {
	state = scr_move_state;
	alarm[1] = idleTimer;
}