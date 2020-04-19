///scr_enemy_eat_state

if (movement == EAT1 && image_index > image_number - 1) {
	movement = EAT2;
} else if (movement == EAT2 && hunger == hunger_upper_threshold) {
	movement = EAT3;
} else if (movement == EAT3 && image_index > image_number - 1) {
	movement = MOVE;
	state = scr_enemy_move_state;
}

if (movement == EAT2 && alarm[2] == -1) alarm[2] = 1 * room_speed;

show_debug_message("hunger: " + string(hunger));