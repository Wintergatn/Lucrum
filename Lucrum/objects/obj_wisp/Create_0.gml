///Initiate wisp
x = obj_player.x;
y = obj_player.y;

state = scr_wisp_idle_state;
face = NEUTRAL;
size = 4;

depth = 0;
x_offset = 20;
x_offset2 = 15;
y_offset = 8;
obj_following = obj_player;

chain_frames = sprite_get_number(spr_wisp_attack1_r) + 1;
chain_minimum = 3;

//sprite array
sprite[NEUTRAL1, IDLE] = spr_wisp_1;
sprite[NEUTRAL2, IDLE] = spr_wisp_2;
sprite[NEUTRAL3, IDLE] = spr_wisp_3;
sprite[NEUTRAL4, IDLE] = spr_wisp_idle;
sprite[RIGHT, ATTACK1] = spr_wisp_attack1_r;
sprite[LEFT, ATTACK1] = spr_wisp_attack1_l;
sprite[RIGHT, ATTACK2] = spr_wisp_attack2_r;
sprite[LEFT, ATTACK2] = spr_wisp_attack2_l;