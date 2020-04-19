///Defaults

if (instance_number(obj_textevent) > 1 or instance_number(obj_textbox) > 0) {
	instance_destroy(); 
	exit; 
}

//Customize
//myVoice			= snd_voice2;
myTextCol		= c_white;
//myPortrait		= -1;
myFont			= fnt_dialogue;
myName			= "None";

//Setup
myTextbox   = noone;
scr_reset_dialogue_defaults();