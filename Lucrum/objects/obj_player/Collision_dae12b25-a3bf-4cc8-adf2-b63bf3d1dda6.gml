///Start cutscene

if (obj_cutscene.cutsceneSetup == false) {
	obj_view.camera_following = obj_oldbird;
	//add timer
	obj_oldbird.movement = OTHER;
	obj_oldbird.cutsceneActive = true;
	state = scr_freeze_state;
	obj_cutscene.cutsceneSetup = true;
}


//obj_oldbird.sprite_index = spr_oldbird_corruption;


if (obj_cutscene.cutsceneActive == false) {
	alarm[0] = 56;
	obj_cutscene.cutsceneActive = true;
}

//Animate the cutscene bands
switch (alarm[0]) {
	case 56:
		obj_cutscene.bandx = 1;
		break;
	
	case 50:
		obj_cutscene.bandx = 2;
		break;
	
	case 44:
		obj_cutscene.bandx = 5;
		break;
	
	case 38:
		obj_cutscene.bandx = 10;
		break;
		
	case 32:
		obj_cutscene.bandx = 26;
		break;
		
	case 26:
		obj_cutscene.bandx = 28;
		break;
		
	case 20:
		obj_cutscene.bandx = 29;
		break;
		
	case 14:
		obj_cutscene.bandx = 30;
		break;
}