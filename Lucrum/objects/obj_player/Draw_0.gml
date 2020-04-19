///Draw sprite for damage animation

draw_self();

//if (flash > 0) {
//	flash -= 0.05;
	
	shader_set(shd_flash);
	shader_alpha = shader_get_uniform(shd_flash, "_alpha");
	shader_set_uniform_f(shader_alpha, flash);

	draw_self();

	shader_reset();
//}

//draw_self();

/*if (flash > 0) {
	flash = -0.05;
	
	gpu_set_blendmode(bm_add);

	shader_set(shd_flash);
	shader_alpha = shader_get_uniform(shd_flash, "_alpha");
	shader_set_uniform_f(shader_alpha, flash);
	draw_self();

	shader_reset();
	gpu_set_blendmode(bm_normal);
}*/