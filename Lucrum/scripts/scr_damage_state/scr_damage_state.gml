///scr_damage_state
var bbox_side;
movement = DAMAGE;

if (knockback == false) {
	/*//angle = point_direction(p_centerX, p_centerY, collidedWith.centerX, collidedWith.centerY);
	angle= point_direction(collidedWith.centerX, collidedWith.centerY, p_centerX, p_centerY);
	//hsp = cos(angle) * knockbackspd;
	//vsp = sin(angle) * knockbackspd;
	hsp = lengthdir_x(1, angle);
	ysp = lengthdir_y(1, angle);
	
	show_debug_message("angle: " + string(angle));
	show_debug_message("cos: " + string(hsp));
	show_debug_message("sin: " + string(vsp));*/
	//if (distance_to_object(collidedWith) > 0) {
	//if (point_distance(p_centerX, p_centerY, collidedWith.centerX, collidedWith.centerY) > 0) {
	
	dist = collidedWith.x - x;
	//Check if player is on left or right of enemy
	if (dist > 0) {
		face = RIGHT;
		previousFace = RIGHT;
		hsp = -knockbackspd;
	} else {
		face = LEFT;
		previousFace = LEFT;
		hsp = knockbackspd;
	}
	knockback = true;
}
if (dist <= 0) {
	hsp -= 0.2;
	if (embered) obj_wisp.x += 0.4;
		
	//Clamp hsp
	if (hsp < 0) hsp = 0;
}
if (dist > 0) {
	hsp += 0.2;
	if (embered) obj_wisp.x -= 0.4;
		
	//Clamp hsp
	if (hsp > 0) hsp = 0;
}
	
//Change back to move state after knockback
if (hsp == 0) {
	state = scr_move_state;
	knockback = false;
}

//hsp += hsp_fraction;
vsp += vsp_fraction;

//Gravity
if (vsp < 10) {
	vsp += grav;
}

//hsp_fraction = hsp mod 1;
hsp -= hsp_fraction;
vsp_fraction = vsp mod 1;
vsp -= vsp_fraction;

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