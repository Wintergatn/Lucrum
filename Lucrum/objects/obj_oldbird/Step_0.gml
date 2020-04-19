///Inherit step from obj_speaker
event_inherited();

//if (cutsceneActive == true) sprite_index = spr_oldbird_corruption;

script_execute(state);
sprite_index = sprite[face, movement];