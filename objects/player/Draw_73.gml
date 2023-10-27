/// @description Insert description here
event_inherited();

var pos = self.grid_target;
var current_crop = manager_items.crop_fields.get_crop_at(pos.x, pos.y);

if current_crop != noone {
	draw_sprite(spr_speech_balloon, 0, x, y);
	draw_sprite(global.crop_fruits[current_crop.crop], 0, x, y);
}