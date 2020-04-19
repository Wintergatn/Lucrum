///Initiate Kana
state = scr_enemy_other_state;

face = LEFT;

grav = 0.3;
hsp = 0;
vsp = 0;
hsp_fraction = 0;
vsp_fraction = 0;
movespd = 1;
move = 0;

//Sprite array
sprite[RIGHT, MOVE] = spr_kana_walk_r;
sprite[LEFT, MOVE] = spr_kana_walk_l;
sprite[LEFT, OTHER] = spr_kana_laugh_l;
sprite[RIGHT, OTHER] = spr_kana_laugh_r;

//Need to refresh if entering another room
tilemap = layer_tilemap_get_id("Collision");