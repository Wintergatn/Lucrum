///scr_end_cutscene
obj_view.camera_following = obj_player;
obj_player.state = scr_move_state;
obj_cutscene.cutsceneEnd = true;

//Animate the cutscene bands
obj_cutscene.alarm[0] = 56;