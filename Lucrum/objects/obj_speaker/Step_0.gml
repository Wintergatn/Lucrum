var dr = detection_radius;
if (point_in_rectangle(playerobject.x, playerobject.y, x - dr, y - dr, x + dr, y + dr)) {
	if (myTextbox != noone) { 
		if (!instance_exists(myTextbox)) {
			myTextbox = noone;
			exit;
		}
	}
	//if I haven't already created my textbox, make one:
	else if (obj_input.interact_key_pressed) {
		obj_player.state = scr_freeze_state;
		if (instance_exists(obj_textbox)) {
			exit; //exit if a textbox already exists
		}
		event_user(0); //if you need variables to update for text
			
		//Hand over variables
		scr_create_dialogue(myText, mySpeaker, myEffects, myTextSpeed, myTypes, myNextLine, myScripts, myTextCol, myEmotion, myEmote);
	}
} else {	//if player moves outside of detection radius
	if (myTextbox != noone) {
		with (myTextbox) instance_destroy();
		myTextbox = noone;
		obj_player.state = scr_freeze_state;
	}
}
