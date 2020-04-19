///Test code
var bbox_side;

key_right = keyboard_check(vk_right);
key_left = keyboard_check(vk_left);
key_up = keyboard_check(vk_up);
key_down = keyboard_check(vk_down);

hsp = (key_right - key_left) * 2;
vsp = (key_down - key_up) * 2;

hsp += hsp_fraction;
vsp += vsp_fraction;

hsp_fraction = hsp - (floor(abs(hsp)) * sign(hsp));
//hsp_fraction = hsp mod 1;
hsp -= hsp_fraction;
vsp_fraction = vsp - (floor(abs(vsp)) * sign(vsp));
//vsp_fraction = vsp mod 1;
vsp -= vsp_fraction;

//Horizontal
if (hsp > 0) bbox_side = bbox_right; else bbox_side = bbox_left;
p1 = tilemap_get_at_pixel(tilemap, bbox_side + hsp, bbox_top);
p2 = tilemap_get_at_pixel(tilemap, bbox_side + hsp, bbox_bottom);
if (p1 != 0) || (p2 != 0) { //Inside a tile
	if (hsp > 0) x = x - (x mod 16) + 15 - (bbox_right - x);
	else x = x - (x mod 16) - (bbox_left - x);
	hsp = 0;
}
x += hsp;

//Vertical
if (vsp >= 0) bbox_side = bbox_bottom; else bbox_side = bbox_top;
p1 = tilemap_get_at_pixel(tilemap, bbox_left, bbox_side + vsp);
p2 = tilemap_get_at_pixel(tilemap, bbox_right, bbox_side + vsp);
if (p1 != 0) || (p2 != 0) {
	//if (vsp >= 0) y = y - (y mod 16) + 15 - (bbox_bottom - y);
	if (vsp >= 0) y = y - (bbox_bottom mod 16) + 15;
	else y = y - (y mod 16) - (bbox_top - y);
	vsp = 0;
}
y += vsp;

show_debug_message("y: " + string(y));
show_debug_message("yto: " + string(y - (bbox_bottom mod 16) + 15));
show_debug_message("x: " + string(x));
show_debug_message("xto: " + string(x - (x mod 16) - (bbox_left - x)));