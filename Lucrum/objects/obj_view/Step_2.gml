///Set camera view properties
camera_set_view_size(view_camera[0], view_w, view_h);

var _round = view_w / surface_get_width(application_surface);
camera_set_view_pos(view_camera[0], scr_round_n(view_x, _round), scr_round_n(view_y, _round));