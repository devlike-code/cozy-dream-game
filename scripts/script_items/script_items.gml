
enum item_category {
	NONE = 0,
	SEED = 1,
	CROP = 2,
	TOOL = 3,
};

global.items = ds_map_create();

function Item(_name, _image, _category) constructor {
	name = _name;
	image = _image;
	tool = 0;
	category = _category;
	action = noone;
	spendable = false;
	description = "ITEM DESCRIPTION MISSING";
	ds_map_add(global.items, name, self); 
	
	effect = function(_user) {
		show_debug_message("WARNING: the {0} tool's usage is not set, so it does nothing when called.");
	};
	
	static presents_action = function(_action) {
		action = _action;
		return self;
	};
	
	static uses_tool = function(_tool) {
		tool = _tool;
		return self;
	}
	
	static spend_when_used = function() {
		spendable = true;
		return self;
	}
	
	static do_when_used = function(_func) {
		effect = _func;	
		return self;
	}
	
	static has_description = function(_desc) {
		description = _desc;
		return self;
	}
	
	static use = function(_user) {
		if effect(_user) {
			if spendable {
				inventory_remove_selected(_user.inventory);
			}
		}
	}
}