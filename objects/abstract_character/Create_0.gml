
take_over_and_wait_for_end_of_animation = false;
waiting_on_item = noone;

last_area = 0;
pivot_position_x = 32;
pivot_position_y = 64;
pivot_offset_x = 0;
pivot_offset_y = 6;
pivot = { x: 0, y: 0 };

target_alpha = 1.0;

grid_target = { x: 0, y: 0 };

function update_area() {
	var _area = get_current_area(self);
	if _area != 0 {
		last_area = _area;
	}
}

function distance_from_pivot(_x, _y) {
	return sqrt(sqr(pivot.x - _x) + sqr(pivot.y - _y));
}

function update_pivot() {
	pivot.x = x + pivot_position_x - pivot_offset_x;
	pivot.y = y + pivot_position_y - pivot_offset_y;
	grid_target.x = pivot.x div 32;
	grid_target.y = pivot.y div 32;
}

attached_collision = instance_create_layer(
	pivot.x, pivot.y, 
	"Instances", 
	abstract_collision);

attached_collision.owner = self;

attached_collision.image_xscale = (collision_size_x * 4) / sprite_width;
attached_collision.image_yscale = (collision_size_y * 4) / sprite_height;

frame_transition = 0;
frame_index = 0;
transition_start_over = false;

fsm = new SnowState("idle")
	.add("idle", {
		enter: function() {
			frame_transition = 0;
			frame_index = 0;
			
			update_pivot();
			update_area();
		},
		step: function() {}
	})
	.add("loop", {
		enter: function() {
			if transition_start_over {
				frame_transition = 0;
				frame_index = 0;
			}
		},
		step: function() {			
			frame_transition += CHAR_ANIM_SPEED * animation_speed_mod * (1.0 / 60.0);
			frame_index = round(frame_transition);
			
			if !take_over_and_wait_for_end_of_animation {
				var _v = char_direction_to_vector(turn_direction);
				x += _v.x * movement_speed;
				y += _v.y * movement_speed;
				update_pivot();
			
				if collision_with_world(self, collision_size_x, collision_size_y) {
					x -= _v.x * movement_speed;
					y -= _v.y * movement_speed;
					update_pivot();
				} else {
					update_area();
				}
			}
		}
	})
	.add_wildcard_transition("halt", "idle", function() { return true; })
	.add_wildcard_transition("goto", "loop", function() { return true; });

function go_to_idle() {
	fsm.trigger("halt");
}

function go_to_anim(_new_state, _start_over = false) {
	transition_start_over = _start_over;
	current_action = _new_state;
	fsm.trigger("goto");
}
