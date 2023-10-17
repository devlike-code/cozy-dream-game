
function inventory_init(_width = 8, _height = 3) {
	inventory = ds_grid_create(_width, _height);
	ds_grid_clear(inventory, noone);
	
	return { x: 0, y: 0, width: _width, height: _height, inventory: inventory };
}

function inventory_get_selected(_i) {
	return ds_grid_get(_i.inventory, _i.x, _i.y);
}

function inventory_remove_selected(_i) {
	ds_grid_set(_i.inventory, _i.x, _i.y, noone);
}

function inventory_draw(_i, _offset_x = 10, _offset_y = 10) {
	for (var i = 0; i < _i.width; i++) {
		for (var j = 0; j < _i.height; j++) {
			var old_color = draw_get_color();
			draw_set_color(c_gray);
			draw_rectangle(_offset_x + i * 36, _offset_y + j * 36, _offset_x + i * 36 + 32, _offset_y + j * 36 + 32, true);
			draw_set_color(old_color);
			var item = ds_grid_get(_i.inventory, i, j);
			if item != noone {
				draw_sprite(item.image, 0, _offset_x + i * 36 + 16, _offset_y + j * 36 + 16);
			}
		}
	}
	
	var old_color = draw_get_color();
	draw_set_color(c_green);
	draw_rectangle(_offset_x + _i.x * 36 + 1, _offset_y + _i.y * 36 + 1, _offset_x + _i.x * 36 + 32 - 1, _offset_y + _i.y * 36 + 32 - 1, true);
	draw_rectangle(_offset_x + _i.x * 36, _offset_y + _i.y * 36, _offset_x + _i.x * 36 + 32, _offset_y + _i.y * 36 + 32, true);
	draw_set_color(old_color);
}

function inventory_add(_i, _item) {
	var found_x = -1;
	var found_y = -1;
	var done = false;
	
	for (var i = 0; i < _i.height; i++) {
		if done { break; }
		for (var j = 0; j < _i.width; j++) {
			if done { break; }
			
			if ds_grid_get(_i.inventory, j, i) == noone {
				found_x = j;
				found_y = i;
				done = true;
				break;
			}
		}
	}
	
	if done {
		ds_grid_set(_i.inventory, found_x, found_y, _item.item_definition);
	}
	
	instance_destroy(_item);
}

function inventory_move(_i, _dx, _dy) {
	var new_x = _i.x + _dx;
	var new_y = _i.y + _dy;
	
	if new_x >= _i.width {
		new_x = new_x - _i.width;
	}
	
	if new_x < 0 {
		new_x = _i.width + new_x;
	}
	
	if new_y >= _i.height {
		new_y = new_y - _i.height;
	}
	
	if new_y < 0 {
		new_y = _i.height + new_y;
	}
	
	_i.x = new_x;
	_i.y = new_y;
}
