
if name == "" || !ds_map_exists(global.items, name) {
	show_error("ERROR: ITEM DEFINITION " + name + " NOT FOUND (IN ITEM " + object_get_name(object_index) + ")", true);
}

item_definition = global.items[? name];
sprite_index = item_definition.image;