///Draw lighting
surface_set_target(lighting);

draw_set_color(c_black);
draw_rectangle(0, 0, room_width, room_height, false);

gpu_set_blendmode(bm_add);
with(obj_light) {
	draw_circle_color(x, y, radius, col, c_black, false);	
}
gpu_set_blendmode(bm_normal);

surface_reset_target();

shader_set(shd_lighting);

var tex = surface_get_texture(lighting);
var handle = shader_get_sampler_index(shd_lighting, "lighting");
texture_set_stage(handle,tex);

draw_surface(application_surface, 0, 0);

shader_reset();