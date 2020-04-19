///End corruption animation
if (movement == OTHER) {
	//image_speed = 0;
	//image_index = 9;
	
	instance_create_depth(x, y, depth, obj_kana);
	obj_view.camera_following = obj_kana;
	instance_destroy();
	
	//state = scr_enemy_move_state;
}