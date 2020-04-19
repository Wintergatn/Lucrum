///scr_move_state
obj_player.movement = MOVE;

image_speed = 1;

var bbox_side;

move = obj_input.right_key + obj_input.left_key;

hsp = move * movespd;

hsp += hsp_fraction;
vsp += vsp_fraction;

//Gravity
if (vsp < 10) {
	vsp += grav;
}

//hsp_fraction = hsp - (floor(abs(hsp)) * sign(hsp));
hsp_fraction = hsp mod 1;
hsp -= hsp_fraction;
//vsp_fraction = vsp - (floor(abs(vsp)) * sign(vsp));
vsp_fraction = vsp mod 1;
vsp -= vsp_fraction;

//Sprite indexes
if (move > 0 && jumping == false) {
	face = RIGHT;
	previousFace = RIGHT;
	alarm[1] = idleTimer;
}
if (move < 0 && jumping == false) {
	face = LEFT;
	previousFace = LEFT;
	alarm[1] = idleTimer;
}
if (jumping == true) {
	if (move > 0) {
		if (vsp > 0) face = UP_RIGHT_D;
		else face = UP_RIGHT_U;
		
		previousFace = RIGHT;
	} else if (move < 0) {
		if (vsp > 0) face = UP_LEFT_D;
		else face = UP_LEFT_U;
		previousFace = LEFT;
	}
	alarm[1] = idleTimer;
}
if (jumping == true && move == 0) {
	if (previousFace == RIGHT) {
		if (vsp > 0) face = UP_RIGHT_D;
		else face = UP_RIGHT_U;
	}
	if (previousFace == LEFT) {
		if (vsp > 0) face = UP_LEFT_D;
		else face = UP_LEFT_U;
	}
}
if (jumping == false && obj_input.right_key == false && obj_input.left_key == false
	&& face != DOWN_RIGHT && face != DOWN_LEFT) {
	face = previousFace;	
}

if (face == RIGHT || face == UP_RIGHT_U || face == UP_RIGHT_D) obj_player.dir = RIGHT;
if (face == LEFT || face == UP_LEFT_U || face == UP_LEFT_D) obj_player.dir = LEFT;

/*if (vsp == 0) {
	face = previousFace;	
}*/
/*if (vsp > 0) {
	bbox_side = bbox_top;
}
else bbox_side = bbox_bottom;
if (vsp < 0) {
	bbox_side = bbox_bottom;
}*/
if (move == 0) {
	image_index = 0;
}
if (move != 0) scr_skip_frame(obj_player);

//Horizontal tile collision
if (hsp > 0) bbox_side = bbox_right; else bbox_side = bbox_left;
p1 = tilemap_get_at_pixel(tilemap, bbox_side + hsp, bbox_top);
p2 = tilemap_get_at_pixel(tilemap, bbox_side + hsp, bbox_bottom);
if (p1 != 0) || (p2 != 0) { //Inside a tile
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
	//jumping = true;
	//if (vsp >= 0) y = y - (y mod 16) + 15 - (bbox_bottom - y);
	if (vsp >= 0) {
		y = y - (bbox_bottom mod 16) + 15;
	}
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

//Jump
if (place_meeting(x, y + 1, obj_solid) || (p1 != 0 || p2 != 0) && bbox_side != bbox_top) {
	vsp = obj_input.jump_key * -jumpspd;
	jumping = false;
} else if (vsp > 0 || vsp < 0) {
	jumping = true;
}

//Squat
if (obj_input.down_key_pressed && move == 0) {
	alarm[1] = idleTimer;
	if (face == RIGHT) {
		face = DOWN_RIGHT;
		previousFace = RIGHT;
	}
	else if (face == LEFT) {
		face = DOWN_LEFT;
		previousFace = LEFT;
	}
	//add freeze
}
if (obj_input.down_key_released) {
	face = previousFace;
}

//Interact
if (obj_input.interact_key_pressed && interacting == false) {
	if (face == RIGHT) instance_create_depth(x + 5, y - 10, 200, obj_interact_collision);
	else instance_create_depth(x - 20, y - 10, 200, obj_interact_collision);
	if (obj_input.interact_key_released) interacting = false;
}

//Ember
if (obj_input.ember_key) {
	embered = !embered;
	//if (embered && room_exists(emberIndex) && room != emberIndex) {
	/*if (embered && room_exists(asset_get_index(emberRoom))) {
		room_goto(asset_get_index(emberRoom));
		show_debug_message("Going to ember room");
	}
	else if (embered == false && room_exists(asset_get_index(currentRoom))) {
		room_goto(asset_get_index(currentRoom));
		show_debug_message("Going to normal room");
	}*/
	if (embered) {
		room_goto(emberIndex);
	}
	else {
		//won't work for going between ember rooms
		room_goto_previous();
	}
}