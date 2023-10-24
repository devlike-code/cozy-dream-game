
enum crops {
	TOMATO = 0,
	POTATO = 1,
	CARROT = 2,
	ARTICHOKE = 3,
	PEPPER = 4,
	GOURD = 5,
	CORN = 6,
}

global.crop_grow_speeds = [	// measured in days
	[ 3, 4, 5, 6 ],		// TOMATO
	[ 2, 3, 5, 5 ],		// POTATO
	[ 3, 2, 4, 5 ],		// CARROT
	[ 4, 4, 4, 5 ],		// ARTICHOKE
	[ 3, 4, 5, 6 ],		// PEPPER
	[ 5, 4, 5, 4 ],		// GOURD
	[ 4, 4, 5, 5 ],		// CORN
];

global.crop_growth = [	// sprites
	spr_crops_tomato,
	spr_crops_potato,
	spr_crops_carrot,
	spr_crops_artichoke,
	spr_crops_pepper,
	spr_crops_gourd,
	spr_crops_corn,
]

function CropField(_room_name, _width, _height) constructor {
	room_name = _room_name;
	crop_field = ds_grid_create(_width, _height);
	ds_grid_clear(crop_field, noone);
	
	static remove_crop_at = function(_x, _y) {
		if ds_grid_get(crop_field, _x, _y) != noone {
			ds_grid_set(crop_field, _x, _y, noone);
		}
	}
	
	static has_crop_at = function(_x, _y) {
		return ds_grid_get(crop_field, _x, _y) != noone;
	}
	
	static add_crop_at = function(_x, _y, _crop) {
		if ds_grid_get(crop_field, _x, _y) == noone {
			var fresh_crop = instance_create_layer(16 + 32 * _x + irandom_range(-2, 2), 16 + 32 * _y + irandom_range(-2, 2), "Instances", abstract_crop, {
				grid_x: _x, grid_y: _y
			});
			fresh_crop.sprite_index = global.crop_growth[_crop];
			ds_grid_set(crop_field, _x, _y, { crop: _crop, stage: 0, days: 0, instance: fresh_crop });
		}
	}
	
	static pass_time = function() {
		for (var _i = 0; _i < ds_grid_width(crop_field); _i++) {
			for (var _j = 0; _j < ds_grid_height(crop_field); _j++) {
				var item = ds_grid_get(crop_field, _i, _j);
				if item != noone {
					item.days += 1;
					if item.days > global.crop_grow_speeds[item.crop][item.stage] {
						item.days = 0;
						item.stage += 1;
						item.instance.image_index = item.stage;
						ds_grid_set(crop_field, _i, _j, item);
					}
				}
			}
		}
	}
}

function crops_can_be_planted_on(_grid_point) {
	var crops = layer_tilemap_get_id("Tiles_Crops");
	return tilemap_get(crops, _grid_point.x, _grid_point.y) > 1;
}

function crops_make_plantable(_grid_point) {
	var crops = layer_tilemap_get_id("Tiles_Crops");
	tilemap_set(crops, 2, _grid_point.x, _grid_point.y);
}
