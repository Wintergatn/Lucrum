///Instantiate objects

if (inst_655E2233.active && instantiate == false) {
	room_instance_add(room_previous(room), 639, 239, obj_wisp_pillar);
	show_debug_message("instantiating");
	instantiate = true;
}