
enum collision_layers {
	UNWALKABLE = 1,
	PASSAGE = 2,
	WALKABLE = 3,
}

global.world_collision_layer = noone;

function collision_with_world(_actor, _size_x, _size_y) {
	if global.world_collision_layer == noone {
		global.world_collision_layer = layer_tilemap_get_id("Tiles_Borders");
	}

	if tilemap_get_at_pixel(global.world_collision_layer, _actor.pivot.x - _size_x, _actor.pivot.y - _size_y) == collision_layers.UNWALKABLE { return true; }
	if tilemap_get_at_pixel(global.world_collision_layer, _actor.pivot.x - _size_x, _actor.pivot.y + _size_y) == collision_layers.UNWALKABLE { return true; }
	if tilemap_get_at_pixel(global.world_collision_layer, _actor.pivot.x + _size_x, _actor.pivot.y + _size_y) == collision_layers.UNWALKABLE { return true; }
	if tilemap_get_at_pixel(global.world_collision_layer, _actor.pivot.x + _size_x, _actor.pivot.y - _size_y) == collision_layers.UNWALKABLE { return true; }
	if tilemap_get_at_pixel(global.world_collision_layer, _actor.pivot.x, _actor.pivot.y) == collision_layers.UNWALKABLE { return true; }
	
	_actor.attached_collision.x = _actor.pivot.x;
	_actor.attached_collision.y = _actor.pivot.y;
	
	with _actor.attached_collision {
		var collided = instance_place(x, y, abstract_collision);
		if collided != noone {
			return collided.owner != self.owner;
		}
	}
	
	return false;
}

function get_current_area(_actor) {
	var _area = tilemap_get_at_pixel(layer_tilemap_get_id("Tiles_Rooms"), _actor.pivot.x, _actor.pivot.y);
	return _area;
}
	