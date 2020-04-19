///Get room IDs for embering

//Need to get every time tilemap collsions are changed
tilemap = layer_tilemap_get_id("Collision");

if (instance_exists(obj_wisp)) {
	switch dir {
	case RIGHT:
		obj_wisp.x = obj_player.x - obj_wisp.x_offset;
		break;
	case LEFT:
		obj_wisp.x = obj_player.x + obj_wisp.x_offset;
		break;
	}
	obj_wisp.y = obj_player.y;	
}

/*if (embered) {
	emberRoom = room_get_name(room);
	emberIndex = asset_get_index(room);
	currentRoom = string_delete(emberRoom, string_length(emberRoom), 1);
	currentIndex = asset_get_index(emberRoom);
} else {
	currentRoom = room_get_name(room);
	currentIndex = asset_get_index(room);
	emberRoom = currentRoom + "E";
	emberIndex = asset_get_index(emberRoom);
}

show_debug_message("ember room: " + string(emberRoom));
show_debug_message("ember index: " + string(emberIndex));
show_debug_message("current room: " + string(currentRoom));
show_debug_message("current index: " + string(currentIndex));*