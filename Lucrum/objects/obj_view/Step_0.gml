///Resize window
if (keyboard_check_pressed(ord("Z")))
{
  zoom++;
  
  if(zoom > max_zoom) zoom = 1;
  
  window_set_size(ideal_width * zoom, ideal_height * zoom);
  surface_resize(application_surface, ideal_width * zoom, ideal_height * zoom);
  alarm[0] = 1;
}

//Follow player
if (camera_following != "none") {
	view_x = camera_following.x - view_w/2;
	view_y = (camera_following.y - 20) - view_h/2;
}

//Clamp camera to room dimensions
view_x = clamp(view_x, 0, room_width - view_w);
view_y = clamp(view_y, 0, room_height - view_h);
