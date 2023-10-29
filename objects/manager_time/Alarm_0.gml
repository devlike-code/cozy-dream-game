/// @description Insert description here
// You can write your code in this editor

show_debug_message("HOUR MARK!");
hour += 1;
if hour >= 24 {
	hour = 0;
	day += 1;
	day = day % 7;
	manager_items.crop_fields.pass_time();
}

alarm_set(0, hour_length * room_speed);