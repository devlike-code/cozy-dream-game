// This script handles character rendering. Our characters have multiple layers and many angles,
// so to make this easier, let's just make it load through a single image, instead of having to cut them up.

#macro CHAR_ANIM_SPEED 10

// enums:
enum char_layout_layer {
	BASE,
	FEET,
	HAIR,
	LEGS,
	TORSO
};

enum char_layout_direction {
	UP = 0,
	LEFT = 1,
	DOWN = 2,
	RIGHT = 3
};

function char_direction_to_vector(_dir) {
	switch _dir {
		case char_layout_direction.UP: return { x: 0, y: -1 };
		case char_layout_direction.LEFT: return { x: -1, y: 0 };
		case char_layout_direction.DOWN: return { x: 0, y: 1 };
		case char_layout_direction.RIGHT: return { x: 1, y: 0 };
		default: return { x: 0, y: 0 };
	}
}

// structs:
function CharLayout(_name, _width, _height, _offset_x = 0, _offset_y = 0) constructor {
	name = _name;
	width = _width;
	height = _height;
	offset_x = _offset_x;
	offset_y = _offset_y;
	action_lengths = ds_map_create();
	action_index = ds_map_create();
	
	static add_action = function(_name, _frame_count) {
		ds_map_add(self.action_lengths, _name, _frame_count);
		ds_map_add(self.action_index, _name, ds_map_size(self.action_index));
		return self;
	}
	
	static get_length = function(_name) {
		if ds_map_exists(self.action_lengths, _name) {
			return self.action_lengths[? _name];
		} else {
			return 0;
		}
	}
	
	static get_frame_rect = function(_name, _dir, _frame) {
		var _index = self.action_index[? _name];
		var _len = self.action_lengths[? _name];
		var _x = self.offset_x + (_frame % _len) * self.width;		
		var _y = self.offset_y + (_index * 4 + _dir) * self.height;
		return { x: _x, y: _y, width: self.width, height: self.height };
	}
};

function CharLayer(_name, _layer, _sprite) constructor {
	name = _name;
	char_layer = _layer;
	sprite = _sprite;
};

function CharLayers(_layer) constructor {
	layer_kind = _layer;
	layers_by_name = ds_map_create();
	layers_in_order = ds_list_create();
	
	static add_variant = function(_name, _sprite) {
		var _char_layer = new CharLayer(_name, self.layer_kind, _sprite);
		ds_map_add(self.layers_by_name, _name, _char_layer);
		ds_list_add(self.layers_in_order, _char_layer);
		return self;
	}
	
	static get_all_variants = function() {
		return self.layers_in_order;
	}
	
	static next_variant = function(_index) {
		return (_index + 1) % ds_list_size(self.layers_in_order);
	}
	
	static draw = function(_index, _action, _turn_direction, _frame_index, _x, _y, _alpha = 1.0, _layout = manager_characters.layout) {
		var _base = self.layers_in_order[| _index];
		var _rect = _layout.get_frame_rect(_action, _turn_direction, _frame_index);
		draw_sprite_part_ext(_base.sprite, 0, _rect.x, _rect.y, _rect.width, _rect.height, _x, _y, 1, 1, c_white, _alpha);
	}
}