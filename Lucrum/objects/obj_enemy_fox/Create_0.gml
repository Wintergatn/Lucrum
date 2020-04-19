///Initiate enemy
state = scr_enemy_move_state;
moving = false;

//depth = 260;

face = LEFT;
movement = IDLE;

grav = 0.3;
hsp = 0;
vsp = 0;
hsp_fraction = 0;
vsp_fraction = 0;
movespd = 1;
move = 0;

damage = 1;
hunger = 5;
hunger_lower_threshold = 2;
hunger_upper_threshold = 5;

//centerX = x - sprite_get_xoffset(sprite_index) + sprite_width / 2;
//centerY = y - sprite_get_yoffset( sprite_index) + sprite_height / 2;

//Sprite array
sprite[RIGHT, IDLE] = spr_enemy_fox_r;
sprite[LEFT, IDLE] = spr_enemy_fox_l;
sprite[RIGHT, MOVE] = spr_enemy_fox_r;
sprite[LEFT, MOVE] = spr_enemy_fox_l;
sprite[LEFT, EAT1] = spr_enemy_fox_eat_l_1;
sprite[LEFT, EAT2] = spr_enemy_fox_eat_l_2;
sprite[LEFT, EAT3] = spr_enemy_fox_eat_l_3;
sprite[RIGHT, EAT1] = spr_enemy_fox_eat_r_1;
sprite[RIGHT, EAT2] = spr_enemy_fox_eat_r_2;
sprite[RIGHT, EAT3] = spr_enemy_fox_eat_r_3;

//Need to refresh if entering another room
tilemap = layer_tilemap_get_id("Collision");

//Construct the behavior tree
node = 0;
node_add = 0;
node_return = true;

tree[0] = "Selector";
tree[1] = "Hunger < lower threshold";
tree[2] = "Sleep < lower threshold";
tree[3] = "Set timer";

tree[11] = "Sequence";
tree[111] = "Walk to food";
tree[112] = "Eat food";
tree[113] = "Wait until hunger > upper threshold";
tree[114] = "Selector";
tree[1141] = "Player within radius";
tree[11411] = "Growl";