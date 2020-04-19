//Defaults

state = scr_enemy_idle_state;
face = LEFT;
movement = IDLE;

//Sprite array
sprite[LEFT, IDLE] = spr_oldbird_idle_l;
sprite[LEFT, OTHER] = spr_oldbird_corruption;

cutsceneActive = false;

//inherit from obj_speaker
event_inherited();
//depth = 260;

//Dialogue

//myPortrait			= spr_oldbird;
//myVoice				= snd_voice1;
myName				= "???";

//myPortraitTalk		= spr_oldbird;
//myPortraitTalk_x	= 26;
//myPortraitTalk_y	= 44;
//myPortraitIdle		= spr_oldbird;


//Other

choice_variable		= -1;	//the variable we change depending on the player's choice in dialogue