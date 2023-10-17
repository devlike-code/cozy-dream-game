
var nearest_item = instance_nearest(pivot.x, pivot.y, abstract_pickup_item);
if nearest_item != noone {
	if distance_from_pivot(nearest_item.x, nearest_item.y) < 32 {
		focused_item = nearest_item;
	}
}

var move_input = false;
var action_input = false;
var tool_input = false;
var inventory_move_vec = { x: 0, y: 0 };

if input_check("up") { move_input = true; turn_direction = char_layout_direction.UP; }
else if input_check("left") { move_input = true; turn_direction = char_layout_direction.LEFT; }
else if input_check("down") { move_input = true; turn_direction = char_layout_direction.DOWN; }
else if input_check("right") { move_input = true; turn_direction = char_layout_direction.RIGHT; }

if input_check_released("action") { action_input = true; }
else if input_check_released("special") { tool_input = true; }

if input_check_released("inventory_up") { inventory_move_vec.y = -1; }
else if input_check_released("inventory_down") { inventory_move_vec.y = 1; }
else if input_check_released("inventory_left") { inventory_move_vec.x = -1; }
else if input_check_released("inventory_right") { inventory_move_vec.x = 1; }

if inventory_move_vec.x != 0 || inventory_move_vec.y != 0 {
	inventory_move(inventory, inventory_move_vec.x, inventory_move_vec.y);
}

if action_input && focused_item != noone {
	inventory_add(inventory, focused_item);
	focused_item = noone;
}

var non_walk_action_taken = noone;

if tool_input {
	var selected_item = inventory_get_selected(inventory);
	if selected_item != noone {
		// TODO: action here will happen instantly, we might want to wait
		non_walk_action_taken = selected_item.action;
		selected_item.use(self);
	}
}

if non_walk_action_taken != noone {
	go_to_anim(non_walk_action_taken);
} else if move_input {
	go_to_anim("walk");
} else {
	go_to_idle();
}

if keyboard_check_released(ord("1")) {
	base_index = manager_characters.bases.next_variant(base_index);
}

if keyboard_check_released(ord("2")) {
	torso_index = manager_characters.torso.next_variant(torso_index);
}

if keyboard_check_released(ord("3")) {
	feet_index = manager_characters.feet.next_variant(feet_index);
}

if keyboard_check_released(ord("4")) {
	legs_index = manager_characters.legs.next_variant(legs_index);
}

if keyboard_check_released(ord("5")) {
	hair_index = manager_characters.hair.next_variant(hair_index);
}