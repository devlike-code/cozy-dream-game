
function outlines_initialize() {
	outline_opacity = 1.0;
	setting_uniform_red = shader_get_uniform(shader_outline, "red");
	setting_uniform_green = shader_get_uniform(shader_outline, "green");
	setting_uniform_blue = shader_get_uniform(shader_outline, "blue");
	setting_uniform_pixel_w = shader_get_uniform(shader_outline, "pixelW");
	setting_uniform_pixel_h = shader_get_uniform(shader_outline, "pixelH");
	setting_uniform_edge_opacity = shader_get_uniform(shader_outline, "edgeOpacity");
}

function outlines_draw(_r = 1.0, _g = 1.0, _b = 1.0) {
	var texture = sprite_get_texture(sprite_index, image_index);
	var width = texture_get_texel_width(texture);
	var height = texture_get_texel_height(texture);

	shader_set(shader_outline);
	shader_set_uniform_f(setting_uniform_red, _r);
	shader_set_uniform_f(setting_uniform_green, _g);
	shader_set_uniform_f(setting_uniform_blue, _b);
	shader_set_uniform_f(setting_uniform_pixel_w, width);
	shader_set_uniform_f(setting_uniform_pixel_h, height);
	shader_set_uniform_f(setting_uniform_edge_opacity, outline_opacity);
	draw_self();
	shader_reset();
}