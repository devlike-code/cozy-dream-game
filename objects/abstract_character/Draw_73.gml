
if manager_debug.debug_on {
	draw_circle(pivot.x, pivot.y, 3, false);
	draw_rectangle(
		pivot.x - collision_size_x, 
		pivot.y - collision_size_y, 
		pivot.x + collision_size_x, 
		pivot.y + collision_size_y, 
		true);
}

draw_set_alpha(0.3);
draw_rectangle(32 * grid_target.x, 32 * grid_target.y, 32 * grid_target.x + 32, 32 * grid_target.y + 32, true);
draw_set_alpha(1.0);