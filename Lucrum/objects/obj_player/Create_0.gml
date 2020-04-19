///Initiate player
state = scr_move_state;

//Direction based sprite indexes
face = RIGHT;
previousFace = RIGHT;
dir = RIGHT;

//Embering
interacting = false;
embered = false;

//Movement vars
grav = 0.3;
hsp = 0;
vsp = 0;
hsp_fraction = 0;
vsp_fraction = 0;
jumpspd = 6;
movespd = 1;
jumping = false;
knockback = false;
knockbackspd = 3;

//Idle animation
idleTimer = 600;
alarm[1] = idleTimer;

//Damage animation
flash = 0.0;
flickerTime = 4;
invincible = false;
invincibilityTime = 60;

//Sprite array
sprite[RIGHT, MOVE] = spr_player_walk_r;
sprite[LEFT, MOVE] = spr_player_walk_l;
sprite[UP_RIGHT_U, MOVE] = spr_player_jump_r_u;
sprite[UP_RIGHT_D, MOVE] = spr_player_jump_r_d;
sprite[UP_LEFT_U, MOVE] = spr_player_jump_l_u;
sprite[UP_LEFT_D, MOVE] = spr_player_jump_l_d;
sprite[DOWN_RIGHT, MOVE] = spr_player_squat_r;
sprite[DOWN_LEFT, MOVE] = spr_player_squat_l;
sprite[RIGHT, IDLE] = spr_player_idle_r;
sprite[LEFT, IDLE] = spr_player_idle_l;
sprite[RIGHT, DAMAGE] = spr_player_damage_r;
sprite[LEFT, DAMAGE] = spr_player_damage_l;

//currentRoom = room_get_name(room);
//emberRoom = currentRoom + "E";