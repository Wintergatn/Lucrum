///scr_get_input

//movement
right_key = keyboard_check(ord("D"));
left_key = -keyboard_check(ord("A"));
down_key_pressed = keyboard_check_pressed(ord("S"));
down_key_released = keyboard_check_released(ord("S"));
jump_key = keyboard_check(vk_space);

//other actions
interact_key_pressed = keyboard_check_pressed(ord("E"));
interact_key_released = keyboard_check_released(ord("E"));
ember_key = keyboard_check_pressed(vk_shift);
attack_key = mouse_check_button_pressed(mb_left);