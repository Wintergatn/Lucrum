///Activate lantern on collision with interact object

if (alarm[0] == -1) active = !active;

if (active) {
	obj_wisp.obj_following = id;
	if (alarm[0] == -1) alarm[0] = 35;
}
else {
	image_index = 0;
	image_speed = 0;
	obj_wisp.obj_following = obj_player;
	obj_wisp.visible = true;
}