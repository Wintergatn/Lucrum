///scr_enemy_move_state
if (move == 0) movement = IDLE;
else movement = MOVE;

image_speed = 1;

var bbox_side;

//move = argument0;
if (!moving) {
	alarm[0] = random_range(0, 3) * room_speed;
	moving = true;
}

if (alarm[1] == -1) alarm[1] = 6 * room_speed;
//show_debug_message(string(hunger));


hsp = move * movespd;

hsp += hsp_fraction;
vsp += vsp_fraction;

//Gravity
if (vsp < 10) {
	vsp += grav;
}

hsp_fraction = hsp mod 1;
hsp -= hsp_fraction;
vsp_fraction = vsp mod 1;
vsp -= vsp_fraction;

//Sprite indexes
if (hsp > 0) {
	face = RIGHT
}
if (hsp < 0) {
	face = LEFT;
}

if (move == 0) {
	image_index = 0;
}
if (move != 0) scr_skip_frame(obj_enemy);

//Horizontal tile collision
if (hsp > 0) bbox_side = bbox_right; else bbox_side = bbox_left;
p1 = tilemap_get_at_pixel(tilemap, bbox_side + hsp, bbox_top);
p2 = tilemap_get_at_pixel(tilemap, bbox_side + hsp, bbox_bottom);
if (p1 != 0) || (p2 != 0) { //Inside a tile
	//Make them switch direction
	move = -move;
	if (hsp > 0) x = x - (x mod 16) + 15 - (bbox_right - x);
	else x = x - (x mod 16) - (bbox_left - x);
	hsp = 0;
}

//Horizontal object collisions
if (place_meeting(x + hsp, y, obj_solid)) {
	while (!place_meeting(x + sign(hsp), y, obj_solid)) {
		x += sign(hsp);
	}
	hsp = 0;
}
x += hsp;

//Vertical tile collision
if (vsp >= 0) bbox_side = bbox_bottom; else bbox_side = bbox_top;
p1 = tilemap_get_at_pixel(tilemap, bbox_left, bbox_side + vsp);
p2 = tilemap_get_at_pixel(tilemap, bbox_right, bbox_side + vsp);
if (p1 != 0) || (p2 != 0) {
	//if (vsp >= 0) y = y - (y mod 16) + 15 - (bbox_bottom - y);
	if (vsp >= 0) y = y - (bbox_bottom mod 16) + 15;
	//else y = y - (y mod 16) - (bbox_top - y);
	vsp = 0;
}

//Vertical object collisions
if (place_meeting(x, y + vsp, obj_solid)) {
	while(!place_meeting(x, y + sign(vsp), obj_solid)) {
		y += sign(vsp);
	}
	vsp = 0;
}
y += vsp;

scr_behavior_tree();

/*if (hunger < hunger_lower_threshold) {
	food = collision_circle(x, y, 5, obj_big_mushroom, false, true)
	if (food != noone) {
		if (food.x - x < 0) move = -1;
		else if (food.x - x > 0) move = 1;
		else {
			move = 0;
			movement = EAT1;
			state = scr_enemy_eat_state;
		}
	}
}*/

//Jump
/*if (place_meeting(x, y + 1, obj_solid) || (p1 != 0 || p2 != 0) && bbox_side != bbox_top) {
	vsp = obj_input.jump_key * -jumpspd;
}*/