/// @description Insert description here
// You can write your code in this editor
var c = hour_colors[hour % 24];
var color = make_color_rgb(c.r, c.g, c.b);
draw_set_alpha(c.a);
draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), color, color, color, color, false);
draw_set_alpha(1);








